# 05 — Legal and contractual requirements

The legal layer establishes the fund vehicle, the investor's claim, and the role of the on-chain register. Token-on-chain status must align with the prospectus and regulator expectations.

## 1. Fund vehicle

- Domiciled in a jurisdiction with an MMF-compatible regime (Cayman, Delaware, Luxembourg, Ireland, etc.).
- Constitutional documents (memorandum and articles, trust deed, partnership agreement).
- Bankruptcy-remote from the sponsor.

## 2. Prospectus / offering memorandum

- Investment policy aligned with MMF regime.
- Subscription and redemption mechanics, including tokenized mechanics.
- Risk disclosures including DLT, smart contract, and key-management risks.
- Fee structure.
- Custodian and fund administrator identity.
- Target investor profile.

## 3. Token T&Cs

- Express that the token is the on-chain record of the fund unit.
- Transfer restrictions, allowlist, jurisdiction rules.
- Subscription / redemption mechanics, including cash-leg options.
- Force-transfer / freeze / clawback rights.
- Wallet attestation responsibilities.
- Self-custody (if permitted) — explicit risk allocation.
- Force majeure.
- Governing law, jurisdiction, dispute resolution.

## 4. Smart contract legal status

- Smart contract is the operational layer; legal claim sits in the prospectus and T&Cs.
- Code-bug-induced on-chain outcomes are reversed by force-transfer / clawback.

## 5. Custody agreements

- Qualified custodian for underlying T-bill / repo / cash assets.
- Tokenization provider / transfer-agent agreement covering on-chain register.
- Sub-custody and sub-tokenization-provider arrangements documented.

## 6. Fund administrator agreement

- NAV calculation, fund accounting, transfer-agent functions (where applicable).
- Service-level commitments.
- Audit rights and reporting.

## 7. Vendor contracts

- Tokenization provider (Securitize, Backed, in-house): scope, capped liability, confidentiality.
- Identity provider, sanctions feed, chain analytics, Travel Rule provider.
- Cloud providers: standard cloud DPA + DORA-aligned clauses.
- Smart contract auditors: scope, capped liability.

## 8. Distribution arrangements

- Direct-investor agreements: subscription docs, redemption docs.
- Exchange / venue agreements where secondary trading is offered.
- Non-discrimination among investors where required by regime.

## 9. IP and open source

- Smart contract code licensing.
- Open-source dependency catalogue; SPDX / SBOM; licence compliance.
- Patent freedom-to-operate.

## 10. Wind-down and exit

- Documented orderly wind-down: redemption window, asset liquidation, customer communications, archival.
- Token-specific wind-down: deactivate contracts, finalise redemptions.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md) · [`08-governance-controls.md`](./08-governance-controls.md)
