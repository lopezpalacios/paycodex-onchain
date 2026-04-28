# 07 — Core banking and payments integration

The reverse-waterfall and waterfall logic is the integration hinge. The bank must move funds between DDA and CBDC wallet in real time, idempotently, with a clean audit trail and within scheme-mandated SLAs.

## 1. Sub-ledger and GL

- CBDC balances are *not* on the bank's balance sheet (CB liability).
- Bank-side sub-ledger tracks: customer wallet bindings, funding flows (DDA → CBDC), defunding flows (CBDC → DDA), fee accruals, customer-service activity.
- Daily reconciliation against scheme reports and DDA movements.

## 2. Reverse waterfall

- Trigger: customer attempts a payment exceeding the CBDC wallet balance.
- Logic: bank automatically debits DDA, credits CBDC wallet, then completes the payment.
- Idempotent on payment correlation ID; failure handling preserves payment intent.
- Latency target: imperceptible to customer (sub-second).

## 3. Waterfall

- Trigger: incoming payment would exceed the CBDC holding cap.
- Logic: bank credits CBDC wallet up to cap, automatically defunds excess to DDA.
- Same idempotency and latency targets.

## 4. Funding rails

- Internal book transfer between DDA and CBDC scheme account at the CB.
- Real-time gross or near-real-time depending on scheme.
- Scheme-defined messages (likely ISO 20022).

## 5. Payments rails interoperability

- CBDC payments may interoperate with SEPA SCT Inst, FedNow, Faster Payments, etc., for refunds and merchant settlement.
- Scheme rules govern interoperability; distributor implements per spec.

## 6. Reference data

- Customer ID ↔ DDA ↔ CBDC wallet ID ↔ scheme-side identifier.
- Payment correlation: scheme reference ↔ DDA reference ↔ orchestrator correlation ID.
- Merchant identifiers per scheme.

## 7. Reconciliation

- Continuous reconciliation between distributor sub-ledger and scheme reports.
- Daily reconciliation against DDA flows.
- Drift triggers Sev 1 incident.

## 8. Reporting feeds

- Real-time risk and ops dashboards.
- Daily liquidity report including funding-pull projections.
- AML / fraud feeds.
- Regulatory reporting feeds.

## 9. Treasury management

- Inclusion of CBDC funding flows in intraday liquidity monitoring.
- Funding-cost transfer pricing adjusted for migrated balances.
- LCR / NSFR treatment.

## 10. APIs and connectivity

- Customer-facing APIs (where the bank exposes CBDC functionality to corporate / merchant clients).
- Internal APIs between mobile app, orchestrator, DDA, scheme.
- mTLS / OAuth 2.0 / signed payloads.
- Webhooks for scheme-driven events.

## 11. Migration / coexistence

- During pilot: CBDC available to opt-in customers; clear communications.
- Phased rollout: closed pilot → gradual roll-out → universal availability.
- Decommissioning plan if a scheme ends.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`04-operational.md`](./04-operational.md) · [`09-data-reporting.md`](./09-data-reporting.md)
