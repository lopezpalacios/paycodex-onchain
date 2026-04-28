# Retail CBDC — bank distributor onboarding requirements

This subdirectory enumerates the requirements a bank must satisfy to onboard as a retail CBDC distributor / PSP. The bar is broadly: existing licensing as a credit institution / PSP, scheme participation, IT integration with the CBDC infrastructure, full AML/CFT and customer-protection alignment.

The position is intermediated: the central bank issues; the bank distributes, services customers, and reports.

## Domain index

| # | Domain | Why it matters |
|---|---|---|
| 01 | [Technical](./01-technical.md) | Wallet integration, SDK, reverse waterfall, offline support |
| 02 | [Regulatory](./02-regulatory.md) | Mandatory distribution, scheme participation, supervisor liaison |
| 03 | [Compliance — AML / CFT / KYC / sanctions](./03-compliance-aml-kyc.md) | Tiered KYC, transaction monitoring, sanctions, dispute handling |
| 04 | [Operational](./04-operational.md) | 24/7 customer service, incident response, scheme participation ops |
| 05 | [Legal and contractual](./05-legal-contractual.md) | Scheme rulebook, customer T&Cs, distributor agreement |
| 06 | [Risk and capital](./06-risk-capital.md) | LCR / NSFR impact, deposit migration, intraday liquidity |
| 07 | [Core banking and payments integration](./07-integration-core-banking.md) | Reverse waterfall, GL impact, payments-rail interoperability |
| 08 | [Governance and controls](./08-governance-controls.md) | Three lines, board oversight, audit |
| 09 | [Data, accounting, regulatory reporting](./09-data-reporting.md) | Scheme reporting, supervisor reporting, customer disclosures |
| 10 | [Security and cyber](./10-security-cyber.md) | Wallet security, fraud, customer-side phishing |

## Reading order

1. [Regulatory](./02-regulatory.md) — confirm distributor obligation status.
2. [Legal and contractual](./05-legal-contractual.md) — sign scheme rulebook and customer T&Cs.
3. [Risk and capital](./06-risk-capital.md) — model deposit-migration impact and intraday liquidity.
4. [Technical](./01-technical.md) and [Core banking integration](./07-integration-core-banking.md) — build.
5. [Security](./10-security-cyber.md), [Compliance](./03-compliance-aml-kyc.md), [Operational](./04-operational.md) — go-live readiness.
6. [Governance](./08-governance-controls.md) and [Data / reporting](./09-data-reporting.md) — cut across.

## Cross-links

Back to parent: [`../retail-cbdc.md`](../retail-cbdc.md) · Cash-leg comparison: [`../comparison-matrix.md`](../comparison-matrix.md) · Strategy: [`../../decisions/0002-cash-leg-strategy.md`](../../decisions/0002-cash-leg-strategy.md)
