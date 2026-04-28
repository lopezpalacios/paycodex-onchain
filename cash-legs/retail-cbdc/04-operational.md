# 04 — Operational requirements

Retail CBDC is high-volume, retail-grade, and customer-facing. The bank's ops surface includes 24/7 customer service, scheme-coordination, and fraud / dispute volumes typical of card and instant-payment schemes.

## 1. Operating model

- Defined product owner with P&L / cost ownership.
- Named roles for: scheme integration, fraud / dispute ops, customer service, incident commander.
- 24/7 staffing for critical functions; follow-the-sun where customer base is global.
- Documented RACI across business, tech, compliance, risk, customer ops, finance.

## 2. SLOs

- Wallet provisioning latency.
- Funding / defunding latency.
- Payment p95 latency target (CBDC schemes target sub-second).
- Customer-support response and resolution targets.
- Sanctions list freshness.
- Reconciliation lag.

## 3. Customer service

- Tier-1 trained on wallet provisioning, lost-device handling, payment status, refund procedures.
- Compliance-aware messaging on rejections and frozen wallets.
- Accessibility: language coverage, vulnerable-customer accommodations.
- Self-service flows (lost-device, transaction history, complaints).

## 4. Fraud and dispute ops

- 24/7 fraud monitoring.
- Account-takeover playbook.
- Refund coordination with merchants and counterparties (no chargeback semantics by default).
- FIU / supervisor notification for suspected fraud.

## 5. Change management

- Scheme-driven changes: receive scheme upgrade notices; certify in pre-prod; coordinate customer communications; phase-in.
- Internal change management for distributor-side features (new merchant integrations, new wallet UX).
- Pre-prod parity with scheme test environment.

## 6. Incident response

- Severity classification (Sev 1: scheme outage, mass account-takeover, distributor-side wallet outage).
- Standing playbooks; pre-authorised pause paths.
- Scheme-coordination protocols (incident communication channels with CB / scheme operator).
- Customer communications: pre-drafted templates, named spokespersons.
- Regulator notification timelines per DORA / equivalent.

## 7. BCP / DR

- BCP for scheme outage, distributor-side outage, payments-rail outage, customer-service outage.
- DR drills annually.
- Failover for connectivity to scheme.
- Read-only mode during scheme outages.

## 8. Capacity and demand

- Peak-day modelling: payday, holidays, government-disbursement events.
- Headroom alerts.
- Cost model for scheme participation, fraud prevention, customer service.

## 9. Vendor management

- Inventory: scheme operator, identity provider, sanctions feeds, fraud platforms, mobile-app vendors, cloud providers.
- DORA register-of-information.
- Exit plans for critical vendors.

## 10. Documentation

- Runbooks for provisioning, funding, defunding, lost-device, freeze, scheme-outage, fraud incident.
- Versioned alongside the scheme.

## Cross-links

[`./README.md`](./README.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
