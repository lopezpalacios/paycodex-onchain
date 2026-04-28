# 10 — Security and cyber

The CB / FMI operates the platform; the bank protects its participation surface (wallets, keys, integration, connectivity). A wallet-key compromise is the most damaging single-point failure on the participant side.

## 1. Threat model

- Operator key compromise (subscription, redemption, settlement instruction).
- Smart contract template exploit (CB-approved templates; bank cannot fix, but must detect).
- Connectivity attack (mTLS / IPsec disruption, DNS poisoning, BGP hijack).
- Insider misuse of settlement authority.
- Social engineering of key-ceremony participants.
- Cross-border platform: jurisdiction-arbitrage attack patterns.
- STRIDE / PASTA as appropriate.

## 2. Smart contract security

- Bank cannot independently audit CB-approved templates but must:
  - Receive and review CB-provided audit packs.
  - Subscribe to upgrade notifications and re-test in pre-prod.
  - Maintain expected-behaviour invariants in own monitoring.

## 3. Key management

- HSM-backed (FIPS 140-2/3 Level 3+) wallet keys.
- MPC-augmented multi-sig with role separation (subscription, redemption, settlement instruction).
- Quorum participants geographically and organisationally separated.
- Hardware-rooted approval at signer endpoints.
- Documented, witnessed key ceremonies; tamper-evident archive.
- Scheduled rotation + emergency rotation playbook.

## 4. Connectivity security

- mTLS / IPsec connectivity to FMI / CB endpoints.
- Certificate pinning; cert lifecycle management.
- Redundant network paths.
- Monitoring for cert anomalies, BGP changes, DNS anomalies.

## 5. Application and infrastructure security

- Hardened cloud or on-prem baseline.
- Zero-trust networking; mTLS between services.
- Secrets management; least privilege.
- Vulnerability and patch management with SLAs.
- Secure SDLC; SAST / DAST / SCA.
- SBOM produced per release.

## 6. Detection and response

- 24/7 SOC with chain ingestion for the bank's own wallet activity.
- SIEM correlation across DLT events, RTGS events, internal integration logs.
- Pre-authorised pause-on-anomaly path coordinated with FMI.
- Forensic preservation, regulator notification, customer / counterparty communications.

## 7. Resilience

- DORA-aligned operational resilience programme (where in scope).
- TLPT / TIBER-EU / CBEST testing on schedule.
- Tabletop exercises with CB / FMI participation where feasible.

## 8. Privacy and data security

- Encryption at rest and in transit.
- Pseudonymisation in non-prod environments.
- Privacy-by-design review.

## 9. Supply chain security

- Pinned dependencies; reproducible builds.
- Provenance (SLSA / SBOM / sigstore).
- Vendor security assessments (HSM vendor, MPC vendor, connectivity providers).

## 10. Insider risk

- Segregation of duties between developers and signers.
- Mandatory leave; rotation of high-privilege roles.
- Behavioural analytics.
- Whistleblower channel.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`03-compliance-aml-kyc.md`](./03-compliance-aml-kyc.md) · [`04-operational.md`](./04-operational.md) · [`08-governance-controls.md`](./08-governance-controls.md)
