# 04 — Operational requirements

Stablecoin operations are 24/7/365 by design. Public-chain rhythm + global redeemer base + cross-time-zone reserve banking together mean the issuer's operating model must be follow-the-sun and incident-ready every hour of every day.

## 1. Operating model

- Defined product owner with P&L / cost ownership.
- 24/7 ops with named roles for: issuance approval, redemption approval, reserve management, blacklist execution, incident commander.
- Documented RACI across business, tech, compliance, risk, finance, legal.
- Time-zone-distributed staffing for screening, support, and incident response.

## 2. SLOs

- Mint p95 latency post-fiat-receipt confirmation.
- Burn / fiat-payout p95 latency post-burn.
- Direct redeemer onboarding turnaround.
- Sanctions list cache freshness.
- Reconciliation lag (reserves vs supply).
- Incident triage and resolution targets by severity.

## 3. Change management

- Smart contract upgrades: timelocked, audited, dual sign-off (CTO + CRO + CCO + Legal), staged rollout.
- Bridge changes: heightened scrutiny; staged with low-cap pilot.
- Off-chain orchestration: secure SDLC, peer review, full pre-prod parity.
- Reserve composition changes: governance approval, regulator notification where required.

## 4. Incident response

- Severity classification (Sev 1: supply-drift, key compromise, mint exploit, reserve shortfall, banking-rail outage during stress).
- Standing playbooks for each Sev 1 scenario.
- Pre-authorised pause and blacklist invocation paths.
- Regulator notification timelines (DORA / OCC / NYDFS / MAS / HKMA / FINMA equivalents).
- Customer / market communications: pre-drafted templates, named spokespersons.
- Post-incident: forensic preservation, lessons-learned, control redesign.

## 5. BCP / DR

- BCP covering: chain outage, RPC outage, reserve banking outage, bridge outage, primary data centre outage, custodian outage.
- DR drills annually with documented results.
- Validator / RPC diversity tested.
- Redundant reserve banking relationships.

## 6. Capacity and demand

- Peak-day modelling (month-end, quarter-end, market events, regulatory deadlines).
- Headroom alerts; cost model for chain fees and infra; quarterly review.

## 7. Vendor management

- Inventory: chain RPC providers, custodian banks, reserve managers, identity providers, sanctions feeds, chain analytics, audit firms, attestors, Travel Rule providers.
- Risk assessment per vendor; criticality classification.
- Exit plans and portability for critical vendors.
- DORA register-of-information equivalent.

## 8. Customer support

- Tier-1 trained on issuance, redemption, blacklist, lost-key handling.
- Compliance-aware messaging on rejections.
- Escalation to L2 with regulator-aware framing.

## 9. Documentation

- Runbooks for every standard task (mint, burn, blacklist push, reserve rebalancing, contract upgrade, key rotation).
- Playbooks for every incident type.
- Versioned alongside the platform.

## 10. Calendars

- Chain operates 24/7. Fiat rails (SEPA, Fedwire, SWIFT, CHAPS, SIC) have closed windows.
- Document expected redemption-payout behaviour off-rail-hours: queue-and-settle vs reject vs internal-bank fast pay.
- Holiday calendar surfaced via API and UI.

## Cross-links

[`./README.md`](./README.md) · [`07-reserves-and-banking.md`](./07-reserves-and-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
