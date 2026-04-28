# 03 — Compliance: AML / CFT / KYC / sanctions

The compliance perimeter for a tokenized deposit is identical to a regular deposit, plus the chain-specific obligations introduced by Travel Rule and on-chain identity. Nothing about tokenization reduces the obligations; it changes *where* and *how* they are enforced.

## 1. Customer due diligence (KYC / KYB)

- Standard CDD on all deposit customers prior to wallet attestation.
- Enhanced due diligence (EDD) for higher-risk segments: PEPs, high-risk jurisdictions, high-volume corporates, complex ownership structures.
- Beneficial-ownership verification per FATF Recommendation 10 / 24 / 25.
- Periodic refresh based on risk tier; refresh failure must block transfers (allowlist downgrade).
- Wallet-to-customer binding: each wallet linked to exactly one customer record at any time. Re-binding requires re-attestation.

## 2. Sanctions screening

- Real-time screening of:
  - Customer identity at onboarding and re-screen on schedule + on list updates.
  - Counterparty wallet addresses against blockchain-sanctions feeds (OFAC SDN, EU consolidated, UN, UK OFSI, local lists).
  - Transaction metadata (memo fields, beneficiary references).
- Block-on-match policy with dual-approval override pathway only where legally permitted.
- Sanctions list cache freshness SLO; failover when feed is down (default: deny new transfers, allow redemptions, escalate).

## 3. Transaction monitoring (TM)

- TM rules cover both on-chain and off-chain legs:
  - Velocity, structuring, round-amount patterns, dormant-account reactivation.
  - Wallet clustering / chain-analytics integration (Chainalysis, Elliptic, TRM, Crystal).
  - Mixers, peel chains, sanctioned protocols, darknet markets.
- Alert triage workflow with documented dispositioning.
- SAR/STR filing per local FIU rules (FinCEN, NCA, MROS, AUSTRAC, etc.).

## 4. Travel Rule

- For transfers ≥ jurisdictional threshold (FATF: USD/EUR 1,000; EU TFR: EUR 0 between VASPs):
  - Originator data: name, account number / wallet, address (or ID) per IVMS 101.
  - Beneficiary data: name, account number / wallet.
- Delivery rail: TRP, Sumsub Travel Rule, Notabene, Shyft, Veriscope, or in-house messaging.
- Beneficiary VASP / counterparty bank validation before transfer release where required.
- Self-hosted wallet handling: documented attestation procedure; thresholds and additional checks.

## 5. Recordkeeping

- Minimum 5 years (or longer per jurisdiction) for:
  - CDD docs, sanctions screening hits, TM alerts and dispositions, SARs.
  - On-chain transaction logs and the corresponding off-chain orchestration logs.
- Tamper-evident archive (WORM storage / cryptographic anchoring).

## 6. Compliance organisation

- MLRO / BSA Officer accountable.
- Independent compliance function with sufficient seniority and resources.
- Group-wide policies aligned to local subsidiaries.
- Compliance training for all staff with role-based depth.

## 7. Risk-based approach

- Documented AML/CFT risk assessment specific to the tokenized deposit channel: customer risk, geographic risk, product risk, delivery-channel risk, technology risk.
- Risk appetite statement and KRIs reported to the board.

## 8. Specific tokenized-deposit risks

- **Wallet hijacking** — customer key compromise leads to unauthorized transfer. Mitigation: bank-custodied wallets default; self-custody requires explicit waiver and additional controls.
- **Allowlist evasion via contract wrappers** — addresses gain access via proxies. Mitigation: identity check on caller AND on `tx.origin`-equivalent intent; restrict contract counterparties.
- **Cross-chain laundering via bridges** — funds bridged to public chains for obfuscation. Mitigation: bridges restricted, post-bridge counterparty re-screen.
- **Privacy-tech interaction** — customer interacts with privacy pools, mixers. Mitigation: chain-analytics rules, pre-emptive freeze where evidence supports.

## 9. Privacy / data protection interplay

- AML obligations vs. GDPR / local privacy: documented lawful basis (legal obligation); minimisation; on-chain personal-data avoidance.
- Right-to-erasure handling: erase off-chain identity bindings; on-chain history retained as legally mandated business record under appropriate exemption.

## 10. Controls testing

- 1LoD: front-line transaction reviewers + system controls.
- 2LoD: Compliance independent testing and quality assurance.
- 3LoD: Internal Audit cycle covering tokenized-deposit AML controls at least annually.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`09-data-reporting.md`](./09-data-reporting.md) · [`10-security-cyber.md`](./10-security-cyber.md)
