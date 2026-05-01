# ADR 0007 — Interest calculation precision

**Status:** Accepted
**Date:** 2026-05-01

## Context

Interest accrual on tokenised deposits requires fixed-point math in Solidity. Three scaling regimes available: WAD (1e18), RAY (1e27), bps (1e4).

For `paycodex-rules-poc`:
- Customer-facing rates expressed in bps (banking convention)
- Internal compounding requires more precision than bps to avoid daily rounding drift
- WASM mirror compares against Solidity output at parity tolerance

## Decision

- **API surface:** bps (1e4 scaling) — matches banking convention, what compliance reviews
- **Internal compute:** WAD (1e18) — sufficient precision for daily compounding over multi-year periods
- **No RAY:** unnecessary precision for single-customer deposit; would only be justified for pooled index-based products with many users hitting same rate

## Math regime per strategy

| Strategy | Compute regime | Notes |
|---|---|---|
| Simple | bps × seconds | Linear, no scaling needed |
| Compound daily | bps → WAD → rpow | rpow stays in WAD |
| Tiered | bps × seconds | Linear per slice |
| Floating | bps × seconds | Linear, oracle-driven |
| KPI-linked | bps × seconds | Linear, KPI-adjusted |
| Two-track | bps × seconds | Linear, split by portion |

Only Compound uses WAD-scale rpow. All others stay in integer bps × seconds, dividing by `10_000 × denom × SECONDS_PER_DAY` at end.

## Rounding policy

- Round DOWN — `solidity / operator on uints
- Documented in user-facing T&Cs as "rounded to nearest base unit, depositor-favoured at posting"
- For depositor-paid interest (loans), round up; reverse-skewed for depositor-friendly framing

## Tolerance for WASM-Solidity parity

| Strategy | Relative tolerance |
|---|---|
| Simple, Tiered, Floating, KpiLinked, TwoTrack | 0.01% (0.0001) |
| Compound daily | 0.10% (0.001) — f64 vs integer rpow drift |

Failure exceeds tolerance → parity test breaks → CI alarm.

## Consequences

- Compound preview is "good enough" for browser previews; on-chain is authoritative
- If precision becomes inadequate (e.g. very large principals over many years), upgrade path is RAY-based index pattern (Aave-style, see [[../concepts/interest-accrual-onchain]])
- New strategies must declare their regime + add parity test

## Alternatives considered

- **PRBMath everywhere** — heavier import, more gas, but well-audited. Worth considering if math needs grow.
- **Off-chain authoritative** — let off-chain compute, post result. Loses on-chain auditability. Rejected.
- **f64 in Solidity** — does not exist; would need fixed-point library. WAD is the native idiom.

## Related

[[../concepts/fixed-point-math]] · [[../concepts/interest-accrual-onchain]]
