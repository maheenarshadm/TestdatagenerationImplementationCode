"""
attribute_grounder/dmn_parser.py
=================================
Parses Camunda DMN 1.3 XML (.dmn) files into the canonical rule list
format used by the rest of the pipeline.

Supported FEEL expression patterns (from actual Camunda DMN files):
  -                      wildcard / any        → condition skipped
  1                      literal equality      → {"=":  [attr, 1]}
  >= 30                  comparison literal    → {">=": [attr, 30]}
  < creditLimit          comparison variable   → {"<":  [attr, "creditLimit"]}
  >= 0 and < creditLimit compound             → {"and": [{">=":…}, {"<":…}]}
  > 0 and >= invoicesProcessed               → {"and": [{">":…}, {">=":…}]}

Output format — identical to existing JSON rule files:
  [
    {
      "dt":          "DT1_CustomerCreditRisk",
      "id":          "credit_GOOD_STANDING",
      "label":       "",
      "description": "Customer in good credit standing — ...",
      "output":      {"creditRisk": "GOOD_STANDING"},
      "when":        {"and": [{"=": ["userStatusId", 1]}, ...]}
    },
    ...
  ]
"""

import re
import xml.etree.ElementTree as ET
import json
import os


# ── namespace detection ───────────────────────────────────────────────────────

def _detect_ns(root: ET.Element) -> str:
    tag = root.tag
    if tag.startswith("{"):
        return tag[1:tag.index("}")]
    return ""


def _q(ns: str, local: str) -> str:
    return f"{{{ns}}}{local}" if ns else local


# ── FEEL value parsing ────────────────────────────────────────────────────────

def _is_number(s: str) -> bool:
    try:
        float(s)
        return True
    except ValueError:
        return False


def _parse_value(raw: str):
    """Convert a FEEL token to int, float, or string (attribute name)."""
    raw = raw.strip()
    if raw.startswith('"') and raw.endswith('"'):
        return raw[1:-1]           # quoted string literal
    if _is_number(raw):
        v = float(raw)
        return int(v) if v == int(v) else v
    return raw                     # attribute name reference


_OP_MAP = {">=": ">=", "<=": "<=", ">": ">", "<": "<", "!=": "!=", "=": "="}

_CLAUSE_RE = re.compile(r'(>=|<=|>|<|!=|=)?\s*(-?[\w".]+)')


def _parse_single_clause(attr: str, expr: str) -> dict | None:
    """Parse one FEEL clause (no 'and') into a condition dict."""
    expr = expr.strip()
    if expr in ("-", "", "any"):
        return None
    m = _CLAUSE_RE.fullmatch(expr)
    if not m:
        return None
    op_tok  = m.group(1)
    val     = _parse_value(m.group(2))
    op      = _OP_MAP.get(op_tok, "=") if op_tok else "="
    return {op: [attr, val]}


def _decode_feel(raw: str) -> str:
    """Decode XML character entities in FEEL text."""
    return (raw or "").strip()\
        .replace("&gt;", ">").replace("&lt;", "<")\
        .replace("&amp;", "&").replace("&quot;", '"')


def _parse_feel_entry(attr: str, raw: str) -> list:
    """
    Parse a FEEL inputEntry cell for `attr`.
    Returns a list of condition dicts (empty = no constraint on this input).
    """
    text = _decode_feel(raw)
    if text in ("-", "", "any"):
        return []

    # Split on FEEL 'and' conjunction within a single cell
    clauses = re.split(r'\s+and\s+', text, flags=re.IGNORECASE)
    conditions = []
    for clause in clauses:
        c = _parse_single_clause(attr, clause.strip())
        if c is not None:
            conditions.append(c)
    return conditions


def _parse_output_text(raw: str) -> str:
    """Strip surrounding FEEL quotes from an output literal."""
    text = _decode_feel(raw)
    if text.startswith('"') and text.endswith('"'):
        return text[1:-1]
    return text


# ── main parser ───────────────────────────────────────────────────────────────

def parse_dmn_file(path: str) -> list:
    """
    Parse a Camunda DMN 1.3 XML file.
    Returns a list of rule dicts in the pipeline's canonical format.
    """
    tree = ET.parse(path)
    root = tree.getroot()
    ns   = _detect_ns(root)

    rules = []

    for decision in root.iter(_q(ns, "decision")):
        dt_id = decision.attrib.get("id", "")

        dt_elem = decision.find(_q(ns, "decisionTable"))
        if dt_elem is None:
            continue

        # Collect input column attribute names (ordered)
        input_attrs = []
        for inp in dt_elem.findall(_q(ns, "input")):
            expr_elem = inp.find(_q(ns, "inputExpression"))
            if expr_elem is not None:
                text_elem = expr_elem.find(_q(ns, "text"))
                attr_name = (text_elem.text or "").strip() if text_elem is not None else ""
            else:
                attr_name = inp.attrib.get("label", "")
            if attr_name:
                input_attrs.append(attr_name)

        # Collect output column names
        output_cols = []
        for out in dt_elem.findall(_q(ns, "output")):
            col_name = out.attrib.get("name") or out.attrib.get("label", "output")
            output_cols.append(col_name)

        # Process each rule row
        for rule_elem in dt_elem.findall(_q(ns, "rule")):
            rule_id = rule_elem.attrib.get("id", "")

            # Description: prefer <description>, fall back to <annotationEntry>
            description = ""
            desc_elem = rule_elem.find(_q(ns, "description"))
            if desc_elem is not None and desc_elem.text:
                description = desc_elem.text.strip()
            if not description:
                ann = rule_elem.find(_q(ns, "annotationEntry"))
                if ann is not None:
                    text_e = ann.find(_q(ns, "text"))
                    if text_e is not None and text_e.text:
                        description = text_e.text.strip()

            # Parse input entries → condition list
            input_entries  = rule_elem.findall(_q(ns, "inputEntry"))
            all_conditions = []
            for i, entry in enumerate(input_entries):
                if i >= len(input_attrs):
                    break
                text_elem = entry.find(_q(ns, "text"))
                raw_text  = text_elem.text if text_elem is not None else "-"
                conds     = _parse_feel_entry(input_attrs[i], raw_text or "-")
                all_conditions.extend(conds)

            # Parse output entries → output dict
            output_entries = rule_elem.findall(_q(ns, "outputEntry"))
            output_dict    = {}
            for i, oentry in enumerate(output_entries):
                if i >= len(output_cols):
                    break
                text_elem = oentry.find(_q(ns, "text"))
                raw_val   = text_elem.text if text_elem is not None else ""
                output_dict[output_cols[i]] = _parse_output_text(raw_val)

            # Build when clause
            if not all_conditions:
                when = {}
            elif len(all_conditions) == 1:
                when = all_conditions[0]
            else:
                when = {"and": all_conditions}

            rules.append({
                "dt":          dt_id,
                "id":          rule_id,
                "label":       "",
                "description": description,
                "output":      output_dict,
                "when":        when,
            })

    return rules


def load_rules_dmn(path: str) -> list:
    """Public entry point — load rules from a Camunda .dmn file."""
    return parse_dmn_file(path)
