# 01 — Technical requirements

A tokenized MMF combines fund-administration patterns with on-chain identity gating, NAV publication, and atomic subscription / redemption.

## 1. Chain selection

- Permissioned chains, public chains with allowlist (ERC-3643), or hybrid (canonical permissioned + public mirror).
- Selection criteria: regulator familiarity, investor accessibility, finality model, operational maturity.
- Per-chain risk assessment.

## 2. Smart contract suite

- Token contract (ERC-4626-style vault or ERC-20 with NAV oracle, depending on design).
- Identity / allowlist contract (ERC-3643 / ONCHAINID).
- Transfer-restriction module (ERC-1404 patterns).
- Subscription / redemption contract.
- NAV oracle / publisher (signed updates, cadence per scheme).
- Pause / circuit breaker.
- Upgradeability (proxy + timelock).
- Roles separated (mint, burn, NAV-publisher, freeze, upgrade) with multi-sig per role.

Audits, static analysis, fuzzing, formal verification per the standard pattern.

## 3. On-chain identity / allowlist

- Every wallet bound to an investor record.
- Attestations: KYC tier, jurisdiction, accreditation status, sanctions clear.
- Re-attestation on schedule; expiry blocks transfers.

## 4. NAV pipeline

- NAV calculated by fund administrator off-chain at the regulated cadence (daily for most MMFs; intraday for some tokenized products).
- NAV signed and published on-chain via oracle / privileged role.
- Drift checks: on-chain NAV must match administrator-computed NAV at every cycle.
- Stale-NAV detection blocks subscriptions and redemptions until refreshed.

## 5. Key management

- HSM-backed (FIPS 140-2/3 Level 3+).
- MPC-augmented multi-sig with role separation.
- Quorum participants geographically and organisationally separated.
- Hardware-rooted approvals.
- Key ceremonies; tamper-evident archive.

## 6. Subscription / redemption orchestrator

- Bidirectional bridge between fund administrator and chain.
- Idempotent on subscription / redemption reference.
- Exactly-once issuance and burn semantics.
- Cash leg integration (USDC, USDC-on-other-chains, USD wires, tokenized deposits).

## 7. Reconciliation

- Continuous reconciliation between on-chain `totalSupply()` and fund register.
- Daily reconciliation against fund administrator's records.
- Drift triggers Sev 1 incident.

## 8. Observability

- On-chain monitoring of every event (subscription, redemption, NAV update, transfers, pause, role changes).
- Off-chain APM on orchestrator, NAV pipeline, identity service.
- SIEM correlation across on-chain and off-chain events.

## 9. Resilience

- Multi-AZ / multi-region for off-chain components.
- Documented RTO / RPO; tested DR drills.
- NAV-feed redundancy.

## 10. Standards

- ERC-4626 (tokenized vault) for share-price designs.
- ERC-20 for rebase-style designs.
- ERC-3643 (T-REX) for identity-gated transfers.
- ERC-1400 / ERC-1404 patterns where security-token semantics overlap.
- IVMS 101 for Travel Rule.

## 11. Test and QA

- High-coverage unit tests.
- Property-based / invariant tests.
- End-to-end integration tests across fund admin, chain, custody, cash-leg rails.
- Chaos / fault-injection tests (NAV-feed outage, oracle failure).

## Cross-links

[`./README.md`](./README.md) · [`07-custody-and-fund-admin.md`](./07-custody-and-fund-admin.md) · [`10-security-cyber.md`](./10-security-cyber.md) · [`../../standards/erc-3643-trex.md`](../../standards/erc-3643-trex.md)
