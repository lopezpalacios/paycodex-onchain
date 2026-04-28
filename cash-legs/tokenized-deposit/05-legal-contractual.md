# 05 — Legal and contractual requirements

The legal layer determines what the token *is*, who owes what to whom, and how disputes resolve. Without this, technical perfection is irrelevant.

## 1. Legal classification of the token

- Express opinion (preferably from external counsel + supervisor confirmation) that the token is a representation of, or directly constitutes, a deposit liability of the bank.
- Confirmation that the token is *not* a security under local law (or, where it is, securities-law compliance follows).
- Confirmation that the token is *not* an e-money token / EMT (or that, if framed as such, EMT rules are followed — generally not desirable for a tokenized deposit because it changes prudential treatment).
- Confirmation that the underlying deposit remains within the deposit guarantee scheme (DGS / FDIC / FSCS / DICGC / etc.) where applicable.

## 2. Token terms and conditions (customer-facing)

- Defined relationship: the token represents a claim against the bank equivalent to the underlying DDA.
- Issuance, transfer, redemption mechanics.
- Fees, interest (if any), accrual mechanics.
- Allowlist participation, KYC obligations, attestation lifecycle.
- Freeze, force-transfer, clawback rights — explicit, with grounds.
- Self-custody (if permitted) — risk allocation, key-loss handling, recovery options.
- Liability limitations and indemnities.
- Force majeure, including chain outages and oracle failures.
- Governing law and jurisdiction.
- Dispute resolution: court vs arbitration; consumer-protection carve-outs.
- Termination: under what circumstances the bank can wind down the token; redemption-in-kind to fiat.

## 3. Smart contract legal status

- Position the smart contract as the operational layer; the legal claim sits in the T&Cs.
- "Code is law" framing is *not* used; the contract executes the bank's instructions consistent with T&Cs.
- Where a contract bug produces a different on-chain outcome from the legally agreed outcome, the T&Cs prevail and the bank may force-transfer / claw back to restore the correct state.

## 4. Custody arrangements

- Bank-custodied wallets: custody agreement (often satisfied within the standard banking relationship), with explicit references to wallet management.
- Third-party institutional custody: ISDA/master-style agreement covering segregation, on-chain reporting, key-management standards, audit rights, insurance.
- Self-custody: risk waiver, attestation duties, recovery process.

## 5. Vendor contracts

- Chain operator (if outsourced): SLAs, liability caps, audit rights, exit assistance, source-code escrow where relevant.
- Identity provider: data-processing agreement, breach notification, sub-processor approval.
- Sanctions feed / chain analytics: data-licence terms, refresh SLAs, breach handling.
- Smart contract auditors: scope, liability framework (typically capped), confidentiality, post-audit support.
- Key-custody provider: insurance, SOC 2 / ISO 27001, key-ceremony participation, exit / re-shard procedure.
- Cloud providers: standard cloud DPA + DORA-aligned third-party clauses.

## 6. Inter-bank / consortium arrangements (Model B)

- Rulebook for the shared ledger.
- Roles: validator, issuer, settlement agent, oracle provider.
- Cross-issuer settlement mechanics (netting, FX, PvP).
- Default and remediation procedures.
- Antitrust / competition-law review for consortia.

## 7. Bridge arrangements (Model C)

- Bridge operator agreement.
- Allocation of liability for bridge failure.
- Reserves / proof-of-reserves attestations.
- Insurance coverage for bridge-specific risks.

## 8. IP and open-source

- Licensing of smart contract code (typically MIT / Apache-2.0; some banks prefer source-available with restrictions).
- Use of open-source dependencies catalogued; licence compliance (SPDX, SBOM).
- Patents: defensive review of bank's portfolio + freedom-to-operate analysis on key designs.

## 9. Data protection agreements

- DPAs with every processor handling personal data (identity provider, chain analytics, support tooling).
- Standard contractual clauses for cross-border transfers; transfer impact assessments.

## 10. Wind-down and exit

- Documented orderly wind-down: notice period to customers, redemption window, fallback to fiat DDA, archival of records.
- Resolution-friendly: token can be re-pointed to acquirer in resolution; T&Cs preserve continuity.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`06-risk-capital.md`](./06-risk-capital.md) · [`08-governance-controls.md`](./08-governance-controls.md)
