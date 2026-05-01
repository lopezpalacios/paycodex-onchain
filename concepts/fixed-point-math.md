# Fixed-point math (interest)

Solidity has no native floats. Interest = principal × rate × time × possibly compounding requires careful integer arithmetic to preserve precision.

## Three scaling conventions

| Name | Scale | Used by | Precision |
|---|---|---|---|
| **WAD** | 1e18 | OpenZeppelin, MakerDAO, most | 18 decimals |
| **RAY** | 1e27 | Aave (interest indices) | 27 decimals |
| **bps** | 1e4 | Banking convention, most rate inputs | 4 decimals (0.01%) |

Common pattern: rates expressed in bps at the API surface, scaled to WAD/RAY internally for computation.

## Two libraries you'll meet

### PRBMath (Paul Razvan Berg)

Best-in-class Solidity fixed-point. Provides `UD60x18` (unsigned 60.18) and `SD59x18` (signed). Has `exp`, `ln`, `pow` — what you need for compound interest.

```solidity
import { ud, mul, div } from "prb-math/UD60x18.sol";
UD60x18 r = ud(rateBps).mul(ud(1e14));  // bps → WAD
```

Pros: well-audited, broad math support.
Cons: gas overhead vs hand-rolled; type-system noise.

### ABDKMath64x64

64.64 fixed-point via int128. Older, lighter, used by some DeFi protocols.

Pros: gas-efficient.
Cons: 64.64 limits precision; less ergonomic API.

### OZ Math + custom

Roll-your-own using OZ Math:

```solidity
// (1 + r/n)^n compound:
function rpow(uint256 base, uint256 exp) internal pure returns (uint256 result) {
    result = 1e18;
    while (exp > 0) {
        if (exp & 1 == 1) result = result * base / 1e18;
        base = base * base / 1e18;
        exp >>= 1;
    }
}
```

Used in MakerDAO (`rmul`, `rpow`) and `paycodex-rules-poc`'s `WadMath.sol`. Good for narrow needs.

## Overflow risks

Naive `principal * rateBps * days` overflows for large principal:

```
2^256 = 1.16e77
1e30 (large institutional principal) × 1000 bps × 3650 days = 3.65e36 — fine
1e30 × 1000 × 1e6 (microsecond units) = 1e39 — fine
1e30 × 10000 (full bps) × 86400 × 3650 (5y in seconds) = 3.15e44 — fine
```

But once you scale to WAD: `principal_wad × rate_wad / 1e18` — multiplication BEFORE division is ~1e54 for large values. OZ Math `mulDiv` handles this safely.

## Rounding

Direction matters for who-bears-cost:
- **Round down** — depositor loses sub-unit; bank-friendly
- **Round up** — bank loses sub-unit; depositor-friendly
- **Round-to-even (banker's)** — neutral; not natural in integer Solidity

Industry pattern: round down on user-paid interest (loans), round up on bank-paid interest (deposits) — depositor-friendly. But check product T&Cs.

## Compounding at integer scale

Iterative (per-day):
```solidity
for (uint256 i = 0; i < days; i++) {
    balance = balance + balance * rateBps / (10_000 * denom);
}
```

365 iterations × ~5k gas = ~2M gas. Acceptable for posting events that happen monthly. NOT acceptable inside `transfer()`.

Closed-form (rpow):
```solidity
uint256 onePlusR = WAD + rateBps * WAD / (10_000 * denom);
uint256 factor = rpow(onePlusR, days);
return balance * factor / WAD - balance;
```

`rpow` is O(log days) — for 365 days, ~9 iterations of squaring. ~50k gas. Industry standard.

## Cross-language parity

If WASM previews must match Solidity (see `paycodex-rules-poc/test/03-parity.test.ts`):
- WASM uses `f64` `Math.pow` — fast, IEEE-754
- Solidity uses integer rpow on wad-scaled base — bit-exact deterministic

These differ at ~1e-7 relative for 365-day compounding. Tolerance band in tests: 0.1% for compound, 0.01% for everything else.

## Related

[[interest-accrual-onchain]] · [[oracle-rate-feeds]] · [[day-count-onchain]] · [[../decisions/0007-interest-calc-precision]]
