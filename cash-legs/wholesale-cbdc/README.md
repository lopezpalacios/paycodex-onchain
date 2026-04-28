# Wholesale CBDC — bank participation onboarding requirements

This subdirectory enumerates the requirements a bank must satisfy to participate in a wholesale CBDC programme. The scope is the bank's posture as a *participant*; the central bank itself is the issuer and platform operator.

The bar is broadly: prudential standing with the home regulator, integration with the FMI/DLT operator, IT and key-management readiness, settlement-risk-grade ops.

## Domain index

| # | Domain | Why it matters |
|---|---|---|
| 01 | [Technical](./01-technical.md) | Wallet, custody, integration, smart-contract templates |
| 02 | [Regulatory](./02-regulatory.md) | Authorisation to participate; cross-border permissions |
| 03 | [Compliance — AML / CFT / sanctions](./03-compliance-aml-kyc.md) | Counterparty due diligence, sanctions, audit trail |
| 04 | [Operational](./04-operational.md) | 24/7 ops, end-of-day cycles, incident response |
| 05 | [Legal and contractual](./05-legal-contractual.md) | Participation agreement, FMI rulebook, settlement finality |
| 06 | [Risk and capital](./06-risk-capital.md) | LCR / NSFR treatment, intraday liquidity, settlement risk |
| 07 | [RTGS and FMI integration](./07-rtgs-and-fmi-integration.md) | Subscription / redemption mechanics; tokenized-securities DvP |
| 08 | [Governance and controls](./08-governance-controls.md) | Three lines, board oversight, audit |
| 09 | [Data, accounting, regulatory reporting](./09-data-reporting.md) | Sub-ledger, GL, regulator reporting |
| 10 | [Security and cyber](./10-security-cyber.md) | Key custody, contract security, integration security |

## Reading order

1. [Regulatory](./02-regulatory.md) — confirm participation eligibility.
2. [Legal and contractual](./05-legal-contractual.md) — sign FMI rulebook and participation agreement.
3. [Risk and capital](./06-risk-capital.md) — confirm prudential treatment and intraday liquidity sizing.
4. [Technical](./01-technical.md) and [RTGS and FMI integration](./07-rtgs-and-fmi-integration.md) — build the integration.
5. [Security](./10-security-cyber.md), [Compliance](./03-compliance-aml-kyc.md), [Operational](./04-operational.md) — go-live readiness.
6. [Governance](./08-governance-controls.md) and [Data / reporting](./09-data-reporting.md) — cut across all.

## Cross-links

Back to parent: [`../wholesale-cbdc.md`](../wholesale-cbdc.md) · Cash-leg comparison: [`../comparison-matrix.md`](../comparison-matrix.md) · Strategy: [`../../decisions/0002-cash-leg-strategy.md`](../../decisions/0002-cash-leg-strategy.md)
