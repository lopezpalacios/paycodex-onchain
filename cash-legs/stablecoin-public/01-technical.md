# 01 — Technical requirements

A regulated stablecoin runs on public infrastructure but must satisfy the same control expectations as a payments system. "Public chain" does not mean "uncontrolled".

## 1. Chain selection

- Primary chain: Ethereum L1 typical for institutional issuance (USDC, EURC).
- L2s and alt-L1s: Polygon, Arbitrum, Base, Optimism, Solana, Avalanche, Stellar — mature programmes maintain canonical issuance per chain or use lock-and-mint bridges.
- Selection criteria: liquidity, regulator familiarity, finality model, operational maturity, MEV exposure, censorship resistance.
- Document a per-chain risk assessment.

## 2. Smart contracts

- Token contract (ERC-20) with: `mint`, `burn`, `pause`, `blacklist`, `unblacklist`, `forceTransfer` (regulator/court order).
- Upgradeability: proxy pattern with timelock + multi-sig governance, or non-upgradeable with documented migration path.
- Roles separated: minter, burner, blacklister, pauser, upgrader — each with its own multi-sig quorum.
- Events for every privileged action, indexed for off-chain consumption.
- Bridge contracts (if cross-chain): canonical-issuance pattern preferred over wrapped synthetics; lock-and-mint with attestation if used.
- Audits: multiple independent firms, pre-launch and at every material change.
- Static analysis (Slither, Mythril, Semgrep), invariant tests (Foundry, Echidna), formal verification of critical invariants (no unauthorised mint, supply equals reserves at attestation moments).

## 3. Key management

- HSM-backed (FIPS 140-2/3 Level 3+) operator keys.
- MPC-augmented multi-sig with role separation.
- Quorum participants geographically and organisationally separated.
- Hardware-rooted approval at signer endpoints.
- Documented, witnessed key ceremonies; tamper-evident archive of artefacts.
- Scheduled rotation + emergency rotation playbook.

## 4. Issuance / redemption orchestrator

- Bidirectional bridge between fiat reserve banks and on-chain contract.
- Idempotent on bank-side reference (e.g., camt.054 EndToEndId) and on-chain transaction hash.
- Exactly-once mint per fiat receipt; exactly-once burn per redemption.
- Replay-safe queue; durable storage; correlation IDs end-to-end.

## 5. Reserve attestation pipeline

- Daily extraction of reserve balances from custodian banks and reserve managers.
- Reconciliation against on-chain `totalSupply()` per chain and aggregate.
- Drift detection: any non-zero drift triggers Sev 1 incident.
- Monthly attestation pack delivered to attestor (Big-4 or equivalent).

## 6. Compliance and screening systems

- Sanctions screening on direct redeemers and on counterparty addresses (chain analytics integrations: Chainalysis, Elliptic, TRM, Crystal).
- Blacklist propagation: list updates pushed to on-chain blacklist within target SLO.
- Travel Rule integration with VASP partners (TRP, Sumsub, Notabene, Veriscope).
- Real-time alert integration with TM platform.

## 7. Public-chain operational hygiene

- Multiple independent RPC providers; cross-validation of state.
- MEV-aware transaction submission for privileged actions (private mempool / Flashbots Protect equivalents).
- Gas-price strategy and budget for normal and stressed conditions.
- Mempool / pending-tx monitoring.

## 8. Observability

- On-chain monitoring: every event ingested and alerted on (mints, burns, blacklist changes, pauses, role changes, large transfers).
- Off-chain APM on orchestrator, reserve pipeline, screening systems.
- SIEM correlation across on-chain and off-chain events.
- Synthetic mint-and-burn canary on schedule.

## 9. Resilience

- Multi-AZ / multi-region for off-chain components.
- Documented RTO/RPO and tested DR drills.
- Chain-fork / consensus-failure runbook (especially for L2s with sequencer dependencies).
- Bridge-failure runbook.

## 10. Standards

- ERC-20 base.
- ERC-3009 (transferWithAuthorization) typical for gasless user flows.
- ERC-2612 (permit) optional.
- ERC-7281 (xERC20) for cross-chain canonical issuance where applicable.
- IVMS 101 for Travel Rule payloads.
- ISO 20022 alignment for fiat-side messaging.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`07-reserves-and-banking.md`](./07-reserves-and-banking.md) · [`10-security-cyber.md`](./10-security-cyber.md)
