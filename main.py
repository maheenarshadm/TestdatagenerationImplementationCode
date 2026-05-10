"""
attribute_grounder/main.py
==========================
CLI entry point.

Commands:
  ground    --system SYS --schema FILE --rules FILE
  verify    --system SYS
  report    --systems SYS [SYS ...]
  generate  --system SYS
  run-all
"""

import argparse
import json
import os
import sys

# Allow running as: python attribute_grounder/main.py  or  python -m attribute_grounder
_pkg_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if _pkg_dir not in sys.path:
    sys.path.insert(0, _pkg_dir)

from attribute_grounder.schema_parser import load_schema_from_file
from attribute_grounder.grounder import ground_system, load_rules
from attribute_grounder.dmn_parser import load_rules_dmn
from attribute_grounder.cache import save_all_groundings, load_cache
from attribute_grounder.verifier import run_verification_session
from attribute_grounder.reporter import (
    generate_tier_report, generate_cross_system_report,
    generate_aggregation_module, print_tier_summary
)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

# Canonical file paths (relative to CWD or absolute)
_SCHEMA_FILES = {
    'flex':     'Flex1.sql',
    'moodle':   'moodle_full_schema_4_3.sql',
    'jbilling': 'jbilling_schema.sql',
    'openimis': 'openIMIS_schema__1_.sql',
}
# Canonical rules file names — JSON preferred, DMN as fallback
# The pipeline auto-detects format from the file extension.
_RULES_FILES = {
    'flex':     'flex_redesigned_rules.json',
    'moodle':   'moodle_redesigned_rules.json',
    'jbilling': 'jbilling_redesigned_rules.json',
    'openimis': 'openimis_rules.json',
}
# DMN fallback filenames (used when JSON not found)
_RULES_FILES_DMN = {
    'flex':     'flex_rules.dmn',
    'moodle':   'moodle_rules.dmn',
    'jbilling': 'jbilling_rules.dmn',
    'openimis': 'openimis_rules.dmn',
}


def _resolve(filename: str, search_dirs: list) -> str | None:
    """Return first existing path for filename across search_dirs."""
    if os.path.isabs(filename) and os.path.exists(filename):
        return filename
    for d in search_dirs:
        p = os.path.join(d, filename)
        if os.path.exists(p):
            return p
    return None


def _find_input_dirs() -> list:
    """Look for input files in CWD, /mnt/user-data/uploads, and script dir."""
    dirs = [
        os.getcwd(),
        '/mnt/user-data/uploads',
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    ]
    return [d for d in dirs if os.path.isdir(d)]


# ---------------------------------------------------------------------------
# Command: ground
# ---------------------------------------------------------------------------

def cmd_ground(system: str, schema_path: str, rules_path: str) -> dict:
    print(f'\n[ground] system={system}')
    print(f'  schema : {schema_path}')
    print(f'  rules  : {rules_path}')

    schema = load_schema_from_file(schema_path)
    print(f'  Parsed {len(schema)} tables from schema.')

    rules = load_rules(rules_path)
    print(f'  Loaded {len(rules)} rules.')

    # Load any existing verified groundings to preserve them
    existing = load_cache(system)

    groundings = ground_system(schema, rules, system, existing_groundings=existing)

    # Auto-verified Tier 1 go straight to cache; Tier 2/3 pending
    save_all_groundings(system, groundings)

    # Count tiers
    t1 = sum(1 for g in groundings.values() if g['tier'] == 1)
    t2 = sum(1 for g in groundings.values() if g['tier'] == 2)
    t3 = sum(1 for g in groundings.values() if g['tier'] == 3)
    total = len(groundings)

    print(f'\n  Results ({total} attributes):')
    print(f'    Tier 1 (auto):          {t1:3d}  ({t1/total*100:5.1f}%)')
    print(f'    Tier 2 (human-verify):  {t2:3d}  ({t2/total*100:5.1f}%)')
    print(f'    Tier 3 (template):      {t3:3d}  ({t3/total*100:5.1f}%)')
    print(f'  Saved to groundings/{system}_groundings.json\n')

    # Generate tier report
    report = generate_tier_report(system, schema, rules, groundings)
    print_tier_summary(report)

    return groundings


# ---------------------------------------------------------------------------
# Command: verify
# ---------------------------------------------------------------------------

def cmd_verify(system: str) -> None:
    run_verification_session(system)


# ---------------------------------------------------------------------------
# Command: report
# ---------------------------------------------------------------------------

def cmd_report(systems: list) -> str:
    search_dirs = _find_input_dirs()
    reports = []

    for system in systems:
        # Try to load groundings + rules for each system
        rules_file = _SCHEMA_FILES.get(system.lower(), '')
        rules_file = _RULES_FILES.get(system.lower(), '')
        rules_path = _resolve(rules_file, search_dirs)

        if not rules_path:
            print(f'  [warn] No rules file found for {system}, skipping report.')
            continue

        rules = load_rules(rules_path)
        groundings = load_cache(system)

        # We don't need schema for reporting (tier stats are in groundings)
        report = generate_tier_report(system, {}, rules, groundings)
        reports.append(report)
        print_tier_summary(report)

    if not reports:
        print('No reports generated.')
        return ''

    latex = generate_cross_system_report(reports)
    print('\nLaTeX table written to reports/cross_system_table.tex\n')
    print(latex)
    return latex


# ---------------------------------------------------------------------------
# Command: generate
# ---------------------------------------------------------------------------

def cmd_generate(system: str) -> str:
    search_dirs = _find_input_dirs()
    rules_file = _RULES_FILES.get(system.lower(), '')
    rules_path = _resolve(rules_file, search_dirs)

    if not rules_path:
        print(f'Rules file not found for system: {system}')
        sys.exit(1)

    rules = load_rules(rules_path)
    groundings = load_cache(system)

    if not groundings:
        print(f'No groundings found for {system}. Run "ground" first.')
        sys.exit(1)

    source = generate_aggregation_module(system, {}, rules, groundings)
    print(f'Generated module written to generated/{system}_aggregation.py')
    print(f'  ({source.count(chr(10))} lines)')
    return source


# ---------------------------------------------------------------------------
# Command: run-all
# ---------------------------------------------------------------------------

def cmd_run_all() -> None:
    search_dirs = _find_input_dirs()
    systems = ['flex', 'moodle', 'jbilling', 'openimis']
    all_reports = []

    for system in systems:
        schema_file = _SCHEMA_FILES.get(system)
        rules_file  = _RULES_FILES.get(system)

        schema_path = _resolve(schema_file, search_dirs)
        rules_path  = _resolve(rules_file, search_dirs)

        if not schema_path:
            print(f'[{system}] Schema file not found: {schema_file}  — skipping.')
            continue
        if not rules_path:
            print(f'[{system}] Rules file not found: {rules_file}  — skipping.')
            continue

        groundings = cmd_ground(system, schema_path, rules_path)
        cmd_generate(system)

        rules = load_rules(rules_path)
        report = generate_tier_report(system, {}, rules, groundings)
        all_reports.append(report)

    if all_reports:
        latex = generate_cross_system_report(all_reports)
        print('\n' + '═' * 60)
        print('Cross-system LaTeX table:')
        print('═' * 60)
        print(latex)
        print('Written to reports/cross_system_table.tex')


# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog='attribute_grounder',
        description='Semi-Automated DMN Attribute Grounding System'
    )
    sub = p.add_subparsers(dest='command')

    # ground
    g = sub.add_parser('ground', help='Run grounding pipeline on a system')
    g.add_argument('--system',  required=True, help='System name (flex/moodle/jbilling/openimis)')
    g.add_argument('--schema',  required=False, help='Path to SQL schema file')
    g.add_argument('--rules',   required=False, help='Path to DMN rules JSON file')

    # verify
    v = sub.add_parser('verify', help='Interactive verification session')
    v.add_argument('--system', required=True)

    # report
    r = sub.add_parser('report', help='Generate cross-system LaTeX report')
    r.add_argument('--systems', nargs='+', required=True)

    # generate
    ge = sub.add_parser('generate', help='Generate Python aggregation module')
    ge.add_argument('--system', required=True)

    # run-all
    sub.add_parser('run-all', help='Run full pipeline on all four systems')

    return p


def main():
    parser = build_parser()
    args = parser.parse_args()
    search_dirs = _find_input_dirs()

    if args.command == 'ground':
        # Resolve schema and rules paths
        schema_path = args.schema
        rules_path  = args.rules
        system = args.system.lower()

        if not schema_path:
            default_schema = _SCHEMA_FILES.get(system)
            if default_schema:
                schema_path = _resolve(default_schema, search_dirs)
        if not rules_path:
            default_rules = _RULES_FILES.get(system)
            if default_rules:
                rules_path = _resolve(default_rules, search_dirs)
            # Fall back to .dmn if .json not found
            if not rules_path:
                default_dmn = _RULES_FILES_DMN.get(system)
                if default_dmn:
                    rules_path = _resolve(default_dmn, search_dirs)

        if not schema_path or not os.path.exists(schema_path):
            print(f'Schema file not found for system [{system}]. '
                  f'Pass --schema explicitly or ensure the file is in the current directory.')
            sys.exit(1)
        if not rules_path or not os.path.exists(rules_path):
            print(f'Rules file not found for system [{system}]. '
                  f'Pass --rules explicitly.')
            sys.exit(1)

        cmd_ground(system, schema_path, rules_path)

    elif args.command == 'verify':
        cmd_verify(args.system.lower())

    elif args.command == 'report':
        cmd_report([s.lower() for s in args.systems])

    elif args.command == 'generate':
        cmd_generate(args.system.lower())

    elif args.command == 'run-all':
        cmd_run_all()

    else:
        parser.print_help()


if __name__ == '__main__':
    main()
