# 04 — Operational requirements

Run-the-bank operations for a tokenized deposit programme. The chain is 24/7; the bank's operating model must follow.

## 1. Operating model

- Defined product owner with P&L / cost ownership.
- Dedicated operations team with named roles for: mint/burn approvals, freeze/forced-transfer execution, reconciliation, incident response, customer support escalation.
- 24/7 staffing or follow-the-sun rotation matched to chain availability and customer geographies.
- Documented RACI across business, technology, compliance, risk, finance, treasury.

## 2. Service-level objectives

- Mint/burn p95 latency target.
- Allowlist enrolment turnaround target.
- Sanctions screening cache freshness SLO.
- Reconciliation lag SLO (on-chain vs sub-ledger).
- Incident response triage / resolution targets aligned to severity.
- Customer-facing SLAs documented in T&Cs.

## 3. Change management

- Smart contract upgrades: timelocked, multi-firm audited, dual sign-off (CTO + CRO + CCO + Legal), staged rollout.
- Rollback plan documented and rehearsed.
- Configuration changes (parameters, thresholds, allowlist policies): four-eyes approval, audit-logged.
- Off-chain orchestration changes: standard SDLC with security review.
- Pre-prod environment that mirrors prod topology, including identity, payments, and chain components.

## 4. Incident response

- Severity classification (Sev 1: supply-drift, key compromise, mint exploit; Sev 2: degraded RPC, identity service down; Sev 3: cosmetic).
- Standing IR playbooks for each Sev 1 scenario:
  - On-chain pause + off-chain customer-facing notification.
  - Coordination with external auditors / chain analytics / law enforcement.
  - Communication with supervisor (target: same-day notification for material incidents; faster where required by DORA / local rules).
- Tabletop exercises at least annually; post-mortems published internally.

## 5. Business continuity / DR

- BCP covering: chain validator outage, RPC outage, identity service outage, payments rail outage, key custody outage, primary data centre outage.
- Documented RTO/RPO; tested at least annually with results signed off by Risk and Audit.
- Validator diversity (geographic + organisational) on permissioned chains.
- Hot/warm secondary for tokenization engine and identity service.

## 6. Capacity and demand management

- Capacity model with peak-day profile (e.g., quarter-end, payroll spikes).
- Headroom alerting at 70% / 85% / 95% utilization.
- Cost model for chain fees / validator hosting; quarterly review.

## 7. Vendor and third-party management

- Inventory of third parties: chain operator (if outsourced), key custody, identity provider, sanctions feeds, chain analytics, audit firms, RPC providers, oracle providers.
- Risk assessment per vendor; criticality classification.
- DORA register-of-information equivalent maintained.
- Exit plans for critical vendors; portability tested.

## 8. Customer support

- Tier-1 support trained on tokenized-deposit specifics: wallet attestation, lost key handling, redemption status, transfer rejections (and reason codes that *can* be shared without leaking compliance signal).
- Escalation path for compliance-related rejections to L2 with regulator-aware messaging.

## 9. Documentation

- Runbooks for every standard ops task (mint, burn, freeze, attestation enrolment, list refresh, payment-rail reconciliation, contract upgrade).
- Playbooks for every incident type.
- Knowledge base versioned alongside the platform.

## 10. Hours and calendar

- Chain operates 24/7/365.
- Bank-side payment rails (SEPA, Fedwire, SIC, SWIFT) have closed windows. Document expected behaviour during off-hours: queue and settle when rail opens, vs reject, vs pre-fund and net.
- Holiday calendar surfaced to customers via API and UI.

## Cross-links

[`./README.md`](./README.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
