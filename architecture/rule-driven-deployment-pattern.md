# Rule-driven deployment pattern

Pattern for deploying instances of a smart-contract template parameterised by a declarative rule. Rules live in versioned JSON; deployment scripts and on-chain factory both consume the same schema.

## Why declarative rules

Three problems with imperative-only deployment:
1. **Auditability** — rule JSON is human-readable; auditors review JSON, not transactions
2. **Off-chain ⇄ on-chain parity** — same rule drives WASM preview AND Solidity deploy
3. **Operability** — non-engineers (treasury, compliance) edit JSON, not Solidity

## Anatomy

```
rule.json  ─┬─►  validate (JSON schema)
            ├─►  WASM preview (run accrual sim, show user)
            └─►  deploy script
                    │
                    ├─► deploy strategy contract with rule params
                    ├─► register in RuleRegistry (key=ruleId, value=strategyAddress)
                    └─► instantiate deposit via factory
```

## Schema as contract

JSON Schema (Draft 2020-12) defines:
- Required fields per `kind`
- Numeric ranges (rateBps ≤ ±10000)
- Enum values (basis, frequency, withholding regime)
- Cross-field validity (e.g. tiered must have tiers array)

Both WASM and Solidity strategies are written to consume the same shape. Contracts validate at constructor time:

```solidity
require(rateBps_ <= 10000, "rate too high");
require(hardPortion + ecrPortion <= 10000, "portions overflow");
```

## Hash anchoring

Every registered rule's keccak256(JSON) is stored on-chain:

```solidity
struct Entry {
    address strategy;
    bytes32 ruleHash;     // ← keccak256 of the canonical rule JSON
    uint64 registeredAt;
    bool deprecated;
}
```

This anchors the off-chain rule to its deployed strategy. Auditors can reproduce the strategy from the JSON, or verify a stored rule matches a strategy.

## Upgrade and deprecation

Append-only registry: new rule version = new ruleId. Old rule deprecated, existing instances continue running. No mutability of registered entries.

Why no in-place upgrade:
- Customer-facing instruments must have stable rate logic — surprise upgrades = customer harm
- Audit trail simpler when entries are immutable
- "Migration" = redeploy with new ruleId + customer-consented switch (operational, not technical)

## Multi-tenant variant

Same registry hosts rules from many tenants. Each rule keyed by `ruleId = keccak(tenantId || ruleVersion)`. Tenants don't see each other's strategies but share factory + registry deployment cost.

For permissioned chains (Besu IBFT2 in PoC), this is the natural model — bank consortium shares chain, each member registers rules under its tenantId.

## Trade-offs

Pros:
- Single source of truth (JSON)
- Reproducible deployments
- Off-chain simulation parity
- Compliance review without code reading

Cons:
- Schema evolution requires versioning discipline (breaking changes need new schema URI)
- Some advanced rules can't be expressed declaratively (need imperative Solidity)
- Tooling overhead — JSON validators, code generators, etc.

## Picture: paycodex-rules-poc

Scaffolded as `paycodex-rules-poc/` sibling to this graph. Schema in `rules/schema.json`; 8 examples in `rules/examples/`; deploy script in `scripts/deploy.ts`; WASM mirror in `wasm/assembly/index.ts`.

## Related

[[programmable-interest-pattern]] · [[tokenization-platform-pattern]] · [[../concepts/interest-accrual-onchain]] · [[../decisions/0007-interest-calc-precision]] · [[../decisions/0008-rate-source-trust-model]]
