# 06 — Risk management and capital

A regulated stablecoin issuer faces capital, liquidity, market, operational, and reputational risk in distinctive proportions. Reserves dominate the balance sheet. Operational and cyber risks dominate the loss tail.

## 1. Own-funds / capital

- MiCA: own-funds floor at the higher of EUR 350K (EMI) or 2% of average outstanding token volume; supervisor may impose more.
- US trust / state regimes: capital per state; New York DFS imposes specific minimums.
- MAS, HKMA, FINMA: capital requirements per regime.
- Additional ICAAP-equivalent capital for operational, cyber, and reputational risk.

## 2. Reserve composition rules

- 1:1 reserves segregated, bankruptcy-remote.
- HQLA-only: cash at central banks (where allowed), short-dated government securities, repos against HQLA.
- Concentration limits per counterparty bank and per asset class.
- Daily reconciliation; monthly attestation; annual audit.
- Currency match: EUR-stable backed in EUR, USD-stable backed in USD.

## 3. Liquidity management

- Redemption demand modelling: 24/7, accelerated by digital channels and market events.
- Stress scenarios: 1-hour, 4-hour, 24-hour, multi-day redemption shocks.
- Run-risk modelling specific to information cascades on social media / news.
- Reserve laddering to ensure sufficient overnight liquidity.
- Banking-rail dependency: redundancy across reserve banks.

## 4. Risk taxonomy

- Reserve credit / market risk (reserve banks, government bond duration if any).
- De-peg risk (reserve composition, banking-rail outage).
- Operational risk (smart contract, key compromise, orchestrator failure, banking-rail integration).
- Cyber risk (frontend phishing, RPC poisoning, bridge attack, key compromise).
- Compliance risk (sanctions breach, Travel Rule failure, blacklist failure).
- Legal risk (classification uncertainty, cross-border enforceability).
- Reputational risk (high-visibility incident).
- Conduct risk (mis-selling, complaint handling).
- Model risk (redemption demand, sanctions thresholds, TM rules).

## 5. Risk appetite

- Documented risk appetite statement with KRIs and thresholds.
- Examples:
  - Reserve drift (target 0; threshold > 0 = Sev 1).
  - Time-to-detect supply anomaly.
  - Sanctions screening false-negative rate.
  - Banking-rail outage hours per quarter.
  - Smart contract incidents (target 0).
  - Bridge-canonical drift.

## 6. Stress testing

- Reverse stress: at what redemption pace does the issuer fail to honour at par?
- Concentration: largest single-redeemer redemption.
- Tech: chain halt, RPC outage, custodian outage.
- Compliance: sanctions feed outage; how is screening preserved.
- Banking-rail: weekend / holiday redemption demand vs. closed rails.

## 7. Recovery and resolution

- Recovery indicators: redemption velocity, reserve drift, banking-rail anomalies.
- Resolution plan: orderly wind-down with reserve liquidation and par redemption to holders.
- Continuity of redemption: alternative banking, contractual rails.

## 8. Insurance

- Crime / specie / digital-asset custody insurance.
- Smart contract exploit cover (limited capacity).
- Cyber insurance with explicit DLT scope.
- Director and officer cover.

## 9. Risk reporting

- Daily KRI dashboard.
- Monthly risk pack to risk committee.
- Quarterly risk pack to board.
- Sev 1 ad-hoc reporting.

## 10. Model risk

- Redemption demand model.
- Run-risk model.
- Sanctions screening thresholds.
- TM rules.
- Annual revalidation; benchmark against external data.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`07-reserves-and-banking.md`](./07-reserves-and-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`../../compliance/basel-iii-crypto.md`](../../compliance/basel-iii-crypto.md)
