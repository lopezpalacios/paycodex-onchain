# 09 — Data, accounting, regulatory reporting

The tokenized deposit must show up consistently and auditable across the finance, risk, and regulatory reporting estate. The on-chain ledger does not replace any of these reports; it must feed them.

## 1. Accounting policy

- Underlying deposit recognised as a financial liability under IFRS 9 / ASC 320 / equivalent local GAAP.
- Tokenized representation: same liability; tokenization does not change recognition, measurement, or derecognition.
- Interest accrual (if any) follows the same rules as the underlying deposit category.
- Disclosures: tokenized deposit balances disclosed separately or aggregated per accounting policy and supervisor expectation.
- External auditor signs off the policy pre-launch.

## 2. Sub-ledger and GL

- Dedicated sub-ledger maps one-to-one to on-chain holders.
- Daily journal posting to GL with full audit trail.
- Period-end balances reconciled to on-chain `totalSupply()` and per-holder balances.
- Long-term archive of journals and reconciliation evidence.

## 3. Regulatory reporting

### European Union
- COREP (capital and large exposures).
- FINREP (financial reporting; tokenized deposit balances disclosed per EBA taxonomy).
- AnaCredit (where applicable to corporate credits/deposits at scale).
- ECB statistical reporting (BSI, MIR).
- DORA: register of information (third parties), major ICT-related incident reporting.
- EBA / ESMA notifications where required.
- TFR / Travel Rule message logs available for inspection.

### United Kingdom
- PRA regulatory returns (capital, liquidity, large exposures).
- FCA reports (e.g., REP-CRIM for financial crime data).
- FSCS information for protected deposit categorisation.

### United States
- FFIEC Call Reports (FFIEC 031/041) including deposit categorisation.
- FR 2052a (liquidity).
- Y-9/Y-15 for BHCs.
- BSA reporting: SARs (FinCEN Form 111), CTRs (Form 112) where thresholds met.
- OFAC blocked-property reports.

### Switzerland
- FINMA reporting (capital, liquidity, large exposures, AMLA).
- SNB statistical reporting.

### Singapore / Hong Kong / others
- MAS / HKMA periodic returns; sandbox-specific reporting where applicable.

## 4. Tax reporting

- CRS and FATCA reporting for in-scope holders.
- DAC8 (EU) where applicable.
- Withholding on interest where the token is interest-bearing.
- Information returns (e.g., 1099-INT-equivalent) for relevant jurisdictions.

## 5. Suspicious activity / regulatory disclosures

- SAR/STR filing per local FIU.
- Sanctions-block notifications per local rules (OFAC, OFSI, etc.).
- Travel Rule message archive.
- Cyber-incident notifications per DORA / GLBA / NYDFS Part 500 / SEC cyber rules / etc.

## 6. Data quality and lineage

- Documented lineage from on-chain event → orchestrator → sub-ledger → GL → regulatory report.
- Data quality KPIs (completeness, timeliness, accuracy, consistency).
- Issue-management workflow for DQ defects.
- Data-quality dashboards visible to 1LoD and 2LoD.

## 7. Data governance

- Data domain ownership (customer, transaction, position, identity, control).
- Steward and custodian roles per domain.
- Glossary alignment with bank-wide data dictionary.

## 8. Personal data and privacy

- On-chain personal data minimised: no PII directly on-chain.
- Wallet ↔ identity binding stored off-chain in identity service with full encryption-at-rest and access controls.
- DSAR (data subject access request) process covers off-chain identity binding.
- Right-to-erasure handled by erasing off-chain binding; on-chain history retained as legally required business record (justified under "legal obligation" basis).

## 9. Records retention

- Minimum 5 years (or longer per jurisdiction) for all transaction and customer records.
- Tamper-evident archive (WORM / cryptographic anchoring).
- Retention schedule documented and reviewed annually.

## 10. Disclosures to customers

- Statements include tokenized deposit balances.
- Online banking shows tokenized vs non-tokenized split.
- Tax-document generation includes tokenized deposit interest where applicable.

## Cross-links

[`./README.md`](./README.md) · [`07-integration-core-banking.md`](./07-integration-core-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md)
