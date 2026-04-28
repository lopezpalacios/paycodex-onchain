# 06 — Risk management and capital

Tokenized MMF risk is dominated by underlying-asset and liquidity risks (the standard MMF risk pack), augmented by DLT-specific operational and cyber risks.

## 1. Capital / prudential

- MMF regime requirements: minimum daily / weekly liquid asset percentages; WAM / WAL caps; diversification.
- Sponsor capital requirements per asset-management regime (AIFM own funds, RIA capital, etc.).
- Operational and cyber risk budget for new technology.

## 2. Underlying-asset risk

- Interest-rate risk: WAM controls; daily duration.
- Credit risk: eligible-asset list; issuer and counterparty limits.
- Repo counterparty risk; collateral haircuts.
- Sovereign risk for non-government MMFs.

## 3. Liquidity management

- Daily / weekly liquid asset floors per regime.
- Redemption demand modelling adapted for tokenized 24/7 access.
- Stress scenarios: 1-day, 1-week mass redemption.
- Gates / fees / suspensions per regime; tokenized form does not override.
- Bridge between on-chain redemption and off-chain asset liquidation cycles.

## 4. Risk taxonomy

- **Underlying** — interest-rate, credit, repo-counterparty.
- **Liquidity** — redemption demand, asset liquidation lag.
- **Operational** — NAV-feed failure, fund-admin outage, transfer-agent error, reconciliation drift.
- **Cyber** — smart contract exploit, key compromise, NAV-oracle compromise.
- **Compliance** — Travel Rule, sanctions, transfer-restriction failure.
- **Custody** — qualified custodian failure.
- **Reputational** — high-visibility incident.
- **Legal / regulatory** — securities-law treatment uncertainty in cross-border circulation.

## 5. Risk appetite

- KRIs:
  - Reconciliation drift (target 0).
  - NAV-oracle SLO breaches.
  - Stale-NAV detection events.
  - Sanctions screening false-negative rate.
  - Smart contract incidents (target 0).
  - Liquidity-floor utilisation.

## 6. Stress testing

- Reverse stress: redemption pace at which liquidity floors fail.
- Concentration: largest single redemption.
- Tech: chain halt; NAV-feed compromise; custody outage.
- Compliance: sanctions feed outage.
- Underlying: T-bill auction failure; repo counterparty default.

## 7. Recovery and resolution

- Fund-vehicle wind-down per its constitutional documents and regime.
- Investor protections via segregated custody and bankruptcy-remote vehicle.

## 8. Insurance

- Crime / specie covering custody and key compromise.
- Cyber insurance with explicit DLT scope.
- D&O cover.

## 9. Risk reporting

- Daily KRI dashboard.
- Monthly risk pack to risk committee.
- Quarterly to fund board.
- Sev 1 ad-hoc.

## 10. Model risk

- Redemption demand model.
- NAV calculation.
- Stress-test models.
- Annual revalidation.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`07-custody-and-fund-admin.md`](./07-custody-and-fund-admin.md) · [`08-governance-controls.md`](./08-governance-controls.md)
