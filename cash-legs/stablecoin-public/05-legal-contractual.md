# 05 — Legal and contractual requirements

The legal layer establishes what the token *is*, who owes what, and how disputes resolve. For a regulated stablecoin the central concept is a redemption claim against the issuer secured by segregated reserves.

## 1. Legal classification

- Express opinion (preferably external counsel + supervisor confirmation) on:
  - Whether the token is an EMT, an ART, e-money, a deposit, a security, a payment instrument, or other.
  - Whether the redemption claim is a debt, a trust beneficiary interest, or other under the operative regime.
- Jurisdictional mapping: classification per material market.
- Confirmation that the token is *not* a security where it should not be (US SEC perimeter; EU prospectus regime; UK financial-promotion regime).

## 2. White paper / prospectus / disclosure document

- Required in MiCA (white paper notification) and several other regimes.
- Token mechanics, reserve composition, redemption rights, risks, governance, custodian / reserve manager identities, attestation arrangements, contact channels.
- Marketing rules per jurisdiction.

## 3. Customer-facing terms

- Token purchase / redemption terms.
- Allowed holders, prohibited use cases.
- Blacklist, freeze, force-transfer rights — explicit grounds.
- Fee schedule; redemption-at-par commitments.
- Force majeure (chain outage, oracle failure, banking-rail outage).
- Governing law, jurisdiction, dispute resolution.
- Wind-down and continuity-of-redemption commitments.

## 4. Smart contract legal status

- Position the smart contract as the operational layer; legal claim sits in the T&Cs.
- Contract bug producing a different on-chain outcome from the legal outcome is reversed by force-transfer / clawback.
- "Code is law" framing rejected.

## 5. Custody and reserve-management agreements

- Custodian banks: segregation, on-chain reporting, audit rights, insurance, sub-custody handling.
- Reserve manager: investment guidelines, eligible assets, concentration limits, reporting, performance reporting.
- Service-level agreements with documented escalation paths.

## 6. Vendor contracts

- Smart contract auditors: scope, capped liability, confidentiality.
- RPC providers, chain analytics, sanctions feeds, Travel Rule providers, identity providers — DPAs, SLAs, exit assistance.
- Cloud providers: standard cloud DPA + DORA-aligned third-party clauses.

## 7. Distribution arrangements

- Exchange / OTC partner agreements: KYB on partner, restrictions on distribution to sanctioned jurisdictions, marketing rules.
- Direct-redeemer agreements: KYB obligations, redemption mechanics, dispute resolution.

## 8. Bridge arrangements

- Bridge operator agreements where canonical issuance is bridged.
- Liability allocation for bridge failure.
- Reserve / proof-of-reserves attestations specific to bridged supply.
- Insurance for bridge-specific risks.

## 9. IP and open source

- Smart contract code licensing.
- Open-source dependency catalogue; SPDX / SBOM; licence compliance.
- Patent freedom-to-operate.

## 10. Wind-down and exit

- Documented orderly wind-down: notice period, redemption window, reserve liquidation plan, customer communications, archival.
- Resolution-friendly: ability to transfer to acquirer; T&Cs preserve continuity.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md) · [`08-governance-controls.md`](./08-governance-controls.md)
