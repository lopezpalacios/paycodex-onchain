# 06 — Risk management and capital

Tokenized deposits typically inherit the prudential treatment of the underlying deposit. The bank must demonstrate that to its supervisor, document it in ICAAP/ILAAP, and maintain capital and liquidity coverage for the *additional* risks that tokenization introduces.

## 1. Prudential classification

- Underlying deposit: standard liability on banking book, treated under existing capital and liquidity frameworks.
- Tokenized representation: not a separate financial instrument for capital purposes if the legal construction is "same claim, different form". Document this view; obtain supervisory comfort.
- Holders of the token: counterparty exposure to the issuing bank — risk-weight per Basel III standardised or IRB approach for bank exposures.
- Basel SCO60 (crypto-asset prudential treatment) — typically *not* applicable to a tokenized deposit issued by the bank itself, but applies where the bank *holds* another entity's tokenized deposit.

## 2. ICAAP / ILAAP impact

- ICAAP additions:
  - Operational risk capital uplift for new technology, change risk, third-party risk.
  - Conduct risk for novel customer-facing product.
  - Reputational risk for high-visibility incidents.
- ILAAP additions:
  - 24/7 redemption demand modelling — token can be redeemed any hour; liquidity buffers must cover off-hours.
  - Run-risk modelling specific to digital channels (faster information diffusion → faster outflows).
  - Stress scenarios: 1-hour, 4-hour, 24-hour redemption shocks; coordinated multi-bank shock.
- Capital and liquidity stress-testing scenarios approved by Risk Committee.

## 3. Risk taxonomy specific to tokenized deposits

- **Operational risk** — smart contract bug, key compromise, oracle failure, mint/burn drift, integration failure.
- **Cyber risk** — bridge attack, RPC poisoning, frontend phishing for wallet keys.
- **Liquidity risk** — accelerated redemption velocity, off-hours demand spikes.
- **Counterparty risk** — for bridges and third-party VASPs.
- **Compliance risk** — Travel Rule failure, sanctions breach, KYC drift.
- **Legal risk** — uncertainty about token classification, cross-border enforceability.
- **Reputational risk** — high-visibility outage or exploit.
- **Conduct risk** — customer harm from product complexity.
- **Model risk** — pricing, redemption, and reconciliation models.

## 4. Risk appetite

- Documented risk appetite statement covering each risk type with KRIs and thresholds.
- Examples of KRIs:
  - Reconciliation drift (target 0; threshold > 0 = Sev 1).
  - Time-to-detect supply anomaly (target < 60s).
  - Sanctions screening false-negative rate (target 0; periodic back-test).
  - Allowlist re-attestation overdue rate.
  - Smart contract incident count (target 0).
  - Key-ceremony quorum integrity.

## 5. Stress testing

- Reverse stress test: at what redemption pace does the bank fail to honour redemptions on-chain or off-chain?
- Concentration stress: single large customer redeems entire holding.
- Tech stress: chain halt for 4h, 12h, 24h.
- Compliance stress: sanctions feed outage; how is screening preserved?

## 6. Recovery and resolution

- Recovery indicators include tokenized-deposit-specific signals (e.g., redemption velocity, reconciliation drift).
- Resolution plan addresses continuity-of-access to the token: re-pointing of issuer authority to acquirer; ability to freeze and re-issue under new keys.
- Bail-in mechanics: tokenized deposits rank pari passu with non-tokenized deposits of the same class.

## 7. Insurance

- Crime / specie / digital-asset custody insurance covering key compromise.
- Smart contract exploit cover (where market available — limited capacity).
- Cyber insurance with explicit DLT scope.

## 8. Risk reporting

- Daily KRI dashboard to first and second lines.
- Monthly risk pack to Risk Committee.
- Quarterly risk pack to Board / Audit Committee.
- Ad-hoc reporting on Sev 1 incidents.

## 9. Model risk

- Models to validate: redemption demand, run-risk, sanctions screening thresholds, transaction-monitoring rules.
- Validation cycle per the bank's model risk framework (e.g., SR 11-7 for US banks).
- Annual revalidation; benchmark against external data where available.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`09-data-reporting.md`](./09-data-reporting.md) · [`../../compliance/basel-iii-crypto.md`](../../compliance/basel-iii-crypto.md)
