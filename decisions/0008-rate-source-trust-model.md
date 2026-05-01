# ADR 0008 — Rate source trust model

**Status:** Accepted (PoC); will reconsider for production
**Date:** 2026-05-01

## Context

Floating-rate strategies need a current reference-rate value (€STR, SOFR, SARON). Rate flows directly into customer-paid interest — wrong/stale = direct economic harm + supervisor finding.

## Decision (PoC)

`MockRateOracle` — single-publisher, mutable, owner-only. Used for development and demo only.

Production deployments MUST replace with one of:
1. **Chainlink decentralised feed** — Tier 2 (multi-node consensus), available for SOFR/ESTR
2. **Pyth pull-feed with bank as authorised publisher** — Tier 2-3, lower latency
3. **Direct CB attestation** — Tier 3, requires CB to publish signed messages on-chain (future state)

## Trust escalation table

| Production tier | Use case |
|---|---|
| Single-issuer pilot | Tier 2 OK |
| Multi-tenant tokenisation platform | Tier 2 minimum, Tier 3 preferred for regulated cash legs |
| Wholesale CBDC integration | Tier 3 mandatory |
| ESG/KPI-linked products | Tier 2 OK; KPI source trust framework needed in addition |

## Required guards (any tier)

Strategy contract MUST:
- Check oracle staleness (block.timestamp − oracle.lastUpdate < threshold)
- Apply per-update deviation cap (≤ X bps from prior reading)
- Sanity-bound rate values (within [min, max] business range)
- Emit event on each rate consumption (audit trail)

`paycodex-rules-poc` `FloatingStrategy` does not implement these — PoC simplification, called out in `MockRateOracle` README.

## Fallback behaviour

If primary oracle stale or out-of-bounds:
- **Default:** revert (depositor sees error, posting halted)
- **Optional flag:** carry-forward last good rate for `gracePeriodSeconds` then revert
- **NEVER:** silently substitute zero or arbitrary fallback

## Consequences

- PoC easy to develop + test; production adoption requires oracle-replacement work
- Compliance reviewers will want explicit rate-source documentation per deployment
- Multi-tier upgrade path is straightforward (oracle is one constructor argument)

## Related

[[../concepts/oracle-rate-feeds]] · [[../concepts/interest-accrual-onchain]] · [[0007-interest-calc-precision]]
