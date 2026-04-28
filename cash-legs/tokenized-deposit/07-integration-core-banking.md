# 07 — Core banking and payments integration

The tokenized deposit only works if the on-chain state and the bank's books are continuously and provably consistent. Integration is the heart of the programme.

## 1. Sub-ledger design

- Dedicated sub-ledger ("tokenized deposit sub-ledger") feeding into the GL.
- One-to-one mapping between on-chain holders and sub-ledger sub-accounts.
- Sub-ledger journals: mint (credit token sub-account / debit fiat omnibus), burn (debit token sub-account / credit fiat omnibus), transfer between holders (intra-sub-ledger journal).
- Daily close aligned with the bank's standard close cycle.
- IFRS 9 / US GAAP treatment confirmed with finance and external auditor.

## 2. Mint and burn orchestration

- **Mint trigger** — fiat received in omnibus (camt.054 / pacs.002 confirmation) → orchestrator validates → submits `mintOnDeposit(customer, amount, fiatReference)` → confirms event → updates sub-ledger.
- **Burn trigger** — customer initiates redemption on-chain → `RedeemRequested` event → orchestrator queues fiat payout (SEPA/SIC/Fedwire/SWIFT/Faster Payments) → confirms payout → finalises sub-ledger entry.
- Idempotency on every step keyed on bank-side reference + on-chain transaction hash.
- Replay-safe queue with end-to-end correlation.
- Exactly-once semantics; no double-spend, no double-credit.

## 3. Payments rail integration

- SEPA SCT / SCT Inst (EUR, EU).
- TARGET2 / TIPS for instant settlement / large value (EUR, ECB).
- SIC4 / euroSIC (CHF / EUR, Switzerland).
- Fedwire / FedNow / ACH (USD, US).
- CHAPS / Faster Payments (GBP, UK).
- SWIFT MT/MX for cross-border legacy and gpi.
- Internal book transfers for same-bank corp-to-corp.

## 4. Reference data and identifiers

- Customer identity: CIF/CRM ↔ on-chain identity contract address ↔ wallet address(es).
- Transaction reference: bank-side end-to-end ID (e.g., camt.054 EndToEndId) ↔ on-chain `fiatReference` ↔ orchestrator correlation ID.
- Token reference: contract address ↔ ticker ↔ ISO/ISIN-equivalent (where introduced) ↔ regulator product code.

## 5. Reconciliation

- Continuous (sub-minute) reconciliation: on-chain holder balances vs sub-ledger sub-accounts.
- Daily reconciliation: total token supply vs sub-ledger total liability vs GL.
- Monthly reconciliation: GL vs regulatory reporting.
- Drift in any direction → automatic global pause and Sev 1 incident.

## 6. Reporting feeds

- Real-time risk and ops dashboards.
- Daily exposure and concentration reports to Risk.
- Daily liquidity report incorporating tokenized deposit balances and projected redemptions.
- AML/CFT alert feed to compliance.
- Regulatory reporting feeds (see [09-data-reporting](./09-data-reporting.md)).

## 7. Treasury management

- Inclusion of tokenized deposit balances in intraday liquidity monitoring.
- LCR / NSFR treatment same as underlying deposit category (retail / SME / wholesale; stable / less stable).
- Funding-cost transfer pricing aligned with the underlying deposit category.

## 8. Identity and access management (IAM)

- Bank-staff IAM integrated with the orchestrator (mint operators, freeze operators, ops, auditors).
- Customer authentication for self-service redemption / transfer flows: existing online-banking auth + step-up where appropriate.
- Privileged access management (PAM) for orchestrator and key-custody admin paths.

## 9. APIs

- External APIs (where customers integrate): OpenAPI / Swagger spec, OAuth 2.0 / mTLS auth, rate-limited, versioned.
- Internal APIs: between orchestrator, identity, sanctions, payments — all authenticated, rate-limited, audit-logged.
- Webhooks: signed payloads, idempotency keys, retry-with-backoff.

## 10. Data flows and lineage

- Documented data lineage from on-chain event → orchestrator → sub-ledger → GL → regulatory report.
- Lineage tooling integrated with data governance platform.
- PII flows tagged for GDPR / privacy compliance.

## 11. Migration / coexistence

- During pilot: tokenized and non-tokenized customers coexist; clear segregation of sub-ledger.
- Phased rollout: closed beta → friendly customers → full launch.
- Deprecation plan if the programme is wound down (see [05-legal-contractual](./05-legal-contractual.md)).

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`04-operational.md`](./04-operational.md) · [`09-data-reporting.md`](./09-data-reporting.md) · [`../../integrations/core-banking-tokenization-pattern.md`](../../integrations/core-banking-tokenization-pattern.md)
