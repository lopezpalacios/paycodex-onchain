# 09 — Data, accounting, regulatory reporting

A regulated stablecoin issuer files into multiple regulatory regimes simultaneously. The on-chain ledger is a primary source of truth for supply; the financial reporting estate must consume it cleanly.

## 1. Accounting

- Token issuance recognised as a liability of the issuer (e-money obligation).
- Reserves recognised as assets with classification per IFRS 9 / US GAAP (fair-value or amortised-cost depending on instrument and business model).
- Daily fair-value process for marketable reserves.
- External auditor signs off the policy pre-launch.

## 2. Regulatory reporting

### EU — MiCA
- Monthly disclosures: reserves composition, outstanding tokens, redemption volumes.
- Annual financial statements + audit.
- Significant-EMT additional reporting (interoperability, transfer volumes, large holders).
- Incident reporting per DORA timelines.
- ESMA / EBA notifications on triggers.

### US
- State trust reporting (NY DFS quarterly, etc.).
- FinCEN BSA reporting (SARs, CTRs).
- OFAC blocked-property reports.
- Federal stablecoin-act reporting (per operative regime).

### UK
- FCA returns; BoE returns for systemic stablecoins.
- HMT / FSMA-specific reporting as the regime phases in.

### Singapore
- MAS periodic returns under Stablecoin Regulatory Framework.
- AML/CFT reporting under PSN02.

### Hong Kong
- HKMA periodic returns under Stablecoin Ordinance.

### Switzerland
- FINMA returns; SNB statistics.

## 3. Reserve attestations and disclosures

- Monthly attestation pack: reserve composition, custodian breakdown, supply reconciliation.
- Annual audit: full financial statements + reserves.
- Public reserve dashboard where regimes encourage transparency.

## 4. Tax reporting

- CRS / FATCA / DAC8 where applicable.
- Withholding on interest if interest-bearing structure is used.
- Information returns for direct redeemers per local rules.

## 5. Suspicious activity / regulatory disclosures

- SAR/STR filing per FIU.
- Sanctions-block notifications per local rules.
- Travel Rule message archive.
- Cyber-incident notifications per DORA / FFIEC / NYDFS / SEC / etc.

## 6. Data quality and lineage

- Lineage from on-chain event → orchestrator → ledger → GL → regulatory report.
- DQ KPIs (completeness, timeliness, accuracy, consistency).
- Issue management for DQ defects.

## 7. Data governance

- Data domain ownership.
- Stewards and custodians per domain.
- Glossary alignment with org-wide data dictionary.

## 8. Privacy

- On-chain personal data minimised.
- Off-chain identity store with encryption and access controls.
- DSAR / right-to-erasure handled.
- DPAs with all processors.

## 9. Records retention

- Minimum 5 years; longer where required.
- WORM / cryptographic anchoring.

## 10. Disclosures to redeemers

- Transaction confirmations, statements, attestation links.
- Incident communications and post-mortems where appropriate.

## Cross-links

[`./README.md`](./README.md) · [`07-reserves-and-banking.md`](./07-reserves-and-banking.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md)
