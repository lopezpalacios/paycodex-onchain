# Interest accrual on-chain

Translating the accrual mechanics of [[../../paycodex/concepts/interest-calculation]] into Solidity. Four canonical patterns; pick by product economics + gas budget.

## Pattern A — Linear per-second

```solidity
function previewAccrual(uint256 balance, uint64 fromTs, uint64 toTs) view returns (uint256) {
    uint256 dt = toTs - fromTs;
    return balance * rateBps * dt / (10_000 * SECONDS_PER_YEAR);
}
```

- Pros: simple, gas-cheap, deterministic
- Cons: no compounding; rate-update mid-period requires checkpoint bookkeeping
- Best for: simple-interest demand deposits, money-market instruments

## Pattern B — Index-based (Aave-style)

Per-asset cumulative interest index in storage:

```solidity
uint256 public liquidityIndex;        // 1e27 (RAY)
uint64  public lastUpdateTs;

function _updateIndex() internal {
    uint256 dt = block.timestamp - lastUpdateTs;
    if (dt == 0) return;
    uint256 rate = currentRateRay();   // RAY scaled
    // index *= 1 + rate * dt / yearSecs
    liquidityIndex = liquidityIndex.rayMul(WAD + rate.rayMul(dt) / SECONDS_PER_YEAR);
    lastUpdateTs = uint64(block.timestamp);
}

function balanceOf(address user) view returns (uint256) {
    return scaledBalance[user].rayMul(liquidityIndex);
}
```

- Pros: O(1) per user; transfers don't trigger per-user accrual; closed-form continuous-time
- Cons: precision via RAY (1e27); compounding only via repeated linear segments (continuous approximation)
- Best for: pooled deposit / loan products, ERC-20 with rebasing balance semantics

## Pattern C — ERC-4626 NAV / share appreciation

```solidity
contract Vault is ERC4626 {
    // External "rebase" via direct asset top-up to vault — no per-block accrual code
    // pricePerShare = totalAssets / totalSupply increases as assets grow
}
```

- Pros: standard, composable with DeFi tooling, no on-chain interest math
- Cons: requires off-chain rebalancer (custodian top-up); gaming risk if mint/redeem timing isn't fair
- Best for: tokenised MMF (BUIDL, FOBXX, OUSG pattern), institutional yield products

## Pattern D — Rebasing token

Token's `balanceOf(user)` increases over time without transfer events:

```solidity
function balanceOf(address u) view returns (uint256) {
    return _shares[u] * totalSupply() / _totalShares;
}
```

- Pros: customer balance grows visibly in wallet; no claim transaction
- Cons: breaks ERC-20 invariants (balance ≠ what was last transferred); some integrators struggle
- Best for: stablecoin-like yield products (stETH-style)

## Comparison

| Pattern | Compounding | Gas / accrual | Precision | Standard |
|---|---|---|---|---|
| Linear per-second | None | Lowest | Bps × seconds | Custom |
| Index-based | Continuous-approx | Medium | RAY (1e27) | Aave |
| ERC-4626 NAV | Implicit via rebalance | None on-chain | Vault math | EIP-4626 |
| Rebasing | Continuous | Medium | Wad share basis | Custom |

## Picking the pattern

| If the product is... | Use |
|---|---|
| Single-customer fixed-rate deposit | Linear per-second (Pattern A) |
| Pool with floating rate, many holders | Index-based (Pattern B) |
| Tokenised regulated fund | ERC-4626 (Pattern C) |
| Yield-bearing wallet token | Rebasing (Pattern D) |

## Picture: what `paycodex-rules-poc` uses

`InterestBearingDeposit.sol` uses Pattern A — simplest, single-customer, demonstrates rule plug-in. For a real deposit product with many holders, refactor to Pattern B.

## Withholding application

WHT applies at POSTING (capitalisation) event, not accrual:

```solidity
function postInterest() external {
    _accrueToNow();
    uint256 gross = accruedInterest;
    accruedInterest = 0;
    uint256 wht = whtEnabled ? gross * whtBps / 10_000 : 0;
    principal += (gross - wht);
    if (wht > 0) emit WhtCollected(wht);
}
```

Tax-collection address can be a separate contract enforcing remittance schedule.

## Related

[[oracle-rate-feeds]] · [[fixed-point-math]] · [[day-count-onchain]] · [[../architecture/programmable-interest-pattern]] · [[../decisions/0007-interest-calc-precision]] · [[../../paycodex/concepts/interest-calculation]]
