# 09 — Data, accounting, regulatory reporting

A tokenized MMF reports under the MMF regime plus DLT-regime overlays. NAV, AUM, holdings, and investor activity must flow consistently across the fund-admin and on-chain registers.

## 1. Accounting

- Fund-level financial statements per IFRS / US GAAP / domicile-specific framework.
- NAV computed daily per regime.
- External auditor signs off the policy pre-launch.

## 2. Regulator reporting

### EU
- ESMA reporting under MMFR.
- AIFMD / UCITS Annex IV reporting where applicable.
- DLT-regime reporting (DLT Pilot Regime where used).
- DORA: register of information; major ICT-related incident reporting.

### US
- SEC Form N-MFP under Rule 2a-7.
- Form N-CEN; Form ADV for the manager.
- BSA reporting where the issuer / sponsor is a financial institution.

### UK
- FCA reporting.
- BoE reporting where applicable.

### Singapore
- MAS reporting per CMS / SFA / CISA frameworks.

### Switzerland
- FINMA reporting per CISA.
- SNB statistics where relevant.

### Cayman / BVI / Luxembourg / Ireland
- Local regulator reporting per fund domicile.

## 3. Tax reporting

- CRS / FATCA / DAC8.
- Withholding management.
- Investor-level tax-information returns.

## 4. NAV and AUM disclosures

- Daily NAV publication on-chain and via standard channels.
- AUM disclosure per regime cadence.
- Holdings disclosures (often weekly or monthly).

## 5. Suspicious activity

- SAR/STR per local FIU.
- Sanctions-block notifications.
- Travel Rule message archive.
- Cyber-incident notifications per DORA / SEC cyber rules / etc.

## 6. Data quality and lineage

- Lineage from on-chain event → orchestrator → fund admin → GL → regulatory report.
- DQ KPIs.
- Issue management for DQ defects.

## 7. Data governance

- Domain ownership.
- Stewards and custodians.
- Glossary alignment.

## 8. Privacy

- On-chain personal data avoided.
- Off-chain identity store with encryption and access controls.
- DSAR / right-to-erasure handled.
- DPAs with all processors.

## 9. Records retention

- Minimum 5 years (or longer per jurisdiction).
- WORM / cryptographic anchoring.

## 10. Investor disclosures

- Statements include token balances, NAV, accrued yield.
- Tax-document generation for relevant jurisdictions.
- Incident communications.

## Cross-links

[`./README.md`](./README.md) · [`07-custody-and-fund-admin.md`](./07-custody-and-fund-admin.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md)
