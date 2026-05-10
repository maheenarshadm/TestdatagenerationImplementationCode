"""
attribute_grounder/verifier.py
==============================
Terminal-based interactive verification interface for Tier 2 and Tier 3 groundings.
"""

import json
import os
import sys
import textwrap
from datetime import datetime

from .cache import load_cache, mark_verified, save_grounding


# ---------------------------------------------------------------------------
# Display helpers
# ---------------------------------------------------------------------------

WIDTH = 70


def _box(lines: list) -> None:
    print('┌' + '─' * WIDTH + '┐')
    for line in lines:
        # wrap long lines
        wrapped = textwrap.wrap(line, WIDTH - 2)
        if not wrapped:
            wrapped = ['']
        for wl in wrapped:
            print('│ ' + wl.ljust(WIDTH - 2) + ' │')
    print('└' + '─' * WIDTH + '┘')


def _format_sql(sql: str) -> list:
    """Return SQL formatted as lines with indent."""
    # Simple line-split at FROM / WHERE / AND / OR
    for kw in (' FROM ', ' WHERE ', ' AND ', ' OR ', ' JOIN '):
        sql = sql.replace(kw, '\n  ' + kw.strip() + ' ')
    return ['  ' + ln.strip() for ln in sql.strip().splitlines() if ln.strip()]


def display_grounding(attr: str, grounding: dict) -> None:
    """Display a grounding for human review."""
    tier = grounding.get('tier', '?')
    conf = grounding.get('confidence', 0.0)
    atype = grounding.get('attribute_type', '?')
    sql = grounding.get('sql', '-- no SQL')
    alts = grounding.get('alternatives', [])
    candidates = grounding.get('candidates', {})

    lines = [
        f'ATTRIBUTE: {attr}',
        f'TIER: {tier}  |  CONFIDENCE: {conf:.2f}  |  TYPE: {atype}',
        '',
        'GENERATED SQL:',
    ]
    lines.extend(_format_sql(sql))

    if alts:
        lines.append('')
        lines.append('ALTERNATIVE CANDIDATES:')
        for i, alt in enumerate(alts[:3], start=2):
            lines.append(f'  [{i}] {alt[:60]}{"..." if len(alt)>60 else ""}')

    if candidates and tier == 3:
        lines.append('')
        lines.append('RANKED TABLE CANDIDATES:')
        for item in candidates.get('TABLE', [])[:5]:
            lines.append(f'  • {item["table"]}  (score={item["score"]})')
        col_items = candidates.get('COLUMN', [])[:5]
        if col_items:
            lines.append('RANKED COLUMN CANDIDATES:')
            for item in col_items:
                lines.append(f'  • {item["table"]}.{item["column"]}  (score={item["score"]})')

    lines.append('')
    lines.append('OPTIONS:')
    lines.append('  [V] Verify as correct')
    lines.append('  [E] Edit SQL manually')
    if alts:
        for i in range(2, min(len(alts) + 2, 5)):
            lines.append(f'  [{i}] Choose alternative {i}')
    lines.append('  [S] Skip for now')
    lines.append('  [Q] Quit verification session')

    _box(lines)


# ---------------------------------------------------------------------------
# Interactive session
# ---------------------------------------------------------------------------

def run_verification_session(system: str) -> None:
    """
    Interactive terminal loop for verifying all unverified groundings.
    """
    cache = load_cache(system)
    unverified = [
        attr for attr, g in sorted(cache.items())
        if not g.get('verified', False)
    ]

    if not unverified:
        print(f'\n✓ All groundings for [{system}] are already verified.\n')
        return

    print(f'\nVerification session for system: {system}')
    print(f'Unverified attributes: {len(unverified)}\n')

    for idx, attr in enumerate(unverified):
        grounding = cache[attr]
        print(f'\n[{idx + 1}/{len(unverified)}]')
        display_grounding(attr, grounding)

        while True:
            try:
                choice = input('Choice: ').strip().upper()
            except (EOFError, KeyboardInterrupt):
                print('\nSession interrupted.')
                return

            if choice == 'V':
                mark_verified(system, attr, grounding['sql'], 'human')
                print(f'  ✓ Verified: {attr}')
                break

            elif choice == 'E':
                print('Enter corrected SQL (end with empty line):')
                lines = []
                while True:
                    try:
                        ln = input()
                    except EOFError:
                        break
                    if ln == '':
                        break
                    lines.append(ln)
                new_sql = ' '.join(lines).strip()
                if new_sql:
                    mark_verified(system, attr, new_sql, 'human')
                    print(f'  ✓ Verified with edited SQL: {attr}')
                else:
                    print('  (no SQL entered, skipping)')
                break

            elif choice in ('2', '3', '4'):
                alts = grounding.get('alternatives', [])
                alt_idx = int(choice) - 2
                if 0 <= alt_idx < len(alts):
                    mark_verified(system, attr, alts[alt_idx], 'human')
                    print(f'  ✓ Verified with alternative {choice}: {attr}')
                else:
                    print(f'  No alternative [{choice}] available.')
                    continue
                break

            elif choice == 'S':
                print(f'  → Skipped: {attr}')
                break

            elif choice == 'Q':
                print('\nSession ended.')
                return

            else:
                print('  Invalid choice. Enter V/E/2/3/S/Q.')

    remaining = len([a for a in load_cache(system).values()
                     if not a.get('verified', False)])
    print(f'\nSession complete. Remaining unverified: {remaining}\n')


# ---------------------------------------------------------------------------
# Batch verification from file
# ---------------------------------------------------------------------------

def batch_verify_from_file(system: str, corrections_file: str) -> None:
    """
    Read a JSON file of pre-written corrections and apply them to the cache.

    Expected format:
    {
      "attr_name": {
        "sql": "SELECT ...",
        "verified_by": "human"      (optional, defaults to "batch")
      },
      ...
    }
    """
    if not os.path.exists(corrections_file):
        print(f'Corrections file not found: {corrections_file}')
        return

    with open(corrections_file, 'r', encoding='utf-8') as f:
        corrections = json.load(f)

    applied = 0
    for attr, data in corrections.items():
        sql = data.get('sql', '')
        by = data.get('verified_by', 'batch')
        if sql:
            mark_verified(system, attr, sql, by)
            applied += 1

    print(f'Applied {applied} corrections to [{system}] from {corrections_file}')
