# 03 — Compliance: AML / CFT / KYB / KYC / sanctions

A regulated stablecoin issuer is an AML-obligated entity (EMI, MSB, trust, or bank). The on-chain nature of distribution does not reduce the compliance burden; it concentrates it on the perimeter (direct redeemers, blacklist policy, screening of secondary-market counterparties as applicable).

## 1. Direct-redeemer due diligence (KYB / KYC)

- Full KYB on institutional direct redeemers: corporate verification, UBO (FATF Rec 24/25), licence verification (where the redeemer is a regulated entity), source of funds.
- KYC on individuals where the regime allows direct individual redemption.
- EDD for higher-risk redeemers (PEPs, high-risk jurisdictions, complex ownership).
- Periodic refresh tied to risk tier; refresh failure blocks future direct redemption.
- Wallet attestation: redeemer wallets attested and bound to redeemer identity.

## 2. Sanctions

- Onboarding screening (OFAC, EU consolidated, UN, UK OFSI, local lists).
- Real-time re-screening on list updates.
- On-chain blacklist propagation: known sanctioned addresses pushed to contract within target SLO.
- Block-on-match; documented override (legally permitted only in narrow cases).
- Periodic re-screen of holder set via chain analytics.

## 3. Transaction monitoring

- TM on direct-redeemer activity (mints, burns, fiat flows).
- Chain-analytics rules for secondary-market exposure: mixers, sanctioned protocols, darknet markets, peel chains, structuring.
- Alert dispositioning workflow.
- SAR/STR filing per local FIU.

## 4. Travel Rule

- Travel Rule on transfers to/from VASPs where regimes require.
- IVMS 101 payload via TRP, Sumsub, Notabene, Veriscope, Shyft, or in-house messaging.
- Self-hosted wallet handling: documented attestation procedure; thresholds and additional checks per jurisdiction.

## 5. Blacklist policy

- Documented criteria for blacklisting (court order, sanctions designation, identified illicit activity).
- Governance: who approves a blacklist; independent review.
- Customer-impact handling: communications, recourse process.
- Public transparency where regimes encourage it (incident counts, response times).

## 6. Recordkeeping

- Minimum 5 years (or longer per jurisdiction) for KYB/KYC docs, sanctions hits, TM alerts, SARs, on-chain transaction logs, off-chain orchestration logs.
- Tamper-evident archive (WORM / cryptographic anchoring).

## 7. Compliance organisation

- MLRO / BSA Officer accountable.
- Independent compliance with sufficient seniority and resources.
- Group-wide policies aligned to subsidiaries.
- Compliance training role-based.

## 8. Privacy

- On-chain personal data avoided.
- Off-chain identity store with encryption and access controls.
- DSAR / right-to-erasure: erase off-chain bindings; on-chain history retained as legally mandated.
- DPAs with all processors.

## 9. Controls testing

- 1LoD: front-line redeemer onboarding, screening operations.
- 2LoD: independent compliance testing.
- 3LoD: internal audit cycle annually for AML controls.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
