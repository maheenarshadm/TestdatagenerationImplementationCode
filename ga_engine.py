

import random
import copy
import time
from typing import Any, Callable, Dict, List, Optional, Tuple

from fitness import evaluate
from enhanced_operators import O6, apply_all_operators

# ── Hyper-parameters  (Table 9 in the paper) ──────────────────────────────────
POP_SIZE              = 30
MAX_EVALUATIONS       = 3000
MUTATION_RATE         = 0.20     # base rate; raised adaptively on stagnation
CROSSOVER_RATE        = 0.70
TOURNAMENT_SIZE       = 3
ELITE_COUNT           = 2
STAGNATION_LIMIT      = 8        # generations without improvement → trigger
STAGNATION_RATE_BOOST = 2.0      # multiply MUTATION_RATE when stagnant
MAX_ADAPTIVE_RATE     = 0.50     # hard cap for adaptive rate
RESEED_FRACTION       = 3        # replace bottom POP_SIZE // RESEED_FRACTION
SEED_FRACTION         = 0.50     # fraction of initial pop that is domain-seeded


# ─────────────────────────────────────────────────────────────────────────────
# Tournament selection
# ─────────────────────────────────────────────────────────────────────────────

def _tournament(
    population_with_fitness: List[Tuple],
    k: int = TOURNAMENT_SIZE
) -> Tuple:
    """
    Return the individual with highest fitness from k random candidates.
    Each individual is a tuple (..., fitness, triggered).
    Fitness is assumed to be the second-to-last element.
    """
    candidates = random.sample(
        population_with_fitness,
        min(k, len(population_with_fitness))
    )
    return max(candidates, key=lambda x: x[-2])   # x[-2] = fitness


# ─────────────────────────────────────────────────────────────────────────────
# Population initialisation
# ─────────────────────────────────────────────────────────────────────────────

def _build_initial_population(
    chromosome_builder: Callable,
    seeds: Optional[Dict],
    rule_id: str,
    n: int = POP_SIZE
) -> List[Tuple]:
    """
    Build the initial population using a hybrid seeding strategy:
      • First SEED_FRACTION × N individuals: domain-seeded
      • Remaining: randomly initialised

    Parameters
    ----------
    chromosome_builder : callable
        Function that returns (chromosome, entity_ids).
    seeds : dict or None
        Domain seeds for the rule; {attr: target_value}.
    rule_id : str
        ID of the target rule (used to look up seeds).
    n : int
        Population size.
    """
    seed_slots = int(n * SEED_FRACTION)
    population = []

    for i in range(n):
        chromosome, entity_ids = chromosome_builder()
        use_seed = (seeds is not None and i < seed_slots and rule_id in seeds)
        if use_seed:
            chromosome = _apply_seeds(chromosome, seeds[rule_id])
        population.append((chromosome, entity_ids))

    return population


def _apply_seeds(
    chromosome: Dict,
    seed_values: Dict[str, Any]
) -> Dict:
    """
    Apply domain-directed seed overrides to a chromosome.
    Seed values steer derived attribute proxies toward target thresholds.
    """
    c = copy.deepcopy(chromosome)
    now_epoch = int(time.time())
    day_s     = 86_400

    for attr, val in seed_values.items():
        # Epoch/temporal overrides
        if "days_since" in attr.lower() or "daysSince" in attr:
            days = int(val)
            for table, rows in c.items():
                for row in rows:
                    for col in row:
                        if "time" in col.lower() or "date" in col.lower():
                            row[col] = now_epoch - days * day_s
                            break
                    break

        # Direct numeric overrides — find matching column by attribute name
        else:
            for table, rows in c.items():
                for row in rows:
                    if attr in row:
                        row[attr] = val
                    # Snake-case → camelCase lookup
                    snake = attr.lower().replace("_", "")
                    for col in row:
                        if col.lower().replace("_", "") == snake:
                            row[col] = val
                            break

    return c


# ─────────────────────────────────────────────────────────────────────────────
# Main GA loop  (Algorithm 3)
# ─────────────────────────────────────────────────────────────────────────────

def run_ga(
    rule: Dict,
    grounding: Dict,
    chromosome_builder: Callable,
    seeds: Optional[Dict] = None,
    max_evals: int = MAX_EVALUATIONS,
    verbose: bool = False
) -> Dict:
    """
    Run the GA to find a schema-valid chromosome that triggers `rule`.

    Parameters
    ----------
    rule : dict
        DMN rule with 'id', 'when', 'then'.
    grounding : dict
        Predicate grounding G(rᵢ): attr → {sql, type, operator, threshold, ...}.
    chromosome_builder : callable
        Returns (chromosome, entity_ids); encapsulates the FK-closure
        construction and schema enforcement for the subject system.
    seeds : dict or None
        Domain seeds {rule_id: {attr: value}} for population initialisation.
    max_evals : int
        Evaluation budget B (default 3,000).
    verbose : bool
        Print progress every 10 generations.

    Returns
    -------
    dict with keys:
        covered         : bool
        fitness         : float  (best f(C, r) achieved)
        evaluations     : int
        best_chromosome : dict or None
        best_entity_ids : dict or None
        fitness_curve   : list[float]
        schema_validity_rate : float
        per_predicate_distances : list[float] (at best chromosome)
    """
    rule_id      = rule.get("id", "unknown")
    best_chrom   = None
    best_eids    = None
    best_fitness = -1.0
    best_ppdist  = []
    evals        = 0
    sv_count     = 0
    fitness_curve: List[float] = []

    # ── Initialise population ─────────────────────────────────────────────────
    raw_pop = _build_initial_population(chromosome_builder, seeds, rule_id)

    # ── Evaluate initial population ───────────────────────────────────────────
    pop: List[Tuple] = []
    for chrom, eids in raw_pop:
        valid, triggered, fitness, ppd, err = evaluate(chrom, eids, rule, grounding)
        evals += 1
        if valid:
            sv_count += 1
        pop.append((chrom, eids, fitness, triggered, ppd))
        if triggered and fitness > best_fitness:
            best_chrom, best_eids, best_fitness, best_ppdist = \
                copy.deepcopy(chrom), copy.deepcopy(eids), fitness, ppd

    fitness_curve.append(max(x[2] for x in pop))

    # Early exit
    if best_chrom is not None:
        return _result(True, best_fitness, evals, best_chrom, best_eids,
                       fitness_curve, sv_count, best_ppdist)

    # ── Stagnation state ──────────────────────────────────────────────────────
    stag_counter  = 0
    last_best     = max(x[2] for x in pop)
    current_rate  = MUTATION_RATE
    generation    = 0

    # ── Main loop ─────────────────────────────────────────────────────────────
    while evals < max_evals:
        generation += 1
        new_pop: List[Tuple] = []

        # Elitism: top-e chromosomes preserved unchanged
        sorted_pop = sorted(pop, key=lambda x: x[2], reverse=True)
        new_pop.extend(sorted_pop[:ELITE_COUNT])

        while len(new_pop) < POP_SIZE and evals < max_evals:
            pa = _tournament(pop)
            pb = _tournament(pop)

            # Crossover (O6) or clone
            if random.random() < CROSSOVER_RATE:
                child_chrom = O6(pa[0], pb[0])
            else:
                child_chrom = copy.deepcopy(pa[0])

            # Build per-predicate distance dict for operators
            ppd_dict = dict(zip(grounding.keys(), pa[4] or []))

            # Apply O4 → O3 → O2 → O5 → O1 in priority order
            child_chrom = apply_all_operators(
                child_chrom,
                grounding,
                ppd_dict,
                pa[1],
                mutation_rate=current_rate,
                o4_prob=0.75   # raised from 0.60
            )

            # Evaluate
            valid, triggered, fitness, ppd, err = \
                evaluate(child_chrom, pa[1], rule, grounding)
            evals += 1
            if valid:
                sv_count += 1

            new_pop.append((child_chrom, pa[1], fitness, triggered, ppd))

            if triggered and fitness > best_fitness:
                best_chrom  = copy.deepcopy(child_chrom)
                best_eids   = copy.deepcopy(pa[1])
                best_fitness = fitness
                best_ppdist  = ppd or []
                if verbose:
                    print(f"  Gen {generation} | eval {evals} | "
                          f"TRIGGERED f={fitness:.4f}")

        pop = new_pop
        gen_best = max(x[2] for x in pop)
        fitness_curve.append(gen_best)

        # ── Stagnation detection (lines 21–29 of Algorithm 3) ─────────────────
        if gen_best > last_best + 1e-6:
            stag_counter = 0
            last_best    = gen_best
            current_rate = MUTATION_RATE
        else:
            stag_counter += 1

        if stag_counter >= STAGNATION_LIMIT:
            # Double mutation rate (capped at MAX_ADAPTIVE_RATE)
            current_rate = min(current_rate * STAGNATION_RATE_BOOST,
                               MAX_ADAPTIVE_RATE)
            # Re-seed bottom 1/3
            n_reseed = POP_SIZE // RESEED_FRACTION
            sorted_for_reseed = sorted(pop, key=lambda x: x[2])
            for i in range(n_reseed):
                new_chrom, new_eids = chromosome_builder()
                new_chrom = _apply_seeds(new_chrom, (seeds or {}).get(rule_id, {}))
                ppd_dict  = dict(zip(grounding.keys(), sorted_for_reseed[i][4] or []))
                new_chrom = apply_all_operators(
                    new_chrom, grounding, ppd_dict, new_eids,
                    mutation_rate=current_rate)
                valid, triggered, fitness, ppd, _ = \
                    evaluate(new_chrom, new_eids, rule, grounding)
                evals += 1
                if valid:
                    sv_count += 1
                if evals >= max_evals:
                    break
                sorted_for_reseed[i] = (new_chrom, new_eids, fitness, triggered, ppd)
                if triggered and fitness > best_fitness:
                    best_chrom, best_eids, best_fitness, best_ppdist = \
                        copy.deepcopy(new_chrom), copy.deepcopy(new_eids), fitness, ppd
            pop = sorted_for_reseed
            stag_counter = 0

        if verbose and generation % 10 == 0:
            n_trig = sum(1 for x in pop if x[3])
            print(f"  Gen {generation:3d} | evals={evals:4d} | "
                  f"best={gen_best:.4f} | rate={current_rate:.2f} | "
                  f"trig={n_trig}/{POP_SIZE}")

    return _result(
        best_chrom is not None, best_fitness, evals,
        best_chrom, best_eids, fitness_curve, sv_count, best_ppdist
    )


# ─────────────────────────────────────────────────────────────────────────────
# Random baseline  (same budget, no GA guidance)
# ─────────────────────────────────────────────────────────────────────────────

def run_random(
    rule: Dict,
    grounding: Dict,
    chromosome_builder: Callable,
    max_evals: int = MAX_EVALUATIONS
) -> Dict:
    """
    Pure random baseline: generate chromosomes with no GA guidance.
    Used for RQ2 comparison.

    Same budget as GA — no mutation, crossover, seeding, or stagnation logic.
    Returns the same result dict structure as run_ga().
    """
    best_chrom   = None
    best_eids    = None
    best_fitness = -1.0
    best_ppdist  = []
    evals        = 0
    sv_count     = 0
    fitness_curve: List[float] = []
    triggered    = False

    while evals < max_evals:
        chrom, eids = chromosome_builder()
        valid, triggered, fitness, ppd, err = evaluate(chrom, eids, rule, grounding)
        evals += 1
        if valid:
            sv_count += 1
        if fitness > best_fitness:
            best_fitness = fitness
            best_chrom   = copy.deepcopy(chrom)
            best_eids    = copy.deepcopy(eids)
            best_ppdist  = ppd or []
        fitness_curve.append(best_fitness)
        if triggered:
            break

    return _result(
        triggered, best_fitness, evals,
        best_chrom, best_eids, fitness_curve, sv_count, best_ppdist
    )


# ─────────────────────────────────────────────────────────────────────────────
# Result dict constructor
# ─────────────────────────────────────────────────────────────────────────────

def _result(covered, fitness, evals, chrom, eids,
            curve, sv_count, ppd) -> Dict:
    return {
        "covered":               covered,
        "fitness":               round(fitness, 6),
        "evaluations":           evals,
        "best_chromosome":       chrom,
        "best_entity_ids":       eids,
        "fitness_curve":         curve,
        "schema_validity_rate":  round(sv_count / max(evals, 1), 4),
        "per_predicate_distances": ppd,
    }
