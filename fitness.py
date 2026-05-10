"""
fitness.py  —  Branch-Distance Fitness Function

"""

import sqlite3
import copy
from typing import Any, Dict, List, Optional, Tuple

# ── Boundary constant ─────────────────────────────────────────────────────────
K: float = 1.0


# ─────────────────────────────────────────────────────────────────────────────
# Per-predicate branch distance  (Table 6 in the paper)
# ─────────────────────────────────────────────────────────────────────────────

def branch_distance(operator: str, v: float, theta: float) -> float:
    """
    Compute the branch distance d(φ, v) for a scalar condition (attr op θ).

    Parameters
    ----------
    operator : str
        One of "=", "!=", "<", "<=", ">", ">="
    v : float
        Current derived attribute value.
    theta : float
        Condition threshold.

    Returns
    -------
    float
        0.0 when the condition is satisfied; positive otherwise.
    """
    if operator == "=":
        return abs(v - theta)

    if operator in ("!=", "<>"):
        return 0.0 if v != theta else K

    if operator == "<":
        return 0.0 if v < theta else (v - theta) + K

    if operator == "<=":
        return 0.0 if v <= theta else (v - theta) + K

    if operator == ">":
        return 0.0 if v > theta else (theta - v) + K

    if operator == ">=":
        return 0.0 if v >= theta else (theta - v) + K

    raise ValueError(f"Unsupported operator: {operator!r}")


def branch_distance_range(v: float, lower: float, upper: float) -> float:
    """
    Branch distance for a range condition  lower ≤ attr ≤ upper.
    Returns 0 when v is inside [lower, upper]; otherwise the
    minimum displacement to enter the range plus K.
    """
    if lower <= v <= upper:
        return 0.0
    return min(abs(v - lower), abs(v - upper)) + K


def branch_distance_vv(operator: str, v1: float, v2: float) -> float:
    """
    Branch distance for a variable-to-variable condition  attr₁ op attr₂.

    Reduces to a scalar comparison on  Δ = v₁ − v₂  against threshold 0,
    then applies the standard scalar formula (Definition 4, case viii).

    Parameters
    ----------
    operator : str
        Comparison operator applied to (attr₁, attr₂).
    v1, v2 : float
        Current derived values of the left and right operands.
    """
    delta = v1 - v2
    return branch_distance(operator, delta, 0.0)


# ─────────────────────────────────────────────────────────────────────────────
# Aggregation and normalisation  (Equations 2 and 3)
# ─────────────────────────────────────────────────────────────────────────────

def aggregate_distance(distances: List[float]) -> float:
    """
    D(C, r) = Σ d(φⱼ, vⱼ)   [Equation 2]

    Summation ensures:
      • D = 0 iff every condition is satisfied (rule triggered)
      • Each condition contributes an independent additive gradient
      • The highest-distance condition can be identified for O4 targeting
    """
    return sum(distances)


def normalise(D: float) -> float:
    """
    f(C, r) = 1 − D / (D + 1)   [Equation 3]

    Maps D = 0  →  f = 1.0   (rule triggered)
         D → ∞  →  f → 0.0
    The function is strictly monotone in D; compresses large distances
    while preserving fine-grained resolution near the triggering region.
    """
    return 1.0 - D / (D + 1.0)


# ─────────────────────────────────────────────────────────────────────────────
# In-memory SQLite evaluation
# ─────────────────────────────────────────────────────────────────────────────

def _load_chromosome_to_sqlite(
    conn: sqlite3.Connection,
    chromosome: Dict[str, List[Dict]]
) -> None:
    """
    Load all rows from chromosome into the in-memory SQLite instance.
    Tables are created on-the-fly from the first row's keys.
    Rows are inserted in the order provided (caller must supply topological order).
    """
    for table_name, rows in chromosome.items():
        if not rows:
            continue
        cols = list(rows[0].keys())
        col_defs = ", ".join(f'"{c}" TEXT' for c in cols)
        conn.execute(f'CREATE TABLE IF NOT EXISTS "{table_name}" ({col_defs})')
        placeholders = ", ".join("?" for _ in cols)
        for row in rows:
            values = [str(row.get(c, "")) for c in cols]
            conn.execute(
                f'INSERT INTO "{table_name}" ({", ".join(f"{chr(34)}{c}{chr(34)}" for c in cols)}) '
                f'VALUES ({placeholders})',
                values
            )
    conn.commit()


def _execute_derivation(
    conn: sqlite3.Connection,
    sql: str,
    params: Tuple = ()
) -> Optional[float]:
    """
    Execute a SQL derivation expression and return the scalar result.
    Returns None if the query fails or returns no rows.
    """
    try:
        cursor = conn.execute(sql, params)
        row = cursor.fetchone()
        if row and row[0] is not None:
            return float(row[0])
    except sqlite3.Error:
        pass
    return None


# ─────────────────────────────────────────────────────────────────────────────
# Main evaluation entry point
# ─────────────────────────────────────────────────────────────────────────────

def evaluate(
    chromosome: Dict[str, List[Dict]],
    entity_ids: Dict[str, Any],
    rule: Dict,
    grounding: Dict
) -> Tuple[bool, bool, float, List[float], Optional[str]]:
    """
    Evaluate a chromosome against a target DMN rule.

    Parameters
    ----------
    chromosome : dict
        {table_name: [row_dict, ...]} — the FK-closure chromosome.
    entity_ids : dict
        Focal entity identifiers (e.g. {"user_id": 1, "course_id": 1}).
    rule : dict
        DMN rule with 'id', 'when' (condition tree), 'then' (outcome).
    grounding : dict
        Predicate grounding G(rᵢ): maps each attribute name to
        {'sql': str, 'type': str, 'operator': str, 'threshold': float|str}.

    Returns
    -------
    schema_valid : bool
        True if all FK/PK constraints passed (always True by construction).
    triggered : bool
        True if f(C, r) == 1.0 (all conditions satisfied).
    fitness : float
        f(C, r) in [0, 1].
    per_predicate_distances : list[float]
        d(φⱼ, vⱼ) for each condition in the rule.
    error : str or None
        Error message if evaluation failed, else None.
    """
    conn = sqlite3.connect(":memory:")
    conn.execute("PRAGMA foreign_keys = OFF")   # structural validity by construction

    try:
        _load_chromosome_to_sqlite(conn, chromosome)

        distances: List[float] = []

        for attr_name, spec in grounding.items():
            sql      = spec.get("sql", "")
            op       = spec.get("operator", ">=")
            thresh   = spec.get("threshold")
            attr_type = spec.get("type", "scalar")

            if not sql:
                continue

            # Substitute entity_id placeholders
            bound_sql = sql
            for key, val in entity_ids.items():
                bound_sql = bound_sql.replace(f"{{{key}}}", str(val))

            v = _execute_derivation(conn, bound_sql)
            if v is None:
                distances.append(K)   # penalise unevaluable conditions
                continue

            if attr_type == "vv":
                # Variable-to-variable: threshold is another derived attribute
                thresh_sql = spec.get("threshold_sql", "")
                if thresh_sql:
                    bound_thresh = thresh_sql
                    for key, val in entity_ids.items():
                        bound_thresh = bound_thresh.replace(f"{{{key}}}", str(val))
                    v2 = _execute_derivation(conn, bound_thresh)
                    if v2 is None:
                        distances.append(K)
                        continue
                    d = branch_distance_vv(op, v, v2)
                else:
                    d = branch_distance(op, v, float(thresh or 0))
            elif attr_type == "range":
                lower, upper = spec.get("lower", 0), spec.get("upper", float("inf"))
                d = branch_distance_range(v, float(lower), float(upper))
            else:
                d = branch_distance(op, v, float(thresh or 0))

            distances.append(d)

        D        = aggregate_distance(distances)
        fitness  = normalise(D)
        triggered = (D == 0.0)

        return True, triggered, fitness, distances, None

    except Exception as exc:
        return False, False, 0.0, [], str(exc)

    finally:
        conn.close()
