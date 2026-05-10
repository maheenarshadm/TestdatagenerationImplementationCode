"""
enhanced_operators.py  —  Six Genetic Operators  O1–O6

"""

import random
import copy
import time
from datetime import datetime, timedelta
from typing import Any, Dict, List, Optional, Set, Tuple

# ── Type aliases ──────────────────────────────────────────────────────────────
Chromosome   = Dict[str, List[Dict]]
Row          = Dict[str, Any]
Grounding    = Dict[str, Dict]   # attr_name → {sql, type, operator, threshold, ...}

# ── Schema-type vocabulary ────────────────────────────────────────────────────
_INT_RANGE    = (0, 1000)
_FLOAT_RANGE  = (0.0, 100.0)
_BOOL_VALUES  = (0, 1)
_STATUS_FLAGS = ("active", "inactive", "suspended", "pending",
                 "submitted", "new", "draft", "approved", "rejected")

_NOW_EPOCH    = int(time.time())
_DAY_S        = 86_400


# ─────────────────────────────────────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────────────────────────────────────

def _is_immutable(col: str, immutable_cols: Set[str]) -> bool:
    """Return True if col is in the FK/PK immutable set."""
    return col in immutable_cols


def _infer_col_type(col: str, value: Any) -> str:
    """
    Infer the column type from its name and current value.
    Returns one of: 'int', 'float', 'bool', 'epoch', 'status', 'str'.
    """
    col_l = col.lower()
    if any(t in col_l for t in ("time", "date", "epoch", "stamp", "start", "end")):
        return "epoch"
    if any(t in col_l for t in ("status", "state", "flag", "type", "active")):
        return "status"
    if isinstance(value, bool):
        return "bool"
    if isinstance(value, int):
        return "int"
    if isinstance(value, float):
        return "float"
    return "str"


def _typed_sample(col: str, current_value: Any) -> Any:
    """Sample a new type-consistent value for a non-FK column."""
    t = _infer_col_type(col, current_value)
    if t == "epoch":
        # Random date within ±365 days of today
        offset = random.randint(-365, 365) * _DAY_S
        return _NOW_EPOCH + offset
    if t == "status":
        return random.choice(_STATUS_FLAGS)
    if t == "bool":
        return random.choice(_BOOL_VALUES)
    if t == "float":
        return round(random.uniform(*_FLOAT_RANGE), 2)
    if t == "int":
        return random.randint(*_INT_RANGE)
    return current_value


def _renumber_pks(chromosome: Chromosome) -> Chromosome:
    """
    Layer L3/L4: Sequentially renumber all PKs across every table and
    propagate the new PK values to all FK columns that reference them.
    Called after O6 crossover to prevent PK collisions.
    """
    c = copy.deepcopy(chromosome)
    pk_map: Dict[str, Dict[Any, int]] = {}   # table → {old_pk: new_pk}

    for table, rows in c.items():
        pk_map[table] = {}
        for new_pk, row in enumerate(rows, start=1):
            # Assume PK column is named 'id' or ends with 'id' and is first key
            pk_col = _find_pk_col(row)
            if pk_col:
                old_pk = row[pk_col]
                pk_map[table][old_pk] = new_pk
                row[pk_col] = new_pk

    # Propagate new PKs to FK columns
    for table, rows in c.items():
        for row in rows:
            for col, val in list(row.items()):
                if col.endswith("id") and col != _find_pk_col(row):
                    # This may be an FK; look up in pk_map
                    for ref_table, mapping in pk_map.items():
                        if val in mapping:
                            row[col] = mapping[val]
                            break
    return c


def _find_pk_col(row: Row) -> Optional[str]:
    """Return the PK column name for a row dict (heuristic: first 'id' column)."""
    for col in row:
        if col == "id":
            return "id"
    for col in row:
        if col.endswith("_id") or col.lower().endswith("id"):
            return col
    return None


def _get_fk_cols(row: Row) -> Set[str]:
    """
    Return column names that are likely FK columns (ends with 'id' and is not PK).
    These are immutable during mutation.
    """
    pk = _find_pk_col(row)
    return {c for c in row if c != pk and (c.endswith("id") or c.lower().endswith("id"))}


# ─────────────────────────────────────────────────────────────────────────────
# O1  —  Schema-Typed Column Mutation
# ─────────────────────────────────────────────────────────────────────────────

def O1(
    chromosome: Chromosome,
    mutation_rate: float = 0.20,
    immutable_cols: Optional[Set[str]] = None
) -> Chromosome:
    """
    O1: Schema-Typed Column Mutation.

    Selects non-FK columns uniformly at random and replaces their values
    with type-consistent samples:
      • Integer columns    → uniform sample from domain bounds
      • Float columns      → uniform sample from [0.0, 100.0]
      • Boolean/flag cols  → Bernoulli flip
      • Status columns     → uniform sample from vocabulary
      • Epoch columns      → random date within ±365 days of today

    Addresses direct-column and status-flag attribute conditions.
    Layer L2 is respected: FK columns are never mutated.
    """
    c = copy.deepcopy(chromosome)
    for table, rows in c.items():
        for row in rows:
            fk_cols = immutable_cols or _get_fk_cols(row)
            pk_col  = _find_pk_col(row)
            for col, val in list(row.items()):
                if col == pk_col:
                    continue
                if _is_immutable(col, fk_cols):
                    continue
                if random.random() < mutation_rate:
                    row[col] = _typed_sample(col, val)
    return c


# ─────────────────────────────────────────────────────────────────────────────
# O2  —  Aggregation-Target Row Mutation
# ─────────────────────────────────────────────────────────────────────────────

def O2(
    chromosome: Chromosome,
    grounding: Grounding,
    per_predicate_distances: Dict[str, float],
    entity_ids: Dict[str, Any],
    row_mutate_prob: float = 0.30
) -> Chromosome:
    """
    O2: Aggregation-Target Row Mutation.

    Targets aggregation attributes (COUNT/SUM-derived) whose values are
    controlled by the cardinality of rows in the source table.

    Strategy:
      1. Identify the aggregation condition with the highest per-predicate
         distance from per_predicate_distances.
      2. Determine the required direction from the branch-distance gradient
         (increase COUNT → insert row; decrease COUNT → remove row).
      3. Insert a new schema-valid row or remove a qualifying row.

    Precondition:  row count never drops below the minimum bound from
                   the predicate grounding (Table 4).
    """
    if random.random() >= row_mutate_prob:
        return chromosome

    c = copy.deepcopy(chromosome)

    # Find the highest-distance aggregation attribute
    agg_attrs = {
        attr: d
        for attr, d in per_predicate_distances.items()
        if grounding.get(attr, {}).get("type") in ("aggregation", "count")
           and d > 0.0
    }
    if not agg_attrs:
        return c

    target_attr = max(agg_attrs, key=agg_attrs.get)
    spec        = grounding.get(target_attr, {})
    source_tbl  = spec.get("source_table")
    operator    = spec.get("operator", ">=")
    threshold   = float(spec.get("threshold", 0))
    min_rows    = spec.get("min_rows", 1)

    if not source_tbl or source_tbl not in c:
        return c

    rows = c[source_tbl]
    current_count = len(rows)

    # Determine direction
    need_more = operator in (">=", ">") and current_count < threshold
    need_less = operator in ("<=", "<") and current_count > threshold
    need_zero = operator == "=" and threshold == 0 and current_count > 0

    if need_zero:
        # Remove all qualifying rows
        flag_col = spec.get("flag_col")
        if flag_col:
            for row in rows:
                row[flag_col] = 0
        return c

    if need_more and rows:
        # Insert a new row cloned from the last row with fresh PK
        new_row = copy.deepcopy(rows[-1])
        pk_col  = _find_pk_col(new_row)
        if pk_col:
            new_row[pk_col] = max(r.get(pk_col, 0) for r in rows) + 1
        # Optionally set flag column for COUNT conditions
        flag_col = spec.get("flag_col")
        if flag_col and flag_col in new_row:
            new_row[flag_col] = 1
        rows.append(new_row)

    elif need_less and len(rows) > max(1, min_rows):
        # Remove the last row
        rows.pop()

    return c


# ─────────────────────────────────────────────────────────────────────────────
# O3  —  Coordinated Relational Mutation
# ─────────────────────────────────────────────────────────────────────────────

def O3(
    chromosome: Chromosome,
    grounding: Grounding,
    per_predicate_distances: Dict[str, float],
    entity_ids: Dict[str, Any],
    coord_prob: float = 0.30
) -> Chromosome:
    """
    O3: Coordinated Relational Mutation.

    Addresses variable-to-variable conditions  attr₁ op attr₂  where both
    operands are independently derived from the chromosome.

    Strategy:
      1. Identify all VV conditions in the grounding.
      2. Compute Δ = v₁ − v₂ for each (using the most recent evaluation).
      3. Apply simultaneous perturbations: the operand further from the
         satisfying region receives the larger perturbation; the other
         receives a proportionally smaller adjustment to avoid overshooting.

    This prevents single-operand mutations (O1, O4) from satisfying one
    side while inadvertently violating the other.
    """
    if random.random() >= coord_prob:
        return chromosome

    c = copy.deepcopy(chromosome)

    vv_attrs = {
        attr: spec
        for attr, spec in grounding.items()
        if spec.get("type") == "vv"
    }
    if not vv_attrs:
        return c

    for attr, spec in vv_attrs.items():
        d = per_predicate_distances.get(attr, 0.0)
        if d == 0.0:
            continue  # already satisfied

        operator  = spec.get("operator", ">=")
        lhs_tbl   = spec.get("lhs_table")
        lhs_col   = spec.get("lhs_col")
        rhs_tbl   = spec.get("rhs_table")
        rhs_col   = spec.get("rhs_col")

        if not all([lhs_tbl, lhs_col, rhs_tbl, rhs_col]):
            continue

        lhs_rows = c.get(lhs_tbl, [])
        rhs_rows = c.get(rhs_tbl, [])
        if not lhs_rows or not rhs_rows:
            continue

        v1 = float(lhs_rows[0].get(lhs_col, 0))
        v2 = float(rhs_rows[0].get(rhs_col, 0))
        delta = v1 - v2

        # Magnitude of perturbation proportional to distance
        magnitude = min(d * 0.5, 20.0)
        jitter    = random.uniform(0, magnitude * 0.1)

        if operator in (">=", ">"):
            # Need v1 >= v2: increase v1 and/or decrease v2
            if random.random() < 0.6:
                lhs_rows[0][lhs_col] = round(v1 + magnitude + jitter, 2)
            else:
                rhs_rows[0][rhs_col] = round(max(0.0, v2 - magnitude - jitter), 2)
        elif operator in ("<=", "<"):
            # Need v1 <= v2: decrease v1 and/or increase v2
            if random.random() < 0.6:
                lhs_rows[0][lhs_col] = round(max(0.0, v1 - magnitude - jitter), 2)
            else:
                rhs_rows[0][rhs_col] = round(v2 + magnitude + jitter, 2)
        elif operator == "=":
            # Converge v1 toward v2
            lhs_rows[0][lhs_col] = round(v2 + random.uniform(-0.5, 0.5), 2)

    return c


# ─────────────────────────────────────────────────────────────────────────────
# O4  —  Gradient-Guided Column Mutation
# ─────────────────────────────────────────────────────────────────────────────

def O4(
    chromosome: Chromosome,
    grounding: Grounding,
    per_predicate_distances: Dict[str, float],
    entity_ids: Dict[str, Any],
    directed_prob: float = 0.30
) -> Chromosome:
    """
    O4: Gradient-Guided Column Mutation.

    Primary convergence operator. Uses the per-predicate distance vector
    to identify the highest-distance condition and applies a directed
    perturbation to the column most directly responsible for that distance.

    Perturbation magnitude is proportional to the distance d(φ, v) with a
    small additive jitter ε ~ Uniform(0, 0.1 × |d|) to prevent cycling at
    local optima. Applied with probability 0.75 per offspring (raised from
    the baseline 0.60).

    Direction is determined by the operator:
      • ≥, > conditions → increase the column value
      • <, ≤ conditions → decrease the column value
      • =  conditions   → converge toward the threshold
    """
    if random.random() >= directed_prob:
        return chromosome

    if not per_predicate_distances:
        return chromosome

    # Find highest-distance non-VV condition
    scalar_dists = {
        attr: d
        for attr, d in per_predicate_distances.items()
        if d > 0.0 and grounding.get(attr, {}).get("type") != "vv"
    }
    if not scalar_dists:
        return chromosome

    target_attr = max(scalar_dists, key=scalar_dists.get)
    spec        = grounding.get(target_attr, {})
    source_tbl  = spec.get("source_table")
    target_col  = spec.get("target_col")
    operator    = spec.get("operator", ">=")
    threshold   = float(spec.get("threshold", 0))
    d           = scalar_dists[target_attr]

    if not source_tbl or source_tbl not in chromosome:
        return chromosome

    c         = copy.deepcopy(chromosome)
    rows      = c[source_tbl]
    magnitude = min(d, 50.0)
    jitter    = random.uniform(0, 0.1 * magnitude)

    for row in rows:
        if target_col and target_col in row:
            v = float(row.get(target_col, 0))
            if operator in (">=", ">"):
                row[target_col] = round(v + magnitude + jitter, 2)
            elif operator in ("<=", "<"):
                row[target_col] = round(max(0.0, v - magnitude - jitter), 2)
            elif operator == "=":
                row[target_col] = round(threshold + random.uniform(-0.1, 0.1), 2)

    return c


# ─────────────────────────────────────────────────────────────────────────────
# O5  —  Temporal Window Mutation
# ─────────────────────────────────────────────────────────────────────────────

def O5(
    chromosome: Chromosome,
    grounding: Grounding,
    per_predicate_distances: Dict[str, float],
    entity_ids: Dict[str, Any],
    epoch_prob: float = 0.20
) -> Chromosome:
    """
    O5: Temporal Window Mutation.

    Applies day-level epoch perturbations to DATE/TIMESTAMP columns for
    temporal conditions such as daysSinceEnrolment ≥ 21.

    O1 would sample from a range spanning years, giving it a probability
    < 10⁻³ of landing in a narrow temporal feasibility window. O5 applies
    fine-grained perturbations drawn from a Poisson-like distribution with
    mean proportional to the remaining branch distance, converging smoothly
    to the feasibility window.

    Direction is determined by the branch-distance gradient:
      • daysSince ≥ θ → move the date backward in time (further in the past)
      • daysSince ≤ θ → move the date forward in time (closer to today)
    """
    if random.random() >= epoch_prob:
        return chromosome

    c = copy.deepcopy(chromosome)

    temporal_attrs = {
        attr: spec
        for attr, spec in grounding.items()
        if spec.get("type") == "temporal"
    }
    if not temporal_attrs:
        return c

    for attr, spec in temporal_attrs.items():
        d = per_predicate_distances.get(attr, 0.0)
        if d == 0.0:
            continue

        source_tbl = spec.get("source_table")
        epoch_col  = spec.get("epoch_col")
        operator   = spec.get("operator", ">=")

        if not source_tbl or not epoch_col:
            continue
        if source_tbl not in c or not c[source_tbl]:
            continue

        # Δt drawn from Poisson with mean = d (in days), capped at 365
        mean_days = min(int(d), 365)
        delta_days = max(1, int(random.expovariate(1.0 / max(mean_days, 1))))
        delta_secs = delta_days * _DAY_S

        for row in c[source_tbl]:
            if epoch_col not in row:
                continue
            current_epoch = int(row.get(epoch_col, _NOW_EPOCH))

            if operator in (">=", ">"):
                # daysSince = now − epoch  →  more days past  →  move epoch back
                row[epoch_col] = current_epoch - delta_secs
            elif operator in ("<=", "<"):
                # Fewer days past → move epoch forward
                row[epoch_col] = min(current_epoch + delta_secs, _NOW_EPOCH)
            elif operator == "=":
                threshold_days = int(spec.get("threshold", 0))
                target_epoch   = _NOW_EPOCH - threshold_days * _DAY_S
                jitter_secs    = random.randint(-_DAY_S, _DAY_S)
                row[epoch_col] = target_epoch + jitter_secs

    return c


# ─────────────────────────────────────────────────────────────────────────────
# O6  —  Structure-Preserving Crossover
# ─────────────────────────────────────────────────────────────────────────────

def O6(
    parent1: Chromosome,
    parent2: Chromosome
) -> Chromosome:
    """
    O6: Structure-Preserving Crossover.

    Row-level uniform crossover: for each table t ∈ T_r, rows are selected
    from either parent1 or parent2 with equal probability, producing an
    offspring chromosome that combines the relational structures of both.

    A post-crossover PK renumbering step (Layer L4) immediately follows:
      1. All PKs are reassigned sequentially starting from 1.
      2. All FK columns are updated to reflect the new PK values.

    Without this repair, duplicate PKs from both parents would cause
    INSERT failures in the in-memory SQLite evaluation instance.

    Parameters
    ----------
    parent1, parent2 : Chromosome
        Two parent chromosomes with the same table set T_r.

    Returns
    -------
    Chromosome
        Schema-valid offspring (PKs are unique by construction after repair).
    """
    offspring: Chromosome = {}

    # Collect union of tables from both parents
    all_tables = set(parent1.keys()) | set(parent2.keys())

    for table in all_tables:
        rows1 = parent1.get(table, [])
        rows2 = parent2.get(table, [])
        n     = max(len(rows1), len(rows2))

        selected_rows: List[Row] = []
        for i in range(n):
            r1 = rows1[min(i, len(rows1) - 1)] if rows1 else None
            r2 = rows2[min(i, len(rows2) - 1)] if rows2 else None

            if r1 is None:
                selected_rows.append(copy.deepcopy(r2))
            elif r2 is None:
                selected_rows.append(copy.deepcopy(r1))
            else:
                selected_rows.append(
                    copy.deepcopy(r1) if random.random() < 0.5 else copy.deepcopy(r2)
                )

        offspring[table] = selected_rows

    # Layer L4: post-crossover PK repair
    offspring = _renumber_pks(offspring)
    return offspring


# ─────────────────────────────────────────────────────────────────────────────
# Operator application order (Algorithm 3, lines 12–16)
# ─────────────────────────────────────────────────────────────────────────────

def apply_all_operators(
    chromosome: Chromosome,
    grounding: Grounding,
    per_predicate_distances: Dict[str, float],
    entity_ids: Dict[str, Any],
    mutation_rate: float = 0.20,
    o4_prob: float = 0.75,     # raised from 0.60 per paper improvement
    o3_prob: float = 0.50,
    o2_prob: float = 0.40,
    o5_prob: float = 0.20
) -> Chromosome:
    """
    Apply mutation operators O4 → O3 → O2 → O5 → O1 in priority order.

    Directed operators (O4, O3) are applied first to maximise gradient-
    guided convergence. O1 (broad-scope) is applied last to maintain
    population diversity without overwriting targeted improvements.

    This order corresponds to lines 12–16 of Algorithm 3.
    """
    c = chromosome

    # O4 first — gradient-guided (highest priority)
    c = O4(c, grounding, per_predicate_distances, entity_ids, directed_prob=o4_prob)

    # O3 — coordinated relational (VV conditions)
    c = O3(c, grounding, per_predicate_distances, entity_ids, coord_prob=o3_prob)

    # O2 — aggregation-target row mutation
    c = O2(c, grounding, per_predicate_distances, entity_ids, row_mutate_prob=o2_prob)

    # O5 — temporal window (fine-grained epoch)
    c = O5(c, grounding, per_predicate_distances, entity_ids, epoch_prob=o5_prob)

    # O1 last — schema-typed baseline mutation
    c = O1(c, mutation_rate=mutation_rate)

    return c
