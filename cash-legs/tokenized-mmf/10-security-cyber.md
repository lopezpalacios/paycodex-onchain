# 10 — Security and cyber

Tokenized MMF security spans the smart contract, NAV oracle, key custody, fund-admin integration, and investor wallet stack. NAV-oracle compromise is the most distinctive systemic risk relative to other tokenized cash legs.

## 1. Threat model

- Smart contract exploit.
- NAV-oracle compromise (false NAV publication).
- Operator key compromise (mint, burn, NAV-publisher, freeze, upgrade).
- Custodian-side breach.
- Fund-admin integration compromise.
- Identity service breach.
- RPC poisoning.
- Frontend phishing for investor keys.
- Insider mint / unauthorised redemption.
- Social engineering of key-ceremony participants.

## 2. Smart contract security

- Multi-firm independent audits prior to launch and at every material change.
- Static analysis (Slither, Mythril, Semgrep), fuzzing (Foundry, Echidna).
- Formal verification of critical invariants:
  - Supply matches fund register.
  - Only authorised roles invoke privileged functions.
  - NAV update path constrained to oracle role.
  - Upgrade is timelocked.
- Bug-bounty programme post-launch.

## 3. NAV-oracle security

- Multi-source NAV corroboration where the design supports.
- Signed NAV updates with oracle key under HSM custody.
- Stale-NAV detection blocks subscriptions and redemptions.
- NAV-deviation thresholds with automatic pause.

## 4. Key management

- HSM-backed (FIPS 140-2/3 Level 3+) operator keys.
- MPC-augmented multi-sig with role separation.
- Quorum participants geographically and organisationally separated.
- Hardware-rooted approvals.
- Documented, witnessed key ceremonies; tamper-evident archives.
- Scheduled rotation + emergency rotation playbook.

## 5. Investor wallet security

- Default: institutional MPC custody for institutional investors.
- Self-custody: explicit waiver, attestation, hardware-wallet recommendation, recovery procedure.
- Phishing-resistant authentication.

## 6. Application and infrastructure security

- Hardened cloud baseline.
- Zero-trust networking; mTLS between services.
- Secrets management with rotation and least privilege.
- Vulnerability and patch management with SLAs.
- Secure SDLC; SAST / DAST / SCA.
- SBOM produced per release.

## 7. RPC and chain access

- Multiple independent RPC providers; cross-validation of state.
- Sign-and-broadcast pipeline does not trust RPC for finality.
- MEV-aware submission for privileged actions.

## 8. Detection and response

- 24/7 SOC with chain ingestion.
- SIEM correlation across chain, orchestrator, fund-admin events, custodian events.
- Pre-authorised pause / freeze paths.
- Forensic preservation, regulator notification, investor communications, remediation.

## 9. Resilience

- DORA-aligned operational resilience programme (where in scope).
- TLPT / TIBER-EU / CBEST testing on schedule.
- Tabletop exercises and full DR drills annually.

## 10. Privacy and data security

- Encryption at rest and in transit.
- Pseudonymisation in non-prod environments.
- Privacy-by-design review.

## 11. Supply chain security

- Pinned dependencies; reproducible builds.
- Provenance (SLSA / SBOM / sigstore).
- Vendor security assessments.

## 12. Insider risk

- Segregation of duties.
- Mandatory leave; rotation of high-privilege roles.
- Behavioural analytics on privileged access.
- Whistleblower channel.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`03-compliance-aml-kyc.md`](./03-compliance-aml-kyc.md) · [`04-operational.md`](./04-operational.md) · [`08-governance-controls.md`](./08-governance-controls.md)
