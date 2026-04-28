# 04 — Operational requirements

Wholesale CBDC settlement is high-value, low-volume, and finality-critical. The bank's operating model must match the DLT's hours and the FMI's settlement cycles.

## 1. Operating model

- Defined product / service owner for wCBDC participation.
- Named roles for: subscription / redemption approval, settlement instruction, key-ceremony quorum, incident commander.
- Documented RACI across treasury, payments ops, tech, risk, compliance, finance.
- Coverage during DLT operating hours (typically 24/7 on the DLT side, even when RTGS is closed).

## 2. SLOs

- Subscription latency from RTGS debit to wallet credit.
- Redemption latency from on-chain burn to RTGS credit.
- Settlement instruction p95 latency.
- Reconciliation lag.
- Incident triage and resolution targets by severity.

## 3. End-of-day cycles

- DLT cycles align with FMI operational windows for accounting, reporting, and CB monetary-policy ops.
- Bank's EOD batch coordinates wCBDC balances into GL and risk reporting.
- Cut-off times, holiday calendars, and inter-platform synchronisation documented.

## 4. Change management

- Smart contract / template upgrades are CB-controlled; bank has notification + testing window.
- Internal integration changes follow bank's standard SDLC with elevated controls (FMI-grade change governance).
- Pre-prod parity with FMI's test environment.

## 5. Incident response

- Severity classification (Sev 1: settlement failure, key compromise, DLT halt, reconciliation drift).
- Playbooks for each Sev 1 scenario.
- CB / FMI coordination during incidents.
- Regulator notification timelines.

## 6. BCP / DR

- BCP for: DLT outage, RTGS outage during DLT operating hours, internal integration outage, key custody outage.
- DR drills annually with CB / FMI participation where feasible.
- Failover for connectivity to the DLT.

## 7. Capacity and demand

- Peak-day modelling (settlement-heavy events: bond issuances, corporate actions, quarter-end).
- Headroom alerts on infra and on intraday liquidity.

## 8. Vendor management

- DLT operator (CB/FMI) treated as critical vendor.
- HSM / MPC custody vendor.
- Connectivity providers (network, mTLS endpoints).
- DORA-aligned register-of-information.

## 9. Counterparty support

- Coordination channel with other participating banks (bilateral and via FMI).
- Incident communications between participants.

## 10. Documentation

- Runbooks for subscription, redemption, settlement instruction, force settlement (if available), incident response.
- Versioned alongside the FMI's documentation.

## Cross-links

[`./README.md`](./README.md) · [`07-rtgs-and-fmi-integration.md`](./07-rtgs-and-fmi-integration.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
