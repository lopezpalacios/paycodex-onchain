# 09 — Data, accounting, regulatory reporting

CBDC balances are not on the bank's balance sheet, but the distribution activity generates significant reporting obligations to the scheme operator, the prudential supervisor, and customers.

## 1. Accounting

- CBDC balances belong to customers (CB liability); not on bank's balance sheet.
- Bank-side recognition limited to: fee accruals, scheme-fee expenses, intermediary balances during in-flight funding flows.
- IFRS 9 / US GAAP treatment for any in-flight balances.
- External auditor signs off the policy pre-launch.

## 2. Scheme reporting

- Periodic returns to the scheme operator: distribution volumes, customer activations, incident summaries.
- Real-time reporting of certain events (mass incidents, suspicious activity).
- Scheme-mandated reconciliation reports.

## 3. Regulatory reporting

### EU
- COREP / FINREP: indirect impact on liquidity reporting via deposit migration.
- ECB statistical reporting (BSI) reflecting deposit changes.
- DORA: register of information; major ICT-related incident reporting.
- AMLR / AMLD reporting per the operative regime.

### UK
- PRA / FCA returns; BoE distributor reporting.

### US
- FFIEC Call Reports: indirect impact on deposits.
- BSA reporting: SARs, CTRs.

### Other jurisdictions
- Per local supervisor and scheme operator.

## 4. Tax

- CRS / FATCA / DAC8 reporting where applicable to CBDC balances or activity.
- Withholding considerations (CBDC typically does not yield interest, so limited).

## 5. Suspicious activity / regulatory disclosures

- SAR/STR per local FIU.
- Sanctions-block notifications.
- Cyber-incident notifications per DORA / FFIEC / NYDFS / SEC / etc.

## 6. Data quality and lineage

- Lineage from scheme event → orchestrator → distributor sub-ledger → GL → regulatory report.
- DQ KPIs.
- Issue management for DQ defects.

## 7. Data governance

- Domain ownership.
- Stewards and custodians.
- Glossary alignment.

## 8. Privacy

- DPIA mandatory for the CBDC channel.
- Tiered-privacy compliance per scheme.
- DSAR / right-to-erasure handled.
- DPAs with all processors.

## 9. Records retention

- Minimum 5 years (or longer where required).
- WORM / cryptographic anchoring.

## 10. Disclosures to customers

- Wallet statements integrated with bank-app statements.
- Incident communications.
- Privacy disclosures per GDPR / equivalent.

## Cross-links

[`./README.md`](./README.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md)
