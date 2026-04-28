# 01 — Technical requirements

The DLT is operated by the central bank or its designated FMI. The bank's technical scope is *participation*: nodes (where applicable), wallets, key custody, integration with internal systems, smart contracts (CB-approved templates only).

## 1. Node and access

- Most wholesale CBDC platforms run on a permissioned DLT operated by the central bank / FMI. Some require participants to operate their own nodes; others provide hosted access via API + signed tx submission.
- Where node operation is required: hardware, hosting, and network requirements per the FMI's specs (typically Hyperledger Besu, Quorum, Corda, Canton, or proprietary).
- Where access is API-based: secure connectivity (mTLS / IPsec), redundant providers, latency targets.

## 2. Wallets and custody

- Bank-controlled wallets on the DLT bound to the bank's participant identity.
- HSM-backed (FIPS 140-2/3 Level 3+) keys; MPC-augmented multi-sig with role separation.
- Quorum participants geographically and organisationally separated.
- Hardware-rooted approvals at signer endpoints.
- Documented, witnessed key ceremonies; tamper-evident archive.

## 3. Smart contract templates

- Wholesale CBDC platforms typically restrict deployable contracts to a CB-approved catalogue (DvP, PvP, conditional payment templates).
- Custom contracts require CB approval and security review.
- Standard interfaces for token transfer, atomic swap with tokenized securities, conditional release.

## 4. Integration with internal systems

- Bridge between treasury / liquidity-management systems and the DLT.
- Real-time visibility of wCBDC balances in the bank's intraday liquidity dashboards.
- Idempotent processing of subscription, redemption, and settlement events.
- Correlation IDs end-to-end (RTGS reference ↔ on-chain transaction ↔ internal ledger entry).

## 5. Settlement engine integration

- DvP cash-leg integration with tokenized-securities settlement (e.g., SDX).
- Atomic-swap orchestration: lock cash leg, release on securities leg confirmation.
- PvP for cross-currency wholesale settlement.

## 6. Reconciliation

- Continuous reconciliation between on-chain wCBDC balances and the bank's internal sub-ledger.
- Daily reconciliation against CB / FMI statements.
- Drift triggers Sev 1 incident.

## 7. Observability

- On-chain monitoring of every event involving the bank's wallets.
- APM on internal integration components.
- SIEM correlation with RTGS and treasury systems.

## 8. Resilience

- Multi-AZ / multi-region for off-chain integration components.
- Documented RTO / RPO; tested DR drills.
- Failover for connectivity to the DLT.

## 9. Standards

- ISO 20022 (pacs.008, pacs.009, camt.054) for fiat-side messaging.
- BIS / IMF reporting taxonomies where applicable.
- DLT-platform native standards (chain-specific).

## 10. Test and QA

- End-to-end tests in CB-provided test environment.
- Mandatory CB-led integration testing prior to go-live.
- Tabletop exercises with CB and other participants.

## Cross-links

[`./README.md`](./README.md) · [`07-rtgs-and-fmi-integration.md`](./07-rtgs-and-fmi-integration.md) · [`10-security-cyber.md`](./10-security-cyber.md)
