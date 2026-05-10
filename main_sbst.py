"""
main_sbst.py  —  Main Experiment Runner

"""

import argparse
import csv
import json
import os
import sys
import time
from typing import Dict, List, Optional

from ga_engine  import run_ga, run_random
from fitness    import evaluate

# ── System registry ───────────────────────────────────────────────────────────
# Each entry maps a system name to its encoding module name.
# The encoding module must expose:
#   build_fixture(dt_name) → (chromosome, entity_ids)
#   RULES                  → list of rule dicts
#   GROUNDING              → dict of predicate groundings
#   SEEDS (optional)       → dict of domain seeds per rule_id

SYSTEM_REGISTRY = {
    "moodle":   "moodle_encoding_improved",
    "jbilling": "jbilling_aggregation",
    "openimis": "openimis_sbst_aggregation",
    "flex":     "flex_encoding",       # if available
}


# ─────────────────────────────────────────────────────────────────────────────
# System loader
# ─────────────────────────────────────────────────────────────────────────────

def load_system(system_name: str):
    """
    Dynamically import the encoding module for the requested system
    and return (build_fixture_fn, rules, grounding, seeds).
    """
    module_name = SYSTEM_REGISTRY.get(system_name.lower())
    if not module_name:
        raise ValueError(
            f"Unknown system: {system_name!r}. "
            f"Supported: {list(SYSTEM_REGISTRY.keys())}"
        )

    try:
        import importlib
        mod = importlib.import_module(module_name)
    except ImportError as exc:
        raise ImportError(
            f"Could not import encoding module '{module_name}' "
            f"for system '{system_name}': {exc}"
        ) from exc

    build_fixture = getattr(mod, "build_fixture", None)
    rules         = getattr(mod, "RULES",     [])
    grounding     = getattr(mod, "GROUNDING", {})
    seeds         = getattr(mod, "SEEDS",     None)

    if build_fixture is None:
        raise AttributeError(
            f"Module '{module_name}' must define a 'build_fixture(dt_name)' function."
        )

    return build_fixture, rules, grounding, seeds


# ─────────────────────────────────────────────────────────────────────────────
# Single-rule experiment
# ─────────────────────────────────────────────────────────────────────────────

def run_rule(
    rule: Dict,
    grounding: Dict,
    build_fixture,
    seeds: Optional[Dict],
    dt_name: str,
    budget: int = 3000,
    verbose: bool = False
) -> Dict:
    """
    Run both GA and random baseline on a single rule.
    Returns a combined result dict.
    """
    def builder():
        return build_fixture(dt_name)

    # ── GA run ────────────────────────────────────────────────────────────────
    t0 = time.perf_counter()
    ga_res = run_ga(
        rule, grounding, builder, seeds=seeds,
        max_evals=budget, verbose=verbose
    )
    ga_time = round(time.perf_counter() - t0, 3)

    # ── Random baseline ───────────────────────────────────────────────────────
    t0 = time.perf_counter()
    rnd_res = run_random(rule, grounding, builder, max_evals=budget)
    rnd_time = round(time.perf_counter() - t0, 3)

    return {
        "rule_id":           rule.get("id"),
        "dt_name":           dt_name,
        # GA results
        "ga_covered":        ga_res["covered"],
        "ga_fitness":        ga_res["fitness"],
        "ga_evaluations":    ga_res["evaluations"],
        "ga_sv_rate":        ga_res["schema_validity_rate"],
        "ga_time_s":         ga_time,
        # Random baseline results
        "rnd_covered":       rnd_res["covered"],
        "rnd_fitness":       rnd_res["fitness"],
        "rnd_evaluations":   rnd_res["evaluations"],
        "rnd_sv_rate":       rnd_res["schema_validity_rate"],
        "rnd_time_s":        rnd_time,
    }


# ─────────────────────────────────────────────────────────────────────────────
# Full experiment runner
# ─────────────────────────────────────────────────────────────────────────────

def run_experiment(
    system_name: str,
    budget: int = 3000,
    verbose: bool = False,
    output_csv: Optional[str] = None
) -> List[Dict]:
    """
    Run the full experiment on all rules of a subject system.

    Parameters
    ----------
    system_name : str
        One of 'moodle', 'jbilling', 'openimis', 'flex'.
    budget : int
        Evaluation budget B per rule (default 3,000).
    verbose : bool
        Print per-generation progress.
    output_csv : str or None
        Path to write results CSV; None = print only.

    Returns
    -------
    list of result dicts
    """
    print(f"\n{'='*60}")
    print(f"  SBST Experiment — System: {system_name.upper()}")
    print(f"  Budget per rule: {budget}  |  GA pop: 30")
    print(f"{'='*60}\n")

    build_fixture, rules, grounding, seeds = load_system(system_name)

    if not rules:
        print(f"WARNING: No rules found for system '{system_name}'.")
        return []

    all_results = []
    ga_covered  = 0
    rnd_covered = 0
    total       = len(rules)

    for i, rule in enumerate(rules, start=1):
        rule_id = rule.get("id", f"rule_{i}")
        dt_name = rule.get("dt", "unknown_dt")

        print(f"  [{i:3d}/{total}] {rule_id[:55]:<55}", end=" ", flush=True)

        res = run_rule(
            rule, grounding, build_fixture, seeds,
            dt_name, budget=budget, verbose=verbose
        )
        all_results.append(res)

        ga_sym  = "✓" if res["ga_covered"]  else "✗"
        rnd_sym = "✓" if res["rnd_covered"] else "✗"
        if res["ga_covered"]:  ga_covered  += 1
        if res["rnd_covered"]: rnd_covered += 1

        print(f"GA:{ga_sym} f={res['ga_fitness']:.3f} "
              f"({res['ga_evaluations']:4d} evals) | "
              f"Rnd:{rnd_sym} f={res['rnd_fitness']:.3f}")

    # ── Summary ───────────────────────────────────────────────────────────────
    ga_pct  = 100 * ga_covered  / total
    rnd_pct = 100 * rnd_covered / total
    print(f"\n{'─'*60}")
    print(f"  GA  coverage : {ga_covered}/{total}  ({ga_pct:.1f}%)")
    print(f"  Rnd coverage : {rnd_covered}/{total}  ({rnd_pct:.1f}%)")
    print(f"  Advantage    : +{ga_pct - rnd_pct:.1f} pp")
    print(f"{'='*60}\n")

    # ── Write CSV ─────────────────────────────────────────────────────────────
    if output_csv:
        _write_csv(all_results, output_csv)
        print(f"  Results saved: {output_csv}")

    return all_results


# ─────────────────────────────────────────────────────────────────────────────
# CSV writer
# ─────────────────────────────────────────────────────────────────────────────

def _write_csv(results: List[Dict], path: str) -> None:
    if not results:
        return
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(results[0].keys()))
        writer.writeheader()
        writer.writerows(results)


# ─────────────────────────────────────────────────────────────────────────────
# CLI entry point
# ─────────────────────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(
        description="SBST Test Data Generation for DMN Business Rules"
    )
    parser.add_argument(
        "--system", "-s",
        default="moodle",
        help="Subject system: moodle | jbilling | openimis | flex | all"
    )
    parser.add_argument(
        "--budget", "-b",
        type=int, default=3000,
        help="Evaluation budget per rule (default: 3000)"
    )
    parser.add_argument(
        "--output", "-o",
        default=None,
        help="Output CSV file path (optional)"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Print per-generation GA progress"
    )
    args = parser.parse_args()

    systems = (
        list(SYSTEM_REGISTRY.keys())
        if args.system.lower() == "all"
        else [args.system.lower()]
    )

    all_results = []
    for sys_name in systems:
        out_path = args.output
        if args.output and len(systems) > 1:
            base, ext = os.path.splitext(args.output)
            out_path = f"{base}_{sys_name}{ext}"
        results = run_experiment(
            sys_name,
            budget=args.budget,
            verbose=args.verbose,
            output_csv=out_path
        )
        all_results.extend(results)

    # Combined summary if multiple systems
    if len(systems) > 1 and all_results:
        total      = len(all_results)
        ga_cov     = sum(1 for r in all_results if r["ga_covered"])
        rnd_cov    = sum(1 for r in all_results if r["rnd_covered"])
        print(f"\n{'='*60}")
        print(f"  COMBINED RESULTS — {total} rules across {len(systems)} systems")
        print(f"  GA  coverage : {ga_cov}/{total}  ({100*ga_cov/total:.1f}%)")
        print(f"  Rnd coverage : {rnd_cov}/{total}  ({100*rnd_cov/total:.1f}%)")
        print(f"  Advantage    : +{100*(ga_cov-rnd_cov)/total:.1f} pp")
        print(f"{'='*60}\n")


if __name__ == "__main__":
    main()
