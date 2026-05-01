# Oracle rate feeds

How floating-rate on-chain instruments source their reference rate. Mirrors the off-chain dependency on €STR / SOFR / SARON publications.

## Trust model is the whole game

Rate moves billions of dollars. A compromised or stale oracle = wrong interest paid = direct economic harm. Three trust models, escalating:

### Tier 1 — Single oracle (lowest trust)

Single signed publisher: bank's own oracle, or Chainlink price feed. Cheapest, easiest. Used by most DeFi.

```solidity
interface IRateOracle {
    function getRateBps() external view returns (int256);
}
```

Risks:
- Operator compromise → wrong rate
- Liveness failure → stale rate; production should fallback or pause

### Tier 2 — Multi-publisher consensus

K-of-N publishers, each sign rate, contract takes median. Used by Chainlink decentralised feeds, Pyth, RedStone.

```solidity
function getRateBps() external view returns (int256) {
    int256[] memory rates = collectFromPublishers();
    return median(rates);
}
```

Defends against single-operator compromise. Cost: more oracle infrastructure.

### Tier 3 — Source-attested (highest)

Central bank or scheme operator (ECB, BoE, NY Fed, SIX) directly publishes a signed message with their authoritative rate. On-chain verifier checks the signature against pinned public key.

For tokenised regulated products, supervisors often require Tier 3 — bank cannot rely on third-party oracle for rates that drive customer-paid interest.

## What feeds exist today

| Feed | Source | Tier | Notes |
|---|---|---|---|
| Chainlink SOFR | Chainlink network of nodes | Tier 2 | Available on Eth mainnet |
| Chainlink ESTR | Chainlink network | Tier 2 | Limited deployment |
| RedStone push feeds | RedStone oracle network | Tier 2 | Push-based, lower latency |
| Pyth | First-party publishers (banks, exchanges) | Tier 2-3 | Pull-based via verified messages |
| Direct CB publication | (None public yet for major CBs) | Tier 3 | Future state — DLT-pilot regulators |

## Fallback strategy

If primary oracle fails:
1. Fallback to secondary feed (manual switch by ops, OR programmatic)
2. Pin to last good rate for N hours (with degradation alarm)
3. Pause posting until restored
4. Halt new deposits until rate is current

```solidity
function _safeRate() internal view returns (int256) {
    try primary.getRateBps() returns (int256 r) {
        if (block.timestamp - primary.lastUpdate() < STALE_THRESHOLD) return r;
    } catch {}
    return secondary.getRateBps(); // or revert / pause
}
```

## Update cadence

| Reference rate | Publication | On-chain update target |
|---|---|---|
| €STR | Daily, 08:00 CET | Within 1 hour of CB publication |
| SOFR | Daily, 08:00 ET | Within 1 hour |
| SARON | Daily, 18:00 CET | Within 1 hour |
| EURIBOR (1m/3m/6m) | Daily, 11:00 CET | Within 1 hour |

If the on-chain instrument does daily-reset, oracle staleness directly distorts customer interest.

## Deviation guards

Smart-contract guards against manipulated oracle:
- Max-deviation per update (e.g. ±100 bps from prior)
- Velocity throttle (no more than X bps/hour)
- Sanity bounds (rate ∈ [-200, 2000] bps)

If breached: pause + ops alert. Better to halt than to pay wrong interest.

## Related

[[interest-accrual-onchain]] · [[fixed-point-math]] · [[oracles]] · [[../architecture/programmable-interest-pattern]] · [[../decisions/0008-rate-source-trust-model]] · [[../../paycodex/concepts/reference-rates]]
