"""
attribute_grounder/cache.py
============================
Persists verified attribute groundings to JSON files in the groundings/ directory.
"""

import json
import os
from datetime import datetime

GROUNDINGS_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'groundings')


def _cache_path(system: str) -> str:
    os.makedirs(GROUNDINGS_DIR, exist_ok=True)
    return os.path.join(GROUNDINGS_DIR, f'{system}_groundings.json')


def load_cache(system: str) -> dict:
    """Load existing groundings for a system. Returns empty dict if not found."""
    path = _cache_path(system)
    if not os.path.exists(path):
        return {}
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)


def save_grounding(system: str, attr: str, grounding: dict) -> None:
    """Save or update a single attribute grounding in the cache."""
    cache = load_cache(system)
    # Store only the fields relevant for persistence
    persist = {
        'tier':                   grounding.get('tier'),
        'confidence':             grounding.get('confidence'),
        'sql':                    grounding.get('sql'),
        'source_tables':          grounding.get('source_tables', []),
        'attribute_type':         grounding.get('attribute_type'),
        'verified':               grounding.get('verified', False),
        'verified_by':            grounding.get('verified_by'),
        'verification_timestamp': (
            grounding.get('verification_timestamp') or
            (datetime.utcnow().isoformat() if grounding.get('verified') else None)
        ),
    }
    # Preserve tier-3 candidates if present
    if 'candidates' in grounding:
        persist['candidates'] = grounding['candidates']
    if 'alternatives' in grounding and grounding['alternatives']:
        persist['alternatives'] = grounding['alternatives']
    cache[attr] = persist
    _write_cache(system, cache)


def save_all_groundings(system: str, groundings: dict) -> None:
    """Save an entire groundings dict to the cache (merges with existing)."""
    cache = load_cache(system)
    now = datetime.utcnow().isoformat()
    for attr, grounding in groundings.items():
        persist = {
            'tier':                   grounding.get('tier'),
            'confidence':             grounding.get('confidence'),
            'sql':                    grounding.get('sql'),
            'source_tables':          grounding.get('source_tables', []),
            'attribute_type':         grounding.get('attribute_type'),
            'verified':               grounding.get('verified', False),
            'verified_by':            grounding.get('verified_by'),
            'verification_timestamp': (
                grounding.get('verification_timestamp') or
                (now if grounding.get('verified') else None)
            ),
        }
        if 'candidates' in grounding:
            persist['candidates'] = grounding['candidates']
        if 'alternatives' in grounding and grounding['alternatives']:
            persist['alternatives'] = grounding['alternatives']
        cache[attr] = persist
    _write_cache(system, cache)


def _write_cache(system: str, cache: dict) -> None:
    path = _cache_path(system)
    with open(path, 'w', encoding='utf-8') as f:
        json.dump(cache, f, indent=2, ensure_ascii=False)


def is_verified(system: str, attr: str) -> bool:
    """Return True if the attribute grounding has been verified."""
    cache = load_cache(system)
    return cache.get(attr, {}).get('verified', False)


def get_unverified(system: str) -> list:
    """Return list of attribute names that have not been verified."""
    cache = load_cache(system)
    return [attr for attr, g in cache.items() if not g.get('verified', False)]


def mark_verified(system: str, attr: str, sql: str, verified_by: str = 'human') -> None:
    """Mark an attribute as verified with a (possibly edited) SQL."""
    cache = load_cache(system)
    if attr in cache:
        cache[attr]['verified'] = True
        cache[attr]['verified_by'] = verified_by
        cache[attr]['sql'] = sql
        cache[attr]['verification_timestamp'] = datetime.utcnow().isoformat()
        _write_cache(system, cache)
