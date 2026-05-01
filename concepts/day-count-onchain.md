# Day-count on-chain

Day-count convention enforcement in Solidity. See [[../../paycodex/concepts/day-count-conventions]] for the off-chain reference.

## block.timestamp granularity

Solidity sees seconds since epoch (uint64 sufficient through 2554). Day-count basis maps to:

```solidity
uint256 SECONDS_PER_DAY = 86400;
function daysBetween(uint64 fromTs, uint64 toTs) pure returns (uint256) {
    return (uint256(toTs) - uint256(fromTs)) / SECONDS_PER_DAY;
}
```

This treats time as continuous-day. For sub-day accrual (per-second linear), keep seconds; for posting math, integrate to days.

## act/360 vs act/365

Just denominator change:

```solidity
function denomFor(Basis b) pure returns (uint256) {
    if (b == Basis.ACT_360) return 360;
    if (b == Basis.ACT_365) return 365;
    if (b == Basis.THIRTY_360) return 360;
    return 365; // ACT_ACT_ISDA simplified
}
```

The conventions differ in how the year is sliced, but on-chain you only need the denominator at compute time.

## 30/360 — the awkward one

True 30/360 requires breaking timestamps into year/month/day, applying month-end conventions, etc. Not natively available on-chain. Options:

1. **Approximate** — use act/360 (close enough for most demand-deposit purposes)
2. **Pre-compute** — off-chain compute the day count, pass as parameter, post-verify
3. **Use a date library** — BokkyPooBah's DateTimeLibrary exists; gas-heavy

`paycodex-rules-poc` takes option 1 — documents the approximation, defers true 30/360 implementation to production.

## act/act-ISDA

Splits period across leap-year boundary:

```
days_in_leap_year_portion / 366 + days_in_non_leap_portion / 365
```

Same library issue as 30/360. For demo, treated as act/365.

## Leap seconds and clock drift

`block.timestamp` is set by the validator; can drift up to ~15 seconds vs wall clock. For interest, this is irrelevant (sub-day precision). For trade settlement timing, may matter.

## Finality and rate updates

If rate updates and accrual posting both happen on the same block, ordering matters. Defensive pattern:

```solidity
function _accrueToNow() internal {
    if (block.timestamp <= lastAccrualTs) return;
    // accrue first using OLD rate
    ...
}

function setRate(uint256 newRate) external {
    _accrueToNow();  // close out at old rate
    rate = newRate;  // then update
}
```

## Related

[[interest-accrual-onchain]] · [[fixed-point-math]] · [[../../paycodex/concepts/day-count-conventions]]
