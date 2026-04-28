# Tokenized deposit — bank onboarding requirements

This subdirectory enumerates the requirements a chartered bank must satisfy to launch and operate a tokenized commercial bank deposit programme. The list is intentionally comprehensive: any single missing pillar is typically sufficient for a supervisor to refuse non-objection.

Use this as a self-assessment checklist during the build phase and as a control catalogue once live.

## Domain index

| # | Domain | Why it matters |
|---|---|---|
| 01 | [Technical](./01-technical.md) | Smart contracts, chain choice, key management, wallet stack, on-chain identity |
| 02 | [Regulatory](./02-regulatory.md) | Banking licence, jurisdictional regimes (MiCA, FINMA DLT Act, MAS, FCA, OCC, NYDFS), supervisory non-objection |
| 03 | [Compliance — AML / CFT / KYC / sanctions](./03-compliance-aml-kyc.md) | Travel Rule, transaction monitoring, sanctions screening, customer due diligence |
| 04 | [Operational](./04-operational.md) | Run-the-bank ops: incident response, change management, BAU staffing, SLAs |
| 05 | [Legal and contractual](./05-legal-contractual.md) | Token T&Cs, custody agreements, vendor contracts, smart-contract legal status |
| 06 | [Risk and capital](./06-risk-capital.md) | Basel treatment, ORC, liquidity coverage, market and credit risk framing |
| 07 | [Core banking and payments integration](./07-integration-core-banking.md) | Mint/burn orchestration, sub-ledger, SEPA/SIC/Fedwire/SWIFT integration |
| 08 | [Governance and controls](./08-governance-controls.md) | Three lines of defence, internal audit, board oversight, model risk |
| 09 | [Data, accounting, regulatory reporting](./09-data-reporting.md) | Sub-ledger reconciliation, IFRS 9 / US GAAP, COREP/FINREP, suspicious-activity reporting |
| 10 | [Security and cyber](./10-security-cyber.md) | Key custody (HSM/MPC), DORA / NIST / FFIEC alignment, smart contract audits, red-team |

## Reading order suggestion

1. Start with [Regulatory](./02-regulatory.md) to confirm the legal envelope is feasible in your jurisdiction.
2. Then [Legal and contractual](./05-legal-contractual.md) to establish the token's legal nature.
3. [Risk and capital](./06-risk-capital.md) to confirm prudential viability.
4. [Technical](./01-technical.md) and [Security](./10-security-cyber.md) for the build.
5. [Compliance](./03-compliance-aml-kyc.md), [Integration](./07-integration-core-banking.md), [Operational](./04-operational.md) for go-live readiness.
6. [Governance](./08-governance-controls.md) and [Data / reporting](./09-data-reporting.md) cut across all of the above.

## Cross-links

Back to parent: [`../tokenized-deposit.md`](../tokenized-deposit.md) · Cash leg comparison: [`../comparison-matrix.md`](../comparison-matrix.md) · Strategy decision: [`../../decisions/0002-cash-leg-strategy.md`](../../decisions/0002-cash-leg-strategy.md)
