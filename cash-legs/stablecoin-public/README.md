# Stablecoin — issuer onboarding requirements

This subdirectory enumerates the requirements an entity must satisfy to launch and operate a regulated public-chain stablecoin programme (EMT under MiCA; trust / EMI / bank-charter equivalents in other jurisdictions).

The bar is broadly: authorised issuer, fully reserved, audited, redemption-on-demand at par, full AML/CFT, public-chain operational maturity.

## Domain index

| # | Domain | Why it matters |
|---|---|---|
| 01 | [Technical](./01-technical.md) | Smart contracts, chain choice, key management, freeze/blacklist primitives |
| 02 | [Regulatory](./02-regulatory.md) | Authorisation regime (MiCA EMT/ART, NY DFS, MAS, FCA/BoE, HKMA, FINMA) |
| 03 | [Compliance — AML / CFT / KYB / sanctions](./03-compliance-aml-kyc.md) | Travel Rule, sanctions, transaction monitoring, blacklist policy |
| 04 | [Operational](./04-operational.md) | 24/7 ops, incident response, change management, vendor management |
| 05 | [Legal and contractual](./05-legal-contractual.md) | Token T&Cs, redemption rights, custody, white paper |
| 06 | [Risk and capital](./06-risk-capital.md) | Own funds, reserve composition, liquidity, run risk |
| 07 | [Reserves, banking, payments](./07-reserves-and-banking.md) | Reserve banking, segregation, on/off-ramps |
| 08 | [Governance and controls](./08-governance-controls.md) | Board oversight, three lines, internal audit |
| 09 | [Data, accounting, regulatory reporting](./09-data-reporting.md) | Reserve attestations, regulator reporting, accounting |
| 10 | [Security and cyber](./10-security-cyber.md) | Key custody, smart contract security, bridge security |

## Reading order

1. [Regulatory](./02-regulatory.md) — confirm legal envelope and authorisation pathway.
2. [Legal and contractual](./05-legal-contractual.md) — T&Cs, redemption, white paper.
3. [Reserves, banking, payments](./07-reserves-and-banking.md) and [Risk and capital](./06-risk-capital.md) — prudential viability.
4. [Technical](./01-technical.md) and [Security](./10-security-cyber.md) — build.
5. [Compliance](./03-compliance-aml-kyc.md), [Operational](./04-operational.md) — go-live readiness.
6. [Governance](./08-governance-controls.md) and [Data / reporting](./09-data-reporting.md) — cut across all.

## Cross-links

Back to parent: [`../stablecoin-public.md`](../stablecoin-public.md) · Cash-leg comparison: [`../comparison-matrix.md`](../comparison-matrix.md) · Strategy: [`../../decisions/0002-cash-leg-strategy.md`](../../decisions/0002-cash-leg-strategy.md)
