# ADR 0002 — Cash leg strategy

**Status**: Proposed
**Date**: 2026-04-25

## Decision

**Issue tokenized deposit (CHF/EUR) on permissioned chain. Use MiCA stablecoin (USDC/EURC) on public chain. Subscribe to wholesale CBDC where available (Helvetia for CHF). No retail CBDC distribution until digital euro confirmed.**

## Reasoning

- Tokenized deposit = bank's commercial bank money, fits banking books
- MiCA stablecoin = best regulated public-chain leg
- Wholesale CBDC = highest-tier money for interbank
- Retail CBDC: wait + see — pre-build wallet pattern only

## Linked

[[0001-public-vs-permissioned]] · [[../03-cash-legs-comparison]]
