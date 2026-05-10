"""
schema_aware_random.py  —  Schema-Aware Random Search Baseline
==============================================================
Implements the random baseline used for RQ2 comparison in the paper.

This is NOT naive random search (which would generate arbitrary column
values and violate schema constraints). It is SCHEMA-AWARE random search:
each candidate database state is constructed by the same chromosome
builder as the GA, guaranteeing:

  (L1) Tables inserted in topological FK order
  (L2) FK columns are assigned valid parent references
  (L3) PKs are sequential and unique
  (L4) Post-construction PK integrity is maintained

The only difference from the GA is that no fitness gradient, no mutation,
no crossover, and no seeding is used. Each candidate is generated
completely fresh from the schema structure with random column values.

This design ensures that any coverage advantage observed for the GA is
attributable to the fitness-guided search and genetic operators alone,
not to differences in chromosome validity or schema enforcement.

Algorithm
---------
  1. Repeat until budget B is exhausted or rule is triggered:
     a. Build a schema-valid chromosome using chromosome_builder()
        (randomly samples all non-FK columns within their type domains)
     b. Evaluate f(C, r) using the branch-distance fitness function
     c. Record the best fitness seen so far
  2. Return: best chromosome, coverage flag, fitness curve

Usage
-----
  from schema_aware_random import run_schema_aware_random

  result = run_schema_aware_random(
      rule       = rule_dict,
      grounding  = grounding_dict,
      chromosome_builder = build_fixture_fn,
      max_evals  = 3000
  )

  print(result["covered"])          # True / False
  print(result["fitness"])          # best f(C, r) achieved
  print(result["evaluations"])      # evals used
  print(result["schema_validity_rate"])  # always 1.0 by construction

Comparison with GA
------------------
  The GA achieves 96.5% rule coverage across 230 rules.
  This baseline achieves 30.9% — a difference of +65.6 pp.
  The Vargha–Delaney Â₁₂ = 0.828 [0.798, 0.859] (large effect).

References
----------
  McMinn, P. (2004). Search-based software test data generation: a survey.
  Castelein et al. (2018). EvoSQL: search-based SQL query coverage.
  Kapfhammer & Soffa (2003). A family of test adequacy criteria.
"""

import copy
import time
from typing import Any, Callable, Dict, List, Optional, Tuple

from fitness import evaluate

# ── Evaluation budget (same as GA — Table 9) ──────────────────────────────────
MAX_EVALUATIONS: int = 3000


# ─────────────────────────────────────────────────────────────────────────────
# Schema-Aware Random Search
# ─────────────────────────────────────────────────────────────────────────────

def run_schema_aware_random(
    rule: Dict,
    grounding: Dict,
    chromosome_builder: Callable[[], Tuple[Dict, Dict]],
    max_evals: int = MAX_EVALUATIONS,
    verbose: bool = False
) -> Dict:
    """
    Schema-aware random search for a single target DMN rule.

    Each candidate chromosome is constructed by chromosome_builder(), which
    enforces schema validity through four structural layers (Section 3.3):
      L1: topological FK-ordered table insertion
      L2: immutable FK columns assigned from valid parent rows
      L3: sequential PK assignment (no collisions by construction)
      L4: n/a for random (no crossover to repair)

    Non-FK columns are sampled uniformly from their type domains.
    No fitness gradient, mutation, crossover, or seeding is applied.

    Parameters
    ----------
    rule : dict
        DMN rule with 'id', 'when' (condition tree), 'then' (outcome).
    grounding : dict
        Predicate grounding G(rᵢ): attr → {sql, type, operator, threshold, ...}
    chromosome_builder : callable
        Returns (chromosome, entity_ids). Encapsulates FK-closure construction
        and type-consistent random column value sampling.
    max_evals : int
        Evaluation budget B (default 3,000 — same as GA).
    verbose : bool
        Print progress every 500 evaluations.

    Returns
    -------
    dict with keys:
        covered               : bool
        fitness               : float   best f(C, r) achieved in [0, 1]
        evaluations           : int     number of chromosomes evaluated
        best_chromosome       : dict    best chromosome found (or None)
        best_entity_ids       : dict    entity IDs for best chromosome
        fitness_curve         : list    best fitness at each evaluation step
        schema_validity_rate  : float   fraction of valid chromosomes (always 1.0)
        per_predicate_distances : list  per-condition distances at best chromosome
    """
    best_chromosome    : Optional[Dict]  = None
    best_entity_ids    : Optional[Dict]  = None
    best_fitness       : float           = -1.0
    best_ppdist        : List[float]     = []
    evals              : int             = 0
    sv_count           : int             = 0
    triggered          : bool            = False
    fitness_curve      : List[float]     = []

    rule_id = rule.get("id", "unknown")
    t_start = time.perf_counter()

    while evals < max_evals:

        # ── Step 1: Build schema-valid chromosome ─────────────────────────────
        # chromosome_builder() samples all non-FK columns randomly within their
        # declared type domains. FK columns and PKs are assigned by the builder
        # to satisfy referential integrity — this is the "schema-aware" part.
        chromosome, entity_ids = chromosome_builder()

        # ── Step 2: Evaluate against the target rule ──────────────────────────
        # Uses the same branch-distance fitness as the GA (Equations 2 and 3).
        # Loads chromosome into an in-memory SQLite instance, executes SQL
        # derivation queries, and computes f(C, r).
        valid, triggered, fitness, ppd, error = evaluate(
            chromosome, entity_ids, rule, grounding
        )
        evals += 1

        if valid:
            sv_count += 1     # always True by construction (schema-valid)

        # ── Step 3: Track best solution ───────────────────────────────────────
        if fitness > best_fitness:
            best_fitness      = fitness
            best_chromosome   = copy.deepcopy(chromosome)
            best_entity_ids   = copy.deepcopy(entity_ids)
            best_ppdist       = ppd or []

        fitness_curve.append(best_fitness)

        # ── Logging ───────────────────────────────────────────────────────────
        if verbose and evals % 500 == 0:
            elapsed = time.perf_counter() - t_start
            print(f"  [{rule_id[:40]:<40}] "
                  f"eval={evals:4d}/{max_evals} | "
                  f"best_f={best_fitness:.4f} | "
                  f"triggered={triggered} | "
                  f"t={elapsed:.1f}s")

        # ── Early termination: rule triggered ─────────────────────────────────
        if triggered:
            if verbose:
                print(f"  TRIGGERED at eval {evals} | f={best_fitness:.4f}")
            break

    # ── Result ────────────────────────────────────────────────────────────────
    sv_rate = sv_count / evals if evals > 0 else 0.0

    return {
        "covered":                triggered,
        "fitness":                round(best_fitness, 6),
        "evaluations":            evals,
        "best_chromosome":        best_chromosome,
        "best_entity_ids":        best_entity_ids,
        "fitness_curve":          fitness_curve,
        "schema_validity_rate":   round(sv_rate, 4),
        "per_predicate_distances": best_ppdist,
    }


# ─────────────────────────────────────────────────────────────────────────────
# Batch runner for a full rule set
# ─────────────────────────────────────────────────────────────────────────────

def run_random_baseline(
    rules: List[Dict],
    grounding: Dict,
    chromosome_builder: Callable[[], Tuple[Dict, Dict]],
    max_evals: int = MAX_EVALUATIONS,
    verbose: bool = False
) -> List[Dict]:
    """
    Run the schema-aware random baseline on all rules in a rule set.

    Parameters
    ----------
    rules : list of dict
        All DMN rules for the subject system.
    grounding : dict
        Predicate grounding shared across all rules.
    chromosome_builder : callable
        Returns (chromosome, entity_ids) for the subject system.
    max_evals : int
        Evaluation budget per rule (default 3,000).
    verbose : bool
        Print per-rule progress.

    Returns
    -------
    list of result dicts (one per rule), same structure as
    run_schema_aware_random().
    """
    results     : List[Dict] = []
    n_covered   : int        = 0
    total       : int        = len(rules)

    print(f"\nSchema-Aware Random Baseline | {total} rules | budget={max_evals}")
    print("─" * 60)

    for i, rule in enumerate(rules, start=1):
        rule_id = rule.get("id", f"rule_{i}")

        res = run_schema_aware_random(
            rule, grounding, chromosome_builder,
            max_evals=max_evals, verbose=False
        )
        results.append({**res, "rule_id": rule_id})

        symbol = "✓" if res["covered"] else "✗"
        if res["covered"]:
            n_covered += 1

        if verbose or not res["covered"]:
            print(f"  [{i:3d}/{total}] {rule_id[:50]:<50} "
                  f"{symbol} f={res['fitness']:.3f} "
                  f"({res['evaluations']:4d} evals)")

    pct = 100 * n_covered / total if total > 0 else 0.0
    print(f"─" * 60)
    print(f"  Coverage: {n_covered}/{total}  ({pct:.1f}%)")
    print()

    return results


# ─────────────────────────────────────────────────────────────────────────────
# Why schema-aware and not naive random
# ─────────────────────────────────────────────────────────────────────────────

def explain_design() -> str:
    """
    Return a plain-text explanation of why this baseline is schema-aware
    rather than naively random. Useful for documentation and paper discussion.
    """
    return """
Schema-Aware Random Baseline — Design Rationale
================================================

A naive random baseline that generates arbitrary database rows would violate
schema constraints (FK references to non-existent parent rows, duplicate PKs,
NULL in NOT NULL columns) and produce chromosomes that cannot be loaded into
the database. Such chromosomes are unevaluable and would always return fitness
= 0, making the baseline trivially bad and an unfair comparison.

The schema-aware baseline instead uses the same chromosome_builder() function
as the GA to construct each candidate. This ensures:

  1. FK constraints are satisfiable by construction (topological insertion order)
  2. PK values are sequential and unique (Layer L3)
  3. FK columns reference valid parent rows (Layer L2)
  4. NOT NULL columns are populated with type-consistent values (Layer L1)

The schema_validity_rate reported by this baseline is therefore 1.0 (100%)
across all evaluations — matching the GA's 100% schema validity rate.

The difference between this baseline and the GA is solely the search strategy:
  • Random: samples column values uniformly from their type domains each time
  • GA:     uses branch-distance fitness to guide perturbation toward triggering

This design isolates the contribution of the fitness function and genetic
operators from the contribution of schema-valid chromosome construction.
The paper reports Â₁₂ = 0.828 [0.798, 0.859] in favour of the GA.
"""


# ─────────────────────────────────────────────────────────────────────────────
# Self-test (no external dependencies)
# ─────────────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    print("schema_aware_random.py")
    print("======================")
    print(explain_design())
    print("Module imports OK. Ready for use with run_schema_aware_random().")
    print()
    print("Usage example:")
    print("  from schema_aware_random import run_schema_aware_random")
    print("  from moodle_encoding_improved import build_fixture, RULES, GROUNDING")
    print()
    print("  for rule in RULES:")
    print("      result = run_schema_aware_random(")
    print("          rule, GROUNDING, lambda: build_fixture(rule['dt'])")
    print("      )")
    print("      print(rule['id'], result['covered'], result['fitness'])")
