# Tokenized MMF — sponsor onboarding requirements

This subdirectory enumerates the requirements an asset manager / fund sponsor must satisfy to launch and operate a tokenized money-market-fund programme.

The bar is broadly: existing fund-management authorisation, MMF-specific regime compliance, qualified custody, transfer-agent integration, on-chain identity gating, and full investor protection.

## Domain index

| # | Domain | Why it matters |
|---|---|---|
| 01 | [Technical](./01-technical.md) | Smart contracts (often ERC-4626 + ERC-3643), NAV pipeline, key custody |
| 02 | [Regulatory](./02-regulatory.md) | Asset-management licence, MMF regime (EU MMFR, SEC 2a-7, MAS, FCA, FINMA), DLT regimes |
| 03 | [Compliance — AML / CFT / KYB / KYC / sanctions](./03-compliance-aml-kyc.md) | Investor due diligence, transfer restrictions, sanctions |
| 04 | [Operational](./04-operational.md) | Subscription / redemption ops, NAV cycles, incident response |
| 05 | [Legal and contractual](./05-legal-contractual.md) | Prospectus, fund-vehicle structure, custody, transfer-agent agreements |
| 06 | [Risk and capital](./06-risk-capital.md) | MMF prudential rules, liquidity, gates, fees |
| 07 | [Custody and fund administration](./07-custody-and-fund-admin.md) | Qualified custody, fund admin, NAV strike, transfer agent |
| 08 | [Governance and controls](./08-governance-controls.md) | Three lines, fund board, independent oversight |
| 09 | [Data, accounting, regulatory reporting](./09-data-reporting.md) | NAV, fund accounting, regulator reporting |
| 10 | [Security and cyber](./10-security-cyber.md) | Smart contract security, key custody, NAV-feed integrity |

## Reading order

1. [Regulatory](./02-regulatory.md) — confirm MMF regime and tokenization compatibility.
2. [Legal and contractual](./05-legal-contractual.md) — fund vehicle, prospectus, custody, transfer agent.
3. [Risk and capital](./06-risk-capital.md) — MMF prudential rules.
4. [Custody and fund administration](./07-custody-and-fund-admin.md) and [Technical](./01-technical.md) — build.
5. [Security](./10-security-cyber.md), [Compliance](./03-compliance-aml-kyc.md), [Operational](./04-operational.md) — go-live readiness.
6. [Governance](./08-governance-controls.md) and [Data / reporting](./09-data-reporting.md) — cut across.

## Cross-links

Back to parent: [`../tokenized-mmf.md`](../tokenized-mmf.md) · Cash-leg comparison: [`../comparison-matrix.md`](../comparison-matrix.md) · Strategy: [`../../decisions/0002-cash-leg-strategy.md`](../../decisions/0002-cash-leg-strategy.md)
