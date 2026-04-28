# 10 — Security and cyber

Retail CBDC distribution multiplies attack surface across millions of customer mobile devices. Account-takeover and social-engineering fraud dominate the loss tail, with scheme-side breaches as the systemic-risk scenario.

## 1. Threat model

- Account-takeover via mobile-banking compromise.
- SIM-swap and social engineering of customers.
- Mobile-app exploitation.
- Phishing and brand impersonation.
- Mass mule networks abusing tiered-privacy thresholds.
- Distributor-side integration compromise.
- Scheme-side breach (rare but high-impact).
- STRIDE / PASTA / LINDDUN as appropriate.

## 2. Wallet and customer-device security

- Strong authentication: FIDO2 / WebAuthn, biometric, device-bound keys.
- Anti-malware monitoring on customer-facing channels.
- Tamper-detection on mobile app; app-attestation.
- Phishing-resistant authentication for sensitive flows.
- SIM-swap detection where mobile-network APIs allow.

## 3. Infrastructure security

- Hardened cloud baseline (CIS / vendor benchmarks).
- Zero-trust networking; mTLS between services.
- Secrets management with rotation and least privilege.
- Vulnerability and patch management with SLAs.
- Secure SDLC; SAST / DAST / SCA.
- SBOM produced per release.

## 4. Connectivity security

- mTLS / IPsec to scheme operator endpoints.
- Certificate pinning; cert lifecycle management.
- Redundant network paths.

## 5. Fraud detection and response

- Real-time fraud platform integrated with CBDC events.
- Behavioural analytics on customer activity.
- Velocity rules tuned to CBDC patterns.
- Account-takeover playbook with pre-authorised freeze paths.

## 6. Customer-facing security

- DNSSEC, CAA, SPF/DKIM/DMARC, brand monitoring.
- Domain registry locks and multi-factor for registrar accounts.
- App stores: enrollment integrity, anti-clone monitoring.
- Public communications about phishing patterns.

## 7. Detection and response

- 24/7 SOC with CBDC event ingestion.
- SIEM correlation across scheme events, customer-device events, banking-app events.
- Pre-authorised freeze paths.
- Forensic preservation, regulator notification, customer communications, remediation.

## 8. Resilience

- DORA-aligned operational resilience programme.
- TLPT / TIBER-EU / CBEST testing on schedule.
- Tabletop exercises and full DR drills annually.

## 9. Privacy and data security

- Encryption at rest (AES-256) and in transit (TLS 1.3).
- Pseudonymisation in non-prod environments.
- Privacy-by-design review for changes touching customer data.
- DPIA mandatory.

## 10. Supply chain security

- Pinned dependencies; reproducible builds.
- Provenance (SLSA / SBOM / sigstore).
- Vendor security assessments.
- Mobile-app vendor controls.

## 11. Insider risk

- Segregation of duties.
- Mandatory leave; rotation of high-privilege roles.
- Behavioural analytics on privileged access.
- Whistleblower channel.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`03-compliance-aml-kyc.md`](./03-compliance-aml-kyc.md) · [`04-operational.md`](./04-operational.md) · [`08-governance-controls.md`](./08-governance-controls.md)
