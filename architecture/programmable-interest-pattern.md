# Programmable interest pattern

Decompose an interest-bearing instrument into:
1. Static principal-tracking contract (`InterestBearingDeposit`)
2. Pluggable strategy contract implementing `IInterestStrategy`
3. Optional rate/KPI oracle dependencies
4. Registry mapping ruleId → strategy address

## Why split

Same `InterestBearingDeposit` code can host any rule. Issuance bank deploys ONE registry, ONE factory; each new product launch = one strategy contract + one rule registration.

Operationally:
- New regulator request? Deploy new strategy with floor/cap; old products unchanged.
- New reference rate available? Replace oracle inside one strategy; others unaffected.
- Compliance freeze on a rule? Mark deprecated in registry; existing instruments continue, no new ones deploy.

## Components

```
+----------------+     +----------------+     +-----------------+
|  RuleRegistry  |<----|  Factory       |---->|  Strategy       |
|  (bytes32 ID → |     |  (deploy with  |     |  IInterestStrategy
|   strategy)    |     |   ruleId)      |     |  pattern        |
+----------------+     +----------------+     +-----------------+
        |                       |                       |
        v                       v                       v
+-----------------+    +----------------+      +----------------+
|  Audit log      |    |  Deposit       |----->|  Rate / KPI    |
|  (ruleHash)     |    |  Instance      |      |  Oracle        |
+-----------------+    +----------------+      +----------------+
```

## Interface

```solidity
interface IInterestStrategy {
    function previewAccrual(uint256 balance, uint64 fromTs, uint64 toTs) view returns (uint256);
    function kind() view returns (string memory);
    function dayCount() view returns (string memory);
}
```

Strategy is a pure read-only function over `(balance, fromTs, toTs)`. Stateful effects (oracle reads) happen during view; all writes happen in the deposit contract.

## Strategy taxonomy (paycodex-rules-poc)

| Strategy | Inputs (constructor) | Reads at runtime |
|---|---|---|
| Simple | rate, basis | — |
| CompoundDaily | rate, basis | — |
| Tiered | tiers[], basis | — |
| Floating | oracle, spread, basis, floor, cap | oracle.getRateBps() |
| KpiLinked | kpi, baseSpread, range, basis | kpi.spreadAdjustmentBps() |
| TwoTrack | rate, hardBps, ecrBps, reserveBps, basis | — |

## Trade-offs

Pros:
- New rules ship without redeploying core
- Strategy code is small, isolated, audit-friendly
- Registry provides declarative inventory
- Off-chain rule schema (JSON) is the single source of truth

Cons:
- Indirection cost (CALL to strategy contract per accrual): ~700 gas
- Cross-contract state has to be reasoned about (e.g. oracle stale check belongs in strategy)
- Upgrade via "deprecate + new ruleId" is cleaner than mutable strategy, but means existing deposits keep old logic

## When to use

✅ Bank issuing many rule-variant products
✅ Multi-tenant tokenisation platforms (each tenant picks rule)
✅ Pilot environments where rules change frequently

❌ Single-product issuance — overhead not justified
❌ When upgrade-in-place is required (registry append-only model doesn't support it)

## Related

[[rule-driven-deployment-pattern]] · [[../concepts/interest-accrual-onchain]] · [[../concepts/oracle-rate-feeds]] · [[tokenization-platform-pattern]]
