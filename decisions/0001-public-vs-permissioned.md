# ADR 0001 — Public vs permissioned chain

**Status**: Proposed
**Date**: 2026-04-25

## Decision

**Hybrid: permissioned EVM (Besu) for bank-internal + interbank; public chain (L2 first) for customer-facing where regulator-friendly.**

## Reasoning

- Permissioned: KYC'd participants, compliance enforced via T-REX, no MEV/front-running, low cost
- Public: liquidity (DeFi yield), customer-held wallets, cross-bank reach
- Hybrid via [[../architecture/permissioned-public-bridge-pattern]]

## Trade-offs

- Two stacks to operate
- Bridge risk
- Worth it for liquidity + compliance balance

## Linked

[[0002-cash-leg-strategy]] · [[../architecture/permissioned-public-bridge-pattern]]
