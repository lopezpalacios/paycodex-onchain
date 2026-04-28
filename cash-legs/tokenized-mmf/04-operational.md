# 04 — Operational requirements

Tokenized MMFs operate in a hybrid model: NAV cycles and fund admin operate on regulated cadence; subscription / redemption can be 24/7 against on-chain cash legs. The operating model must bridge both rhythms.

## 1. Operating model

- Defined product owner.
- Named roles for: NAV publication, subscription / redemption approval, freeze / force-transfer execution, incident commander.
- 24/7 ops for subscription / redemption windows where the product offers them; standard hours for fund-admin and NAV functions.
- Documented RACI across business, fund admin, custodian, tech, compliance, risk, finance.

## 2. SLOs

- Subscription latency post-cash-leg confirmation.
- Redemption latency to cash-leg payout.
- NAV publication SLO (e.g., 16:00 NY for US MMFs; daily on schedule).
- Reconciliation lag.
- Incident triage and resolution targets.

## 3. NAV cycles

- Daily NAV strike per MMF regime.
- Intraday NAV publication where the product supports it.
- Stale-NAV detection blocks subscriptions and redemptions until refreshed.
- Year-end / month-end procedures coordinated with fund administrator.

## 4. Change management

- Smart contract upgrades: timelocked, audited, dual sign-off (CTO + CCO + CRO + Legal), staged rollout.
- Off-chain orchestration: secure SDLC, peer review, full pre-prod parity.
- Prospectus changes: regulator notification, investor communications.

## 5. Incident response

- Severity classification (Sev 1: NAV-feed compromise, key compromise, supply-drift, custody breach).
- Playbooks for each Sev 1 scenario.
- Pre-authorised pause / freeze paths.
- Regulator notification timelines per regime.
- Investor communications: pre-drafted templates.

## 6. BCP / DR

- BCP for chain outage, custodian outage, NAV-feed outage, fund-admin outage.
- DR drills annually.
- Failover for connectivity to chain, fund admin, custodian.

## 7. Capacity and demand

- Peak-day modelling (month-end, market events, stress windows).
- Headroom alerts.

## 8. Vendor management

- Inventory: fund administrator, custodian, transfer agent, tokenization provider, identity provider, sanctions feeds, chain analytics, audit firms.
- Risk assessment per vendor; criticality classification.
- Exit plans for critical vendors.

## 9. Investor support

- Tier-1 trained on subscription / redemption mechanics, NAV publication, lost-key handling, transfer rejections.
- Compliance-aware messaging on rejections.
- Escalation to L2 with regulator-aware framing.

## 10. Documentation

- Runbooks for subscription, redemption, NAV publication, transfer-restriction updates, contract upgrade.
- Versioned alongside the platform.

## Cross-links

[`./README.md`](./README.md) · [`07-custody-and-fund-admin.md`](./07-custody-and-fund-admin.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
