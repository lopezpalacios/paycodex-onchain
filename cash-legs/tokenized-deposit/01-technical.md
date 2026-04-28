# 01 — Technical requirements

The technical stack must enforce, at protocol level, every constraint the supervisor expects of a deposit-taking institution. "We rely on off-chain checks" is generally not acceptable for a regulated tokenized deposit.

## 1. Ledger / chain choice

- **Permissioned chain (default)**: Hyperledger Besu, Quorum/GoQuorum, Canton, Corda, Hyperledger Fabric. Validator set known, KYC'd, and contractually bound.
- **Public chain with on-chain compliance**: Ethereum L1 / L2 (Polygon, Arbitrum, Base) with ERC-3643 (T-REX) identity gating. Higher legal complexity; supervisors typically require enhanced controls.
- **Hybrid (Model C)**: permissioned canonical ledger with a controlled mint/burn bridge to public chain.
- Finality model must be deterministic (BFT-style) for cash-leg use; probabilistic finality requires explicit reorg-handling design.
- Throughput, latency, fee-stability targets defined and stress-tested.

## 2. Smart contract suite

Minimum surface (see also [`../../code/`](../../code/)):

- Token contract (ERC-20 base + transfer hooks).
- Identity / allowlist contract (ERC-3643, ONCHAINID, or equivalent).
- Compliance module (sanctions, jurisdiction, limits, freeze list).
- Mint operator contract (idempotent on `fiatReference`, role-gated).
- Redemption contract (burn + payout-intent event).
- Pause / circuit-breaker contract.
- Upgradeability (UUPS or Transparent Proxy) with timelock + pause guardian.
- Governance contract for role management (multi-sig + timelock).

Contract requirements:

- Idempotent mint keyed on bank-side reference (e.g., camt.054 end-to-end ID).
- Force-transfer + clawback callable only by compliance role under documented procedure.
- Every state-changing call emits an indexed event.
- No `selfdestruct`. No unbounded loops in user-callable functions.
- All external calls follow checks-effects-interactions; reentrancy guards where required.
- Static analysis clean (Slither, Mythril). Multi-firm audits. Formal verification for invariants (supply == liability, role-restricted entry points).

## 3. On-chain identity / allowlist

- Every wallet bound to a customer record (CIF/CRM) via on-chain identity contract.
- Attestations for KYC tier, jurisdiction, sanctions clear, accreditation (where relevant).
- Re-attestation on schedule; expiry must block transfers.
- Revocation propagates atomically to all gating logic.

## 4. Wallet and key custody

- Bank operator keys: HSM-backed (FIPS 140-2/3 Level 3+), MPC-augmented, multi-sig with role separation (mint, burn, freeze, upgrade, pause are *separate* roles with separate quorums).
- Customer wallets: bank-custodied (institutional MPC custody) or self-custodied with attestation. Self-custody requires explicit recovery / freeze cooperation in T&Cs.
- Key ceremonies documented, witnessed, video-recorded; quorum members geographically and organisationally separated.
- Key rotation policy: scheduled rotation + emergency rotation playbook.

## 5. Tokenization engine (off-chain)

- Bidirectional bridge between core banking and the chain.
- Owns the invariant: on-chain supply == sub-ledger liability, continuously.
- Idempotent processing; exactly-once semantics for mint/burn.
- Replays safely on outage; durable queue with end-to-end correlation IDs.
- Observability: metrics, traces, structured logs; alerting on drift, on stuck mints, on event-handler lag.

## 6. Reconciliation

- Continuous (sub-minute) reconciliation between on-chain `totalSupply()` (per holder + aggregate) and the deposit sub-ledger.
- Daily reconciliation against the GL with sign-off.
- Drift > 0 in either direction triggers automatic global pause and incident response.
- Reconciliation feed is itself audited and immutable.

## 7. Observability and monitoring

- On-chain monitoring: every event ingested; anomalies (large transfers, freeze events, paused state, role changes) alert in real time.
- Off-chain monitoring: APM on tokenization engine, payments rail integrations, identity service.
- SIEM correlation between on-chain and off-chain events.
- Synthetic transactions (mint-and-burn canary) on schedule.

## 8. Resilience and DR

- Multi-AZ / multi-region deployment for all off-chain components.
- Validator diversity (geographic, organisational) on permissioned chain.
- Documented RTO/RPO; tested DR drills at least annually.
- Key-recovery procedure (Shamir / MPC re-share) tested.
- Chain-fork / consensus-failure runbook.

## 9. Performance, capacity, scalability

- Capacity model with peak transactions/sec, gas/fee budget, storage growth projection.
- Load tests at 3–5x projected peak.
- Mempool / transaction-pool monitoring; gas-price strategy for public-chain deployments.

## 10. Standards alignment

- ERC-20 base interface.
- ERC-3643 (T-REX) for identity-gated transfers (default).
- ERC-1400 / ERC-1404 patterns where security-token semantics overlap.
- ERC-7281 (xERC20) where bridged representations are required.
- Payment-message alignment with ISO 20022 (camt.054, pacs.008) for fiat-side reconciliation.
- Travel Rule data: IVMS 101 schema attached to off-chain transfer message.

## 11. Test and QA

- Unit tests with high coverage on contract code.
- Property-based / invariant tests (Foundry / Echidna).
- End-to-end integration tests across core banking, tokenization engine, chain, payments.
- Chaos / fault-injection tests (validator failure, bridge oracle failure, RPC outage).
- Pre-prod environment mirroring prod topology.

## Cross-links

[`../README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`10-security-cyber.md`](./10-security-cyber.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`../../standards/erc-3643-trex.md`](../../standards/erc-3643-trex.md) · [`../../standards/erc-20.md`](../../standards/erc-20.md) · [`../../architecture/tokenization-platform-pattern.md`](../../architecture/tokenization-platform-pattern.md)
