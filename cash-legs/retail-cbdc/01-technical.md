# 01 — Technical requirements

The CBDC scheme infrastructure is operated by the central bank or its delegated operator. The distributor's technical scope is the customer-facing wallet, the integration with the scheme, the reverse-waterfall logic, and the supporting compliance and ops surface.

## 1. Scheme integration

- Connectivity to the scheme operator via mTLS / IPsec / dedicated network as the scheme requires.
- SDK / API integration per the scheme's published specs (e.g., digital euro RfA / RfP scope; e-CNY two-tier interface).
- Scheme certification for the distributor's integration before live participation.

## 2. Wallet provisioning

- CBDC wallet integrated into the bank's existing online and mobile banking apps (typically required by scheme to avoid fragmentation).
- Onboarding flow: identity binding, terms acceptance, initial funding option.
- Multi-device support, device binding, device replacement / recovery.

## 3. Funding and defunding

- Real-time DDA-to-CBDC and CBDC-to-DDA flows.
- Reverse-waterfall: when payment exceeds CBDC wallet balance, automatic top-up from DDA up to the cap.
- Waterfall: when CBDC balance exceeds the cap (e.g., from incoming payments), automatic offload to DDA.
- Idempotent processing; correlation IDs end-to-end.

## 4. Payment flows

- P2P: scan / NFC / handle-based; instant finality.
- P2B: merchant acceptance via QR / NFC / online; settlement instant or batched per scheme.
- B2B and government disbursements per scheme rulebook.
- Refund / reversal handling consistent with scheme.

## 5. Offline payments (where supported)

- Secure element on customer device or dedicated hardware token.
- Offline-balance limits and reconciliation rules.
- Sync-on-reconnect; double-spend prevention via cryptographic constraints.

## 6. AML / fraud / disputes integration

- TM rules adapted for CBDC payment patterns.
- Sanctions screening on counterparties.
- Dispute and chargeback handling per scheme rulebook (CBDC schemes typically *do not* support classic chargeback semantics; refunds are explicit).
- Fraud detection integrated with bank's enterprise fraud platform.

## 7. Customer support tooling

- Service-rep tools to view wallet status, payment history, attestation status.
- Lost-device flow with attestation re-issuance.
- Frozen-wallet handling with regulator-aware messaging.

## 8. Observability

- Real-time monitoring of scheme connectivity, funding pipeline latency, wallet activations, support tickets, fraud signals.
- SIEM correlation across CBDC events, DDA events, fraud events.

## 9. Resilience

- Multi-AZ / multi-region for off-chain components.
- Documented RTO / RPO; tested DR drills.
- Graceful degradation: read-only wallet during scheme outages; queued funding requests.

## 10. Standards

- Scheme-specific protocols (digital euro target architecture; e-CNY two-tier API).
- ISO 20022 alignment for fiat-side messaging.
- IVMS 101 for Travel Rule where applicable.

## 11. Test and QA

- Pre-prod environment certified with the scheme operator.
- End-to-end tests across DDA, CBDC wallet, scheme.
- Customer-acceptance testing for accessibility and usability.
- Chaos testing for scheme outages, partial failures.

## Cross-links

[`./README.md`](./README.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`10-security-cyber.md`](./10-security-cyber.md)
