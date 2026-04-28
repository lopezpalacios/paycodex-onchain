# 03 — Compliance: AML / CFT / KYB / KYC / sanctions

A regulated MMF sponsor is an AML-obligated entity. Tokenization concentrates compliance enforcement at the on-chain transfer-restriction layer plus the off-chain investor onboarding desk.

## 1. Investor due diligence

- Full KYB on institutional investors: corporate verification, UBO, licence verification, source of funds.
- KYC on any individual investors where the product permits.
- EDD for higher-risk segments.
- Periodic refresh by risk tier; refresh failure blocks transfers and redemptions.
- Wallet attestation: investor wallets bound to investor identity at the on-chain identity layer.

## 2. Sanctions

- Real-time screening at onboarding and re-screen on list updates.
- Transfer-restriction enforcement on-chain (allowlist + blacklist).
- Block-on-match.
- Periodic re-screen of holder set via chain analytics.

## 3. Transaction monitoring

- TM on subscription, redemption, and transfer activity.
- Chain analytics integration (Chainalysis, Elliptic, TRM).
- Alert dispositioning workflow.
- SAR/STR per local FIU.

## 4. Travel Rule

- Where transfers cross VASP boundaries, Travel Rule data flows alongside transfer.
- IVMS 101 payload via standard rails.

## 5. Transfer restrictions

- Allowlist enforcement at every transfer.
- Jurisdiction rules (no transfers to non-eligible jurisdictions).
- Holding-cap or accreditation rules per scheme.
- Override pathways only with documented justification.

## 6. Recordkeeping

- Minimum 5 years (or longer per jurisdiction).
- WORM / cryptographic anchoring.

## 7. Compliance organisation

- MLRO accountable.
- Independent compliance with adequate resources.
- Group policies aligned across entities.

## 8. Specific risks

- Wallet hijacking leading to unauthorised redemption.
- Allowlist evasion via contract wrappers / proxies.
- Privacy-tech interaction (mixers).
- Cross-border circulation in non-eligible jurisdictions.

## 9. Privacy

- On-chain personal data avoided.
- Off-chain identity store with encryption.
- DSAR / right-to-erasure handled.
- DPAs with all processors.

## 10. Controls testing

- 1LoD: investor onboarding, screening operations.
- 2LoD: independent compliance testing.
- 3LoD: internal audit cycle on AML controls.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
