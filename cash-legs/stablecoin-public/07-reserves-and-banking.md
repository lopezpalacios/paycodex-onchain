# 07 — Reserves, banking, payments integration

Reserves *are* the product. The technical and legal layers exist to keep on-chain supply provably equal to a 1:1 segregated reserve. The banking and payments layer is the lifeline.

## 1. Reserve banking

- Multiple custodian banks across multiple jurisdictions for redundancy.
- Segregated accounts in the issuer's name "for the benefit of token holders" (or equivalent legal construction).
- Documented bank-run risk mitigation (USDC SVB lesson): no single-bank concentration.
- Tier-1 banks where regulators expect them (especially for significant-EMT and systemic-stablecoin designations).
- Eligible reserve banks reviewed quarterly; criteria documented.

## 2. Reserve composition

- Cash at central banks (where the regime allows the issuer to hold reserve at a CB).
- Short-dated government securities (typically T-bills < 90 days).
- Reverse repo against HQLA.
- Money-market fund holdings (subject to regime acceptance — increasingly restricted).
- Concentration limits per asset class and counterparty.

## 3. Reserve management

- Internal treasury function or outsourced manager (BlackRock, etc.).
- Investment guidelines aligned with regime rules.
- Daily mark-to-market and reconciliation.
- Yield treatment: typically the issuer keeps yield (subject to regime) and does not pass to holders without securities-law implications.

## 4. Reserve attestation and audit

- Monthly attestation by Big-4 or equivalent (within X business days of month-end).
- Annual financial-statement audit covering reserves, supply, custody arrangements.
- Public disclosures per regime (MiCA monthly disclosures, NY DFS guidance, MAS / HKMA equivalents).

## 5. Issuance and redemption rails

- Fiat-receipt detection: MT940 / camt.054 from custodian banks; APIs where available.
- Fiat-payout execution: SEPA SCT / SCT Inst (EUR, EU); TARGET2 / TIPS (EUR); Fedwire / FedNow / ACH (USD); CHAPS / Faster Payments (GBP); SIC4 / euroSIC (CHF / EUR-CH); SWIFT MT/MX cross-border.
- Idempotent processing per fiat reference + chain transaction hash.
- Redemption SLAs documented and met.

## 6. On-/off-ramp partners

- Licensed exchanges and OTC desks distribute the token.
- Partner KYB; restrictions on distribution to sanctioned jurisdictions.
- Transparent fee structures; non-discrimination among redeemers (where required).

## 7. Reconciliation

- Continuous reconciliation: on-chain `totalSupply()` (per chain + aggregate) vs reserve balances.
- Daily reconciliation against custodian statements.
- Monthly reconciliation against attestation.
- Drift triggers automatic pause and Sev 1 incident.

## 8. Reference data

- Customer (direct redeemer) ↔ wallet ↔ counterparty bank account linkage.
- Bank-side reference (camt.054 EndToEndId) ↔ on-chain `fiatReference` ↔ orchestrator correlation ID.

## 9. Liquidity coordination

- Daily liquidity report covering reserve composition, redemption pipeline, banking-rail availability.
- Pre-positioning ahead of expected events (rate decisions, market opens, holidays).

## 10. Bridge canonical accounting

- For multi-chain canonical issuance: per-chain supply tracked; lock-and-mint or burn-and-mint accounting maintained on-chain.
- Daily reconciliation across chains; bridge-canonical drift triggers Sev 1.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`04-operational.md`](./04-operational.md) · [`09-data-reporting.md`](./09-data-reporting.md)
