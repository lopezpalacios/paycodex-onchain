# 06 — Risk management and capital

Retail CBDC has limited direct balance-sheet impact (CBDC sits in customer wallets, not on the bank's books), but the bank's risk surface includes deposit migration, intraday liquidity, operational, fraud, and reputational risks at scale.

## 1. Capital treatment

- CBDC balances belong to customers, not the bank — no direct balance-sheet impact.
- DDA balances may migrate into CBDC wallets up to the holding cap → indirect funding-cost and liquidity impact.
- Operational and cyber risk capital reflects the new channel.
- ICAAP captures the CBDC distribution posture.

## 2. Liquidity treatment

- LCR: factor potential outflows from DDA into CBDC wallets during stress.
- NSFR: CBDC is not a stable funding source for the bank (it is a CB liability, not a deposit).
- Intraday liquidity sizing must account for funding-pull events (mass top-ups during high-payment periods).

## 3. Deposit-migration analysis

- Model expected steady-state CBDC adoption per customer segment.
- Cap-aware modelling: most retail customers fully utilise the cap; corporate exposure varies.
- Sensitivity analysis to cap changes (regulatory parameter).
- Stress: mass migration during banking-stress events ("digital bank run" risk).

## 4. Risk taxonomy

- **Operational** — scheme integration, wallet provisioning failures, EOD reconciliation drift.
- **Cyber** — wallet compromise, mobile-app exploits, account-takeover, scheme-side breaches.
- **Fraud** — account-takeover, social engineering, mule networks.
- **Compliance** — Travel Rule, sanctions, Tiered-privacy enforcement.
- **Liquidity** — funding-pull stress events.
- **Reputational** — high-visibility scheme; public expectations.
- **Conduct** — vulnerable customers, accessibility, mis-selling.
- **Concentration** — heavy reliance on the scheme operator and key vendors.

## 5. Risk appetite

- KRIs:
  - Account-takeover incidents per million users.
  - Funding-pull stress drill outcomes.
  - Reconciliation drift (target 0).
  - Customer-complaint volumes.
  - SAR / fraud filing volumes.
  - Distributor-side outage minutes.

## 6. Stress testing

- Mass adoption shock (rapid take-up, funding migration).
- Scheme outage scenarios.
- Mass account-takeover.
- Payment storm (mass disbursement events).
- Sanctions feed outage during high-volume window.

## 7. Recovery and resolution

- Inclusion in RRP: continuity of CBDC distribution during stress; portability to alternate distributors during resolution.
- Resolution authority's mapping of distributor obligations.

## 8. Insurance

- Cyber insurance with explicit DLT / digital-payments scope.
- Crime insurance for fraud losses.
- D&O cover.

## 9. Risk reporting

- Daily KRI dashboard.
- Monthly risk pack to risk committee.
- Quarterly to board.
- Sev 1 ad-hoc reporting.

## 10. Model risk

- Deposit-migration model.
- Funding-pull model.
- Fraud detection models.
- Annual revalidation; benchmark against peer disclosures and external data.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md)
