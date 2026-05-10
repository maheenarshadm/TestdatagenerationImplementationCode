"""
attribute_grounder/schema_parser.py
====================================
Parses Oracle DDL, MySQL DDL, SQL Server DDL, and PostgreSQL DDL
into a unified schema representation.

Key techniques:
  - Paren-depth counting to extract CREATE TABLE bodies (handles SQL Server
    CONSTRAINT blocks with nested parentheses)
  - Supports: "SCHEMA"."TABLE", `db`.`table`, [dbo].[table], bare identifiers
  - ALTER TABLE ADD CONSTRAINT parsing for PKs and FKs
"""

import re
from collections import defaultdict, deque

# ---------------------------------------------------------------------------
# Identifier cleaning
# ---------------------------------------------------------------------------

def _strip_quotes(name: str) -> str:
    name = name.strip().strip('\r\n')
    for start, end in [('"', '"'), ('`', '`'), ('[', ']')]:
        if name.startswith(start) and name.endswith(end):
            name = name[1:-1]
            break
    return name.upper().strip()


def _clean_identifier(raw: str) -> str:
    raw = raw.strip().strip('\r\n')
    # Oracle: "SCHEMA"."TABLE"
    m = re.split(r'"\s*\.\s*"', raw)
    if len(m) >= 2:
        last = m[-1].strip()
        if last.endswith('"'): last = last[:-1]
        return last.upper().strip()
    # MySQL: `db`.`table`
    m = re.split(r'`\s*\.\s*`', raw)
    if len(m) >= 2:
        last = m[-1].strip()
        if last.endswith('`'): last = last[:-1]
        return last.upper().strip()
    # SQL Server: [dbo].[table]
    m = re.split(r'\]\s*\.\s*\[', raw)
    if len(m) >= 2:
        last = m[-1].strip()
        if last.endswith(']'): last = last[:-1]
        return last.upper().strip()
    return _strip_quotes(raw)


def _normalise_type(raw_type: str) -> str:
    t = raw_type.strip().strip('[]').upper()
    t = re.sub(r'\s*\(.*', '', t)
    t = re.sub(r'\s+.*', '', t)
    return t or 'UNKNOWN'


_ID_FRAG = (
    r'(?:"[^"]+"\s*\.\s*"[^"]+"|"[^"]+"|`[^`]+`\s*\.\s*`[^`]+`|`[^`]+`'
    r'|\[[^\]]+\]\s*\.\s*\[[^\]]+\]|\[[^\]]+\]|\w+)'
)

# ---------------------------------------------------------------------------
# Core parser
# ---------------------------------------------------------------------------

def parse_schema(sql_text: str) -> dict:
    sql_text = sql_text.replace('\r\n', '\n').replace('\r', '\n')
    schema = {}

    header_re = re.compile(r'CREATE\s+TABLE\s+(' + _ID_FRAG + r')', re.IGNORECASE)

    for hm in header_re.finditer(sql_text):
        raw_name   = hm.group(1)
        table_name = _clean_identifier(raw_name)

        pos = hm.end()
        while pos < len(sql_text) and sql_text[pos] in ' \t\n':
            pos += 1
        if pos >= len(sql_text) or sql_text[pos] != '(':
            continue

        depth = 0; body_end = pos; i = pos
        while i < len(sql_text):
            if sql_text[i] == '(':   depth += 1
            elif sql_text[i] == ')':
                depth -= 1
                if depth == 0: body_end = i; break
            i += 1

        body_start = pos + 1
        if body_end <= body_start:
            continue

        body = sql_text[body_start:body_end]
        columns, pk_inline, fk_inline = _parse_body(body)

        pk_set = set(pk_inline)
        for col in columns:
            if col['name'] in pk_set:
                col['is_pk'] = True

        fk_map = {fc: (rt, rc) for fc, rt, rc in fk_inline}
        for col in columns:
            if col['name'] in fk_map:
                rt, rc = fk_map[col['name']]
                col['fk_ref'] = {'table': rt, 'column': rc}

        schema[table_name] = {
            'columns':      columns,
            'pk_columns':   list(dict.fromkeys(c['name'] for c in columns if c['is_pk'])),
            'fk_columns':   list(dict.fromkeys(c['name'] for c in columns if c['fk_ref'])),
            'referenced_by': []
        }

    # ALTER TABLE PRIMARY KEY
    pk_alter = re.compile(
        r'ALTER\s+TABLE\s+(' + _ID_FRAG + r')'
        r'(?:\s+WITH\s+\w+)?\s+ADD\s+CONSTRAINT\s+\S+\s+PRIMARY\s+KEY'
        r'(?:\s+CLUSTERED|\s+NONCLUSTERED)?\s*\(([^)]+)\)',
        re.IGNORECASE
    )
    for m in pk_alter.finditer(sql_text):
        tname = _clean_identifier(m.group(1))
        pk_cols = [_strip_quotes(re.sub(r'\s+(ASC|DESC)$', '', c.strip(),
                    flags=re.IGNORECASE).strip()) for c in m.group(2).split(',')]
        if tname in schema:
            for col in schema[tname]['columns']:
                if col['name'] in pk_cols: col['is_pk'] = True
            schema[tname]['pk_columns'] = list(dict.fromkeys(
                schema[tname]['pk_columns'] + pk_cols))

    # ALTER TABLE FOREIGN KEY
    fk_alter = re.compile(
        r'ALTER\s+TABLE\s+(' + _ID_FRAG + r')'
        r'(?:\s+WITH\s+(?:CHECK|NOCHECK))?\s+ADD\s+CONSTRAINT\s+\S+\s+'
        r'FOREIGN\s+KEY\s*\(([^)]+)\)\s+REFERENCES\s+(' + _ID_FRAG + r')\s*\(([^)]+)\)',
        re.IGNORECASE
    )
    for m in fk_alter.finditer(sql_text):
        child_t  = _clean_identifier(m.group(1))
        fk_cols  = [_strip_quotes(c.strip()) for c in m.group(2).split(',')]
        parent_t = _clean_identifier(m.group(3))
        ref_cols = [_strip_quotes(c.strip()) for c in m.group(4).split(',')]
        if child_t not in schema:
            continue
        for fc, rc in zip(fk_cols, ref_cols):
            for col in schema[child_t]['columns']:
                if col['name'] == fc:
                    col['fk_ref'] = {'table': parent_t, 'column': rc}
            if fc not in schema[child_t]['fk_columns']:
                schema[child_t]['fk_columns'].append(fc)
        if parent_t in schema and child_t not in schema[parent_t]['referenced_by']:
            schema[parent_t]['referenced_by'].append(child_t)

    # Build referenced_by from inline FKs
    for tname, tdata in schema.items():
        for col in tdata['columns']:
            if col['fk_ref']:
                parent = col['fk_ref']['table']
                if parent in schema and tname not in schema[parent]['referenced_by']:
                    schema[parent]['referenced_by'].append(tname)

    for tname in schema:
        schema[tname]['pk_columns'] = list(dict.fromkeys(schema[tname]['pk_columns']))
        schema[tname]['fk_columns'] = list(dict.fromkeys(schema[tname]['fk_columns']))

    return schema


def _parse_body(body: str):
    columns = []; pk_cols = []; fk_inline = []
    for defn in _split_defs(body):
        defn = defn.strip()
        if not defn: continue
        up = defn.upper()

        if re.match(r'(CONSTRAINT\s+\S+\s+)?PRIMARY\s+KEY', up):
            cm = re.search(
                r'PRIMARY\s+KEY(?:\s+CLUSTERED|\s+NONCLUSTERED)?\s*\(([^)]+)\)',
                defn, re.IGNORECASE)
            if cm:
                for c in cm.group(1).split(','):
                    cname = re.sub(r'\s+(ASC|DESC)$', '', c.strip(),
                                   flags=re.IGNORECASE).strip()
                    pk_cols.append(_strip_quotes(cname))
            continue

        if re.match(r'(CONSTRAINT\s+\S+\s+)?FOREIGN\s+KEY', up):
            fm = re.search(
                r'FOREIGN\s+KEY\s*\(([^)]+)\)\s+REFERENCES\s+(' + _ID_FRAG + r')\s*\(([^)]+)\)',
                defn, re.IGNORECASE)
            if fm:
                fcs  = [_strip_quotes(c.strip()) for c in fm.group(1).split(',')]
                rt   = _clean_identifier(fm.group(2))
                rcs  = [_strip_quotes(c.strip()) for c in fm.group(3).split(',')]
                for fc, rc in zip(fcs, rcs):
                    fk_inline.append((fc, rt, rc))
            continue

        if re.match(r'(CONSTRAINT\s+\S+\s+)?(UNIQUE|CHECK|INDEX)\b', up):
            continue
        if up.strip().startswith('WITH ') and 'PAD_INDEX' in up:
            continue

        col = _parse_column_def(defn)
        if col:
            columns.append(col)

    return columns, pk_cols, fk_inline


def _split_defs(body: str) -> list:
    parts = []; depth = 0; current = []
    for ch in body:
        if ch == '(':   depth += 1; current.append(ch)
        elif ch == ')': depth -= 1; current.append(ch)
        elif ch == ',' and depth == 0:
            parts.append(''.join(current)); current = []
        else:
            current.append(ch)
    if current: parts.append(''.join(current))
    return parts


def _parse_column_def(defn: str) -> dict | None:
    defn = defn.strip()
    m = re.match(
        r'^(?:"([^"]+)"|`([^`]+)`|\[([^\]]+)\]|(\w+))'
        r'\s+(\[?[A-Za-z][A-Za-z0-9_]*\]?(?:\s*\([^)]*\))?)',
        defn
    )
    if not m:
        return None
    col_name = (m.group(1) or m.group(2) or m.group(3) or m.group(4)).upper()
    col_type = _normalise_type(m.group(5))
    rest     = defn[m.end():].upper()
    return {
        'name':     col_name,
        'type':     col_type,
        'nullable': 'NOT NULL' not in rest,
        'is_pk':    'PRIMARY KEY' in rest,
        'fk_ref':   None,
    }


# ---------------------------------------------------------------------------
# Utility functions
# ---------------------------------------------------------------------------

def get_topological_order(schema: dict) -> list:
    in_degree  = {t: 0 for t in schema}
    dependents = defaultdict(list)
    for tname, tdata in schema.items():
        parents_seen = set()
        for col in tdata['columns']:
            if col['fk_ref']:
                parent = col['fk_ref']['table']
                if parent in schema and parent != tname and parent not in parents_seen:
                    in_degree[tname] += 1
                    dependents[parent].append(tname)
                    parents_seen.add(parent)
    queue = deque(sorted(t for t, d in in_degree.items() if d == 0))
    order = []
    while queue:
        node = queue.popleft(); order.append(node)
        for child in sorted(dependents[node]):
            in_degree[child] -= 1
            if in_degree[child] == 0: queue.append(child)
    order.extend(sorted(t for t in schema if t not in set(order)))
    return order


def get_table_columns_flat(schema: dict) -> dict:
    return {f"{t}.{c['name']}": c['type']
            for t, td in schema.items() for c in td['columns']}


def find_columns_by_pattern(schema: dict, pattern: str) -> list:
    rx = re.compile(pattern, re.IGNORECASE)
    return [(t, c['name'], c['type'])
            for t, td in schema.items()
            for c in td['columns'] if rx.search(c['name'])]


def load_schema_from_file(path: str) -> dict:
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        return parse_schema(f.read())
