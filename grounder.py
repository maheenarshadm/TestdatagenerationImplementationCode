"""
attribute_grounder/grounder.py
==============================
Core attribute grounding engine.

Three-tier classification:
  Tier 1: Direct column match (confidence=1.0, fully automatic)
  Tier 2: Pattern-based SQL generation (confidence 0.4–0.9, human verifies)
  Tier 3: Template with ranked candidates (confidence <0.4, human completes)
"""

import re
import json
from collections import defaultdict

try:
    from rapidfuzz import fuzz
    HAVE_RAPIDFUZZ = True
except ImportError:
    HAVE_RAPIDFUZZ = False


# ---------------------------------------------------------------------------
# Name normalisation utilities
# ---------------------------------------------------------------------------

_CAMEL_RE = re.compile(r'([a-z0-9])([A-Z])')
_CAMEL_RE2 = re.compile(r'([A-Z]+)([A-Z][a-z])')

SUFFIX_MAP = {
    'count':   '_COUNT',
    'status':  '_STATUS',
    'flag':    '_FLAG',
    'id':      '_ID',
    'no':      '_NO',
    'amount':  '_AMOUNT',
    'date':    '_DATE',
    'type':    '_TYPE',
    'code':    '_CODE',
    'name':    '_NAME',
    'percent': '_PCT',
    'pct':     '_PCT',
    'rate':    '_RATE',
}


def camel_to_snake(name: str) -> str:
    """Convert camelCase to UPPER_SNAKE_CASE."""
    s = _CAMEL_RE2.sub(r'\1_\2', name)
    s = _CAMEL_RE.sub(r'\1_\2', s)
    return s.upper()


def normalise_attr(attr: str) -> list:
    """
    Return a list of candidate column name patterns from a camelCase attribute name.
    e.g. "attendancePercent" → ["ATTENDANCE_PERCENT", "ATTENDANCE_PCT", "ATTENDANCEPERCENT"]
    """
    snake = camel_to_snake(attr)
    candidates = [snake, attr.upper()]
    # Try replacing known suffix words
    for word, repl in SUFFIX_MAP.items():
        if snake.endswith('_' + word.upper()):
            alt = snake[: -(len(word) + 1)] + repl
            if alt != snake:
                candidates.append(alt)
    # Also try without leading component (e.g. ATTENDANCE_PERCENT → PERCENT)
    parts = snake.split('_')
    if len(parts) > 1:
        candidates.append('_'.join(parts[1:]))
    return list(dict.fromkeys(candidates))


def tokenise(name: str) -> list:
    """Split a camelCase or SNAKE_CASE name into lowercase tokens."""
    snake = camel_to_snake(name)
    return [t.lower() for t in snake.split('_') if t]


# ---------------------------------------------------------------------------
# Attribute-type classification
# ---------------------------------------------------------------------------

def classify_attribute_type(attr: str) -> str:
    """Guess the derivation type from the attribute name."""
    a = attr.lower()
    if any(a.endswith(s) for s in ('percent', 'pct', 'rate', 'ratio', 'utilisation',
                                    'utilization')):
        return 'ratio'
    if any(a.endswith(s) for s in ('count', 'num', 'number', 'qty', 'quantity',
                                    'total', 'cnt')):
        # Could be count_aggregate or sum_aggregate — refine per pattern
        return 'count_aggregate'
    if any(a.endswith(s) for s in ('amount', 'fee', 'balance', 'cost', 'price',
                                    'outstanding', 'paid', 'sum')):
        return 'sum_aggregate'
    if any(a.endswith(s) for s in ('days', 'duration', 'age', 'minutes',
                                    'hours', 'weeks')):
        return 'temporal'
    if any(sub in a for sub in ('date', 'time', 'deadline', 'expiry', 'since',
                                 'to', 'from')):
        return 'temporal'
    if any(a.endswith(s) for s in ('exists', 'granted', 'allowed', 'used',
                                    'active', 'approved', 'open', 'valid')):
        return 'existence_check'
    if any(a.endswith(s) for s in ('status', 'flag', 'type', 'id')):
        return 'direct_column'
    return 'direct_column'


# ---------------------------------------------------------------------------
# Schema index — built once per session
# ---------------------------------------------------------------------------

class SchemaIndex:
    """Fast lookup index over a parsed schema."""

    def __init__(self, schema: dict):
        self.schema = schema
        # Flat column index: {COLUMN_NAME: [(table, col_dict), ...]}
        self._col_index: dict = defaultdict(list)
        # Token index: {token: [(table, col_name), ...]}
        self._tok_index: dict = defaultdict(list)
        self._build()

    def _build(self):
        for tname, tdata in self.schema.items():
            t_tokens = set(tokenise(tname))
            for col in tdata['columns']:
                cname = col['name']
                self._col_index[cname].append((tname, col))
                for tok in t_tokens | set(tokenise(cname)):
                    self._tok_index[tok].append((tname, cname))

    def exact_lookup(self, col_name: str) -> list:
        """Return [(table, col_dict)] for exact column name match."""
        return self._col_index.get(col_name.upper(), [])

    def token_score(self, attr_tokens: list, table: str, col_name: str) -> float:
        """Score relevance of (table, col) to an attribute's token list."""
        t_tokens = set(tokenise(table))
        c_tokens = set(tokenise(col_name))
        all_tokens = t_tokens | c_tokens
        hits = sum(1 for t in attr_tokens if t in all_tokens)
        return hits / max(len(attr_tokens), 1)

    def ranked_tables_for_tokens(self, tokens: list, top_n: int = 5) -> list:
        """Return [(score, table)] sorted by token overlap, descending."""
        scores: dict = defaultdict(float)
        for tok in tokens:
            for tname, _ in self._tok_index.get(tok, []):
                scores[tname] += 1.0
        ranked = sorted(scores.items(), key=lambda x: -x[1])
        return [(s / max(len(tokens), 1), t) for t, s in ranked[:top_n]]

    def ranked_columns_for_tokens(self, tokens: list, top_n: int = 10) -> list:
        """Return [(score, table, col)] sorted descending."""
        scores: dict = defaultdict(float)
        for tok in tokens:
            for tname, cname in self._tok_index.get(tok, []):
                scores[(tname, cname)] += 1.0
        ranked = sorted(scores.items(), key=lambda x: -x[1])
        return [(s / max(len(tokens), 1), t, c) for (t, c), s in ranked[:top_n]]


# ---------------------------------------------------------------------------
# DMN rule extractor
# ---------------------------------------------------------------------------

def extract_attributes(rules: list) -> dict:
    """
    Extract all unique attribute names from rule list.
    Returns {attr_name: [dt_name, ...]} mapping.
    """
    attr_dts: dict = defaultdict(set)

    def _walk(when, dt):
        if isinstance(when, dict):
            for k, v in when.items():
                if k in ('and', 'or', 'not'):
                    items = v if isinstance(v, list) else [v]
                    for item in items:
                        _walk(item, dt)
                elif isinstance(v, list) and len(v) == 2:
                    if isinstance(v[0], str):
                        attr_dts[v[0]].add(dt)
                    if isinstance(v[1], str):
                        attr_dts[v[1]].add(dt)

    for rule in rules:
        _walk(rule.get('when', {}), rule.get('dt', ''))

    return {a: sorted(dts) for a, dts in attr_dts.items()}


def load_rules(path: str) -> list:
    """
    Load rules from either a JSON file or a Camunda DMN XML file.
    Format is detected automatically from the file extension.
    """
    if path.lower().endswith('.dmn'):
        from attribute_grounder.dmn_parser import load_rules_dmn
        return load_rules_dmn(path)
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)


# ---------------------------------------------------------------------------
# SQL template builders
# ---------------------------------------------------------------------------

def _pk_params(schema: dict, table: str) -> str:
    """Return 'COL1=? AND COL2=?' for the PK columns of a table."""
    if table not in schema:
        return 'id=?'
    pks = schema[table]['pk_columns']
    if not pks:
        pks = ['id']
    return ' AND '.join(f'{p}=?' for p in pks)


def _fk_params(schema: dict, table: str, related_tables: list) -> str:
    """
    Build a WHERE clause using FK columns that link `table` to `related_tables`.
    Falls back to PK if no FK found.
    """
    if table not in schema:
        return 'id=?'
    fk_cols = []
    for col in schema[table]['columns']:
        if col['fk_ref'] and col['fk_ref']['table'] in related_tables:
            fk_cols.append(col['name'])
    if fk_cols:
        return ' AND '.join(f'{c}=?' for c in fk_cols)
    # Fall back to PK
    return _pk_params(schema, table)


# ---------------------------------------------------------------------------
# Tier 1: Direct match
# ---------------------------------------------------------------------------

# Preferred table name fragments by domain — ordered by priority
# Tables whose names contain these substrings are boosted in disambiguation
_DOMAIN_PREFERRED = [
    # Academic/ERP (Flex)
    'STUDENT_SEMESTER', 'STUDENT_PROGRAM', 'STUDENT_ATTENDANCE',
    'COURSE_REGISTRATION', 'COURSE_OFFER', 'CAMP_SEMESTER',
    # Finance
    'INVOICE', 'PAYMENT', 'BASE_USER', 'CUSTOMER', 'PURCHASE_ORDER',
    # Insurance
    'TBLPOLICY', 'TBLCLAIM', 'TBLPREMIUM', 'TBLINSUREE', 'TBLHF',
    # LMS
    'MDL_COURSE', 'MDL_USER', 'MDL_GRADE', 'MDL_ASSIGN', 'MDL_QUIZ',
]

# Tables to deprioritise (temp/log/historical tables)
_DEPRIORITY_SUBSTRINGS = ['TEMP', 'LOG', 'AUDIT', 'HIST', 'BAK', 'BACKUP',
                           'DELETED', 'ARCHIVE', 'OLD', 'TMP']


def _table_priority(table: str) -> float:
    """Return a priority multiplier for a table name."""
    t = table.upper()
    # Exact match in preferred list → strong boost
    if t in _DOMAIN_PREFERRED:
        return 2.0
    # Partial match in preferred list
    for pref in _DOMAIN_PREFERRED:
        if pref in t:
            return 1.6
    # Deprioritise temp/log tables
    for dep in _DEPRIORITY_SUBSTRINGS:
        if dep in t:
            return 0.4
    return 1.0


def tier1_ground(attr: str, index: SchemaIndex, schema: dict,
                 resolved_tables: list) -> dict | None:
    """
    Attempt Tier-1 grounding via exact column-name match.
    Returns grounding dict or None.
    """
    candidates = normalise_attr(attr)

    for cand in candidates:
        matches = index.exact_lookup(cand)
        if not matches:
            continue

        if len(matches) == 1:
            table, col = matches[0]
            # Still deprioritise: if only match is a temp table, let Tier 2 try
            if _table_priority(table) < 0.5:
                continue
            sql = f"SELECT {col['name']} FROM {table} WHERE {_pk_params(schema, table)}"
            return {
                'tier': 1,
                'confidence': 1.0,
                'sql': sql,
                'source_tables': [table],
                'attribute_type': classify_attribute_type(attr),
                'matched_column': f"{table}.{col['name']}",
                'alternatives': [],
            }

        # Multiple matches — rank by table relevance + domain priority
        attr_tokens = tokenise(attr)
        ranked = []
        for table, col in matches:
            already_used = 1.5 if table in resolved_tables else 1.0
            tok_score = index.token_score(attr_tokens, table, col['name'])
            domain_pri = _table_priority(table)
            score = (tok_score + 0.3) * already_used * domain_pri
            ranked.append((score, table, col))

        ranked.sort(key=lambda x: -x[0])
        best_score, best_table, best_col = ranked[0]

        # Skip if best table is deprioritised
        if _table_priority(best_table) < 0.5:
            continue

        sql = (f"SELECT {best_col['name']} FROM {best_table} "
               f"WHERE {_pk_params(schema, best_table)}")
        alts = [
            f"SELECT {c['name']} FROM {t} WHERE {_pk_params(schema, t)}"
            for _, t, c in ranked[1:3]
        ]
        return {
            'tier': 1,
            'confidence': 0.9,
            'sql': sql,
            'source_tables': [best_table],
            'attribute_type': classify_attribute_type(attr),
            'matched_column': f"{best_table}.{best_col['name']}",
            'alternatives': alts,
        }

    return None


# ---------------------------------------------------------------------------
# Tier 2: Pattern-based SQL generation
# ---------------------------------------------------------------------------

def _best_table_for_tokens(tokens: list, index: SchemaIndex, schema: dict,
                            resolved_tables: list) -> tuple | None:
    """
    Find the best (table, score) pair for a set of attribute tokens.
    Applies domain priority multiplier and boosts resolved tables.
    """
    ranked = index.ranked_tables_for_tokens(tokens, top_n=15)
    if not ranked:
        return None
    boosted = []
    for score, tname in ranked:
        already = 1.3 if tname in resolved_tables else 1.0
        dom = _table_priority(tname)
        boosted.append((score * already * dom, tname))
    boosted.sort(key=lambda x: -x[0])
    best_score, best_table = boosted[0]
    if best_score <= 0:
        return None
    return best_table, best_score


def _find_flag_column(schema: dict, table: str, tokens: list) -> str | None:
    """Find a binary-ish flag column in `table` related to given tokens."""
    if table not in schema:
        return None
    for col in schema[table]['columns']:
        cname = col['name'].upper()
        ctype = col['type'].upper()
        # Prioritise columns whose name overlaps with tokens
        col_tokens = set(tokenise(cname))
        overlap = any(t in col_tokens for t in tokens)
        is_flag_type = ctype in ('NUMBER', 'SMALLINT', 'TINYINT', 'INTEGER',
                                  'INT', 'BOOLEAN', 'BIT')
        is_flag_name = any(kw in cname for kw in
                           ('FLAG', 'STATUS', 'ATTEND', 'PRESENT', 'ACTIVE',
                            'PAID', 'APPROVED', 'ENROLLED', 'COMPLETED'))
        if overlap and is_flag_type:
            return cname
        if is_flag_name and is_flag_type:
            return cname
    return None


def _find_amount_column(schema: dict, table: str, tokens: list) -> str | None:
    """Find a numeric amount/sum column in `table`."""
    if table not in schema:
        return None
    for col in schema[table]['columns']:
        cname = col['name'].upper()
        ctype = col['type'].upper()
        col_tokens = set(tokenise(cname))
        overlap = any(t in col_tokens for t in tokens)
        is_numeric = ctype in ('NUMBER', 'FLOAT', 'DECIMAL', 'NUMERIC',
                                'DOUBLE', 'REAL', 'MONEY', 'SMALLMONEY')
        is_amount_name = any(kw in cname for kw in
                             ('AMOUNT', 'AMT', 'FEE', 'BALANCE', 'TOTAL',
                              'SUM', 'PRICE', 'COST', 'CHARGE'))
        if overlap and is_numeric:
            return cname
        if is_amount_name and is_numeric:
            return cname
    return None


def _find_date_column(schema: dict, table: str) -> str | None:
    """Find a date/timestamp column in `table`."""
    if table not in schema:
        return None
    for col in schema[table]['columns']:
        ctype = col['type'].upper()
        if ctype in ('DATE', 'DATETIME', 'TIMESTAMP', 'DATETIME2'):
            return col['name']
    return None


def _make_where(schema: dict, table: str) -> str:
    """Build a generic WHERE clause using PK columns."""
    return _pk_params(schema, table)


def tier2_ground(attr: str, index: SchemaIndex, schema: dict,
                 resolved_tables: list) -> dict | None:
    """
    Attempt Tier-2 grounding via pattern matching.
    Returns grounding dict with alternatives list, or None.
    """
    a_lower = attr.lower()
    tokens = tokenise(attr)
    # Base tokens = all tokens except the suffix pattern word
    base_tokens = tokens[:]

    # ── Pattern A: COUNT suffix ───────────────────────────────────────────────
    if a_lower.endswith('count'):
        base = re.sub(r'count$', '', a_lower).strip('_')
        base_tokens = tokenise(base) if base else tokens
        result = _best_table_for_tokens(base_tokens, index, schema, resolved_tables)
        if result:
            table, score = result
            flag_col = _find_flag_column(schema, table, base_tokens)
            where = _make_where(schema, table)
            if flag_col:
                sql = f"SELECT COUNT(*) FROM {table} WHERE {flag_col}=1 AND {where}"
                conf = 0.55
            else:
                sql = f"SELECT COUNT(*) FROM {table} WHERE {where}"
                conf = 0.50
            alt_sql = f"SELECT COUNT(*) FROM {table} WHERE {where}"
            return {
                'tier': 2,
                'confidence': round(conf * min(score + 0.5, 1.0), 2),
                'sql': sql,
                'source_tables': [table],
                'attribute_type': 'count_aggregate',
                'alternatives': [alt_sql] if alt_sql != sql else [],
                '_pattern': 'A_count',
            }
        return {
            'tier': 2,
            'confidence': 0.30,
            'sql': f"SELECT COUNT(*) FROM [TABLE] WHERE [FK_COLUMN]=?",
            'source_tables': [],
            'attribute_type': 'count_aggregate',
            'alternatives': [],
            '_pattern': 'A_count_no_table',
        }

    # ── Pattern B: Percent / Rate / Ratio ────────────────────────────────────
    for suffix in ('percent', 'pct', 'rate', 'ratio'):
        if a_lower.endswith(suffix):
            base = re.sub(suffix + r'$', '', a_lower).strip('_')
            base_tokens = tokenise(base) if base else tokens
            result = _best_table_for_tokens(base_tokens, index, schema, resolved_tables)
            if result:
                table, score = result
                flag_col = _find_flag_column(schema, table, base_tokens)
                where = _make_where(schema, table)
                if flag_col:
                    sql = (f"SELECT ROUND(COUNT(CASE WHEN {flag_col}=1 THEN 1 END)"
                           f" * 100.0 / NULLIF(COUNT(*), 0), 2)"
                           f" FROM {table} WHERE {where}")
                    conf = 0.60
                else:
                    sql = (f"SELECT ROUND(COUNT(*) * 100.0 / NULLIF("
                           f"(SELECT COUNT(*) FROM {table}), 0), 2)"
                           f" FROM {table} WHERE {where}")
                    conf = 0.35
                alts = [
                    f"SELECT ROUND(SUM([NUM_COL]) * 100.0 / NULLIF(SUM([DEN_COL]), 0), 2)"
                    f" FROM {table} WHERE {where}"
                ]
                return {
                    'tier': 2,
                    'confidence': round(conf * min(score + 0.5, 1.0), 2),
                    'sql': sql,
                    'source_tables': [table],
                    'attribute_type': 'ratio',
                    'alternatives': alts,
                    '_pattern': 'B_percent',
                }

    # ── Pattern C: Amount / Fee / Balance ────────────────────────────────────
    for kw in ('amount', 'fee', 'balance', 'outstanding', 'paid'):
        if kw in a_lower:
            result = _best_table_for_tokens(tokens, index, schema, resolved_tables)
            if result:
                table, score = result
                amount_col = _find_amount_column(schema, table, tokens)
                where = _make_where(schema, table)
                if amount_col:
                    sql = (f"SELECT COALESCE(SUM({amount_col}), 0)"
                           f" FROM {table} WHERE {where}")
                    conf = 0.55
                else:
                    sql = f"SELECT COALESCE(SUM([AMOUNT_COL]), 0) FROM {table} WHERE {where}"
                    conf = 0.35
                return {
                    'tier': 2,
                    'confidence': round(conf * min(score + 0.5, 1.0), 2),
                    'sql': sql,
                    'source_tables': [table],
                    'attribute_type': 'sum_aggregate',
                    'alternatives': [
                        f"SELECT [AMOUNT_COL] FROM {table} WHERE {where}"
                    ],
                    '_pattern': 'C_amount',
                }
            break

    # ── Pattern D: Days / Date / Duration / Age ───────────────────────────────
    for kw in ('days', 'duration', 'age', 'minutes', 'hours', 'since', 'to'):
        if a_lower.endswith(kw) or a_lower.startswith(kw):
            result = _best_table_for_tokens(tokens, index, schema, resolved_tables)
            if result:
                table, score = result
                date_col = _find_date_column(schema, table)
                where = _make_where(schema, table)
                if date_col:
                    sql = (f"SELECT CAST(JULIANDAY('now') - JULIANDAY({date_col})"
                           f" AS INTEGER) FROM {table} WHERE {where}")
                    conf = 0.50
                else:
                    sql = (f"SELECT CAST(JULIANDAY('now') - JULIANDAY([DATE_COL])"
                           f" AS INTEGER) FROM {table} WHERE {where}")
                    conf = 0.35
                return {
                    'tier': 2,
                    'confidence': round(conf * min(score + 0.5, 1.0), 2),
                    'sql': sql,
                    'source_tables': [table],
                    'attribute_type': 'temporal',
                    'alternatives': [],
                    '_pattern': 'D_temporal',
                }
            break

    # ── Pattern E: Status / Flag / Active / Approved ─────────────────────────
    for suffix in ('status', 'flag', 'active', 'approved', 'open', 'valid',
                   'locked', 'committed', 'recorded'):
        if a_lower.endswith(suffix):
            base = re.sub(suffix + r'$', '', a_lower).strip('_')
            base_tokens = tokenise(base) if base else tokens
            result = _best_table_for_tokens(base_tokens + ['status', 'flag'],
                                             index, schema, resolved_tables)
            if result:
                table, score = result
                # Look for a NUMBER(1) or small integer column
                col_name = None
                for col in schema.get(table, {}).get('columns', []):
                    cname = col['name'].upper()
                    ctype = col['type'].upper()
                    if suffix.upper() in cname and ctype in ('NUMBER', 'SMALLINT',
                                                               'TINYINT', 'INTEGER',
                                                               'INT', 'BOOLEAN'):
                        col_name = cname
                        break
                if col_name is None:
                    # Try matching attribute tokens against column names
                    for tok in base_tokens:
                        for col in schema.get(table, {}).get('columns', []):
                            if tok.upper() in col['name'].upper():
                                col_name = col['name']
                                break
                        if col_name:
                            break
                where = _make_where(schema, table)
                if col_name:
                    sql = f"SELECT {col_name} FROM {table} WHERE {where}"
                    conf = 0.65
                else:
                    sql = f"SELECT [{suffix.upper()}_COL] FROM {table} WHERE {where}"
                    conf = 0.40
                return {
                    'tier': 2,
                    'confidence': round(conf * min(score + 0.5, 1.0), 2),
                    'sql': sql,
                    'source_tables': [table],
                    'attribute_type': 'direct_column',
                    'alternatives': [],
                    '_pattern': 'E_status',
                }

    # ── Pattern F: Exists / Granted / Allowed / Used ─────────────────────────
    for suffix in ('exists', 'granted', 'allowed', 'used', 'available'):
        if a_lower.endswith(suffix):
            base = re.sub(suffix + r'$', '', a_lower).strip('_')
            base_tokens = tokenise(base) if base else tokens
            result = _best_table_for_tokens(base_tokens, index, schema, resolved_tables)
            if result:
                table, score = result
                where = _make_where(schema, table)
                sql = (f"SELECT CASE WHEN EXISTS("
                       f"SELECT 1 FROM {table} WHERE {where}"
                       f") THEN 1 ELSE 0 END")
                return {
                    'tier': 2,
                    'confidence': round(0.40 * min(score + 0.5, 1.0), 2),
                    'sql': sql,
                    'source_tables': [table],
                    'attribute_type': 'existence_check',
                    'alternatives': [],
                    '_pattern': 'F_exists',
                }

    # ── General fallback: any token overlap → Tier 2 with low confidence ─────
    result = _best_table_for_tokens(tokens, index, schema, resolved_tables)
    if result:
        table, score = result
        if score >= 0.3:
            where = _make_where(schema, table)
            attr_type = classify_attribute_type(attr)
            if attr_type == 'count_aggregate':
                sql = f"SELECT COUNT(*) FROM {table} WHERE {where}"
            elif attr_type == 'sum_aggregate':
                sql = f"SELECT COALESCE(SUM([AMOUNT_COL]), 0) FROM {table} WHERE {where}"
            elif attr_type == 'ratio':
                sql = f"SELECT ROUND([NUM] * 100.0 / NULLIF([DEN], 0), 2) FROM {table} WHERE {where}"
            else:
                sql = f"SELECT [COLUMN] FROM {table} WHERE {where}"
            return {
                'tier': 2,
                'confidence': round(0.35 * min(score + 0.3, 1.0), 2),
                'sql': sql,
                'source_tables': [table],
                'attribute_type': attr_type,
                'alternatives': [],
                '_pattern': 'general_fallback',
            }

    return None


# ---------------------------------------------------------------------------
# Tier 3: Template generation
# ---------------------------------------------------------------------------

def tier3_ground(attr: str, index: SchemaIndex, schema: dict) -> dict:
    """
    Generate a parameterised template with ranked candidate placeholders.
    Always returns a grounding dict.
    """
    tokens = tokenise(attr)
    attr_type = classify_attribute_type(attr)

    # Determine SQL operation from attribute type
    op_map = {
        'count_aggregate': 'COUNT',
        'sum_aggregate':   'SUM',
        'ratio':           'RATIO',
        'temporal':        'DATE_DIFF',
        'existence_check': 'EXISTS',
        'direct_column':   'SELECT',
        'computed':        'EXPR',
    }
    operation = op_map.get(attr_type, 'SELECT')

    # Generate template SQL
    template_map = {
        'COUNT':    "SELECT COUNT(*) FROM [TABLE] WHERE [FK_COLUMN]=?",
        'SUM':      "SELECT COALESCE(SUM([COLUMN]), 0) FROM [TABLE] WHERE [FK_COLUMN]=?",
        'RATIO':    ("SELECT ROUND(COUNT(CASE WHEN [FLAG_COLUMN]=1 THEN 1 END)"
                     " * 100.0 / NULLIF(COUNT(*), 0), 2) FROM [TABLE] WHERE [FK_COLUMN]=?"),
        'DATE_DIFF': ("SELECT CAST(JULIANDAY('now') - JULIANDAY([DATE_COLUMN])"
                      " AS INTEGER) FROM [TABLE] WHERE [FK_COLUMN]=?"),
        'EXISTS':   ("SELECT CASE WHEN EXISTS(SELECT 1 FROM [TABLE]"
                     " WHERE [FK_COLUMN]=?) THEN 1 ELSE 0 END"),
        'SELECT':   "SELECT [COLUMN] FROM [TABLE] WHERE [FK_COLUMN]=?",
        'EXPR':     "/* TODO: custom expression */ SELECT [COLUMN] FROM [TABLE] WHERE [FK_COLUMN]=?",
    }
    template_sql = template_map.get(operation, template_map['SELECT'])

    # Ranked candidate tables (top 5)
    ranked_tables = index.ranked_tables_for_tokens(tokens, top_n=5)

    # Ranked candidate columns (top 5)
    ranked_cols = index.ranked_columns_for_tokens(tokens, top_n=5)

    # Ranked FK candidates (columns that are FKs in best tables)
    fk_candidates = []
    for _, tname in ranked_tables[:3]:
        if tname in schema:
            for col in schema[tname]['columns']:
                if col['fk_ref']:
                    fk_candidates.append({
                        'table': tname,
                        'column': col['name'],
                        'references': f"{col['fk_ref']['table']}.{col['fk_ref']['column']}"
                    })

    candidates = {
        'TABLE':       [{'table': t, 'score': round(s, 3)}
                        for s, t in ranked_tables],
        'COLUMN':      [{'table': t, 'column': c, 'score': round(s, 3)}
                        for s, t, c in ranked_cols],
        'FLAG_COLUMN': [{'table': t, 'column': c}
                        for _, t, c in ranked_cols
                        if any(kw in c.upper() for kw in
                               ('FLAG', 'STATUS', 'ATTEND', 'PRESENT',
                                'ACTIVE', 'PAID'))],
        'FK_COLUMN':   fk_candidates[:5],
        'DATE_COLUMN': [{'table': t, 'column': c}
                        for _, t, c in ranked_cols
                        if schema.get(t, {}).get('columns') and
                        any(col['name'] == c and col['type'].upper()
                            in ('DATE', 'DATETIME', 'TIMESTAMP')
                            for col in schema.get(t, {}).get('columns', []))],
    }

    return {
        'tier': 3,
        'confidence': 0.15,
        'sql': template_sql,
        'source_tables': [t for _, t in ranked_tables[:2]],
        'attribute_type': attr_type,
        'operation': operation,
        'candidates': candidates,
        'alternatives': [],
    }


# ---------------------------------------------------------------------------
# Main grounding function
# ---------------------------------------------------------------------------

def ground_system(schema: dict, rules: list, system_name: str,
                  existing_groundings: dict = None) -> dict:
    """
    Ground all attributes from `rules` against `schema`.

    Returns:
        {attr_name: grounding_dict}
    """
    existing_groundings = existing_groundings or {}
    index = SchemaIndex(schema)

    # Extract attributes per DT
    attr_dts = extract_attributes(rules)

    # Group attributes by DT for cross-DT table reuse
    dt_attrs: dict = defaultdict(list)
    for attr, dts in attr_dts.items():
        for dt in dts:
            dt_attrs[dt].append(attr)

    results: dict = {}
    resolved_tables: list = []

    for attr in sorted(attr_dts.keys()):
        # Already verified in existing groundings → reuse as Tier 1 verified
        if attr in existing_groundings and existing_groundings[attr].get('verified'):
            results[attr] = existing_groundings[attr]
            for t in existing_groundings[attr].get('source_tables', []):
                if t not in resolved_tables:
                    resolved_tables.append(t)
            continue

        # Tier 1: direct match
        g = tier1_ground(attr, index, schema, resolved_tables)
        if g:
            g['verified'] = True
            g['verified_by'] = 'auto'
            results[attr] = g
            for t in g['source_tables']:
                if t not in resolved_tables:
                    resolved_tables.append(t)
            continue

        # Tier 2: pattern-based
        g = tier2_ground(attr, index, schema, resolved_tables)
        if g:
            g['verified'] = False
            g['verified_by'] = None
            results[attr] = g
            for t in g['source_tables']:
                if t not in resolved_tables:
                    resolved_tables.append(t)
            continue

        # Tier 3: template
        g = tier3_ground(attr, index, schema)
        g['verified'] = False
        g['verified_by'] = None
        results[attr] = g

    return results
