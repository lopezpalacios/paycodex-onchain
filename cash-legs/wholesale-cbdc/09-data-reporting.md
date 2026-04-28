# 09 — Data, accounting, regulatory reporting

Wholesale CBDC balances are central bank money on the bank's balance sheet — accounted for as cash at CB, reported as Level 1 HQLA, and disclosed where applicable to the prudential supervisor.

## 1. Accounting

- wCBDC balances recognised as cash at central bank (asset, Level 1 HQLA).
- IFRS 9 / US GAAP classification: amortised cost cash equivalent.
- Daily reconciliation against on-chain wallet and CB / FMI statements.
- External auditor signs off the policy pre-launch.

## 2. Regulatory reporting

### EU
- COREP / FINREP — wCBDC balances disclosed under the appropriate cash-at-CB category.
- ECB statistical reporting (BSI).
- DORA: register of information; major ICT-related incident reporting.

### UK
- PRA returns; BoE reports per RTGS / FMI participation.

### US
- FFIEC Call Reports — cash at Federal Reserve.
- FR 2052a (liquidity).

### Switzerland
- FINMA reporting; SNB returns.

### Singapore / Hong Kong / others
- MAS / HKMA periodic returns; sandbox-specific reporting.

## 3. FMI participation reporting

- FMI rulebook reporting obligations.
- CPMI-IOSCO PFMI disclosures where the FMI requires participant input.
- Daily / monthly settlement statistics.

## 4. Tax

- wCBDC balances treated as central bank reserves; standard tax treatment.
- Cross-border platform settlement may have FX-regime / tax-information-reporting implications.

## 5. Suspicious activity / regulatory disclosures

- SAR/STR for the underlying customer or counterparty flow (not the wCBDC settlement leg per se).
- Sanctions-block notifications.
- Cyber-incident notifications per DORA / FFIEC / etc.

## 6. Data quality and lineage

- Lineage from on-chain event → integration → sub-ledger → GL → regulatory report.
- DQ KPIs.
- Issue management for DQ defects.

## 7. Data governance

- Domain ownership, stewards, custodians.
- Glossary alignment.

## 8. Privacy

- On-chain personal data avoided on wholesale platform.
- Settlement-flow data treated under privacy / confidentiality rules.

## 9. Records retention

- Minimum 5 years (or longer where required).
- Tamper-evident archive.

## 10. Disclosures

- Internal disclosure to ALCO / Treasury Committee.
- Public disclosures per supervisor expectations (significant participations may require Pillar 3 disclosure context).

## Cross-links

[`./README.md`](./README.md) · [`07-rtgs-and-fmi-integration.md`](./07-rtgs-and-fmi-integration.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md)
