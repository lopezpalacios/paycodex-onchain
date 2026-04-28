# 10 — Security and cyber

Security is the highest-leverage control surface for a tokenized deposit. A single key compromise or smart-contract exploit can produce supply drift, fraudulent mint, or systemic loss in minutes.

## 1. Threat model

- Document threats spanning: smart contract exploit, mint operator key compromise, freeze operator misuse, insider mint, validator collusion (permissioned chain), bridge attack, identity service compromise, RPC node poisoning, frontend phishing, social engineering targeting key-ceremony participants.
- STRIDE / PASTA / LINDDUN as appropriate per domain.
- Threat model versioned and reviewed at every material change.

## 2. Smart contract security

- Multi-firm independent audits prior to launch and at every material change.
- Static analysis: Slither, Mythril, Semgrep with custom rules.
- Symbolic execution / fuzzing: Foundry invariant tests, Echidna.
- Formal verification of critical invariants:
  - On-chain `totalSupply()` matches sub-ledger liability sub-account total.
  - Only authorised roles can mint/burn/freeze/upgrade.
  - Upgrade is timelocked; pause guardian is independent.
  - Force-transfer requires two-of-N quorum.
- Bug-bounty programme post-launch with material rewards.

## 3. Key management

- Bank operator keys (mint, burn, freeze, upgrade, pause):
  - HSM-backed (FIPS 140-2/3 Level 3+).
  - MPC-augmented (e.g., GG18/GG20-style) where applicable.
  - Multi-sig with role separation: mint quorum ≠ freeze quorum ≠ upgrade quorum.
  - Quorum participants geographically and organisationally separated.
  - Hardware-rooted approval (Yubikey / hardware wallet) at signer endpoints.
- Key ceremonies: scripted, witnessed, video-recorded, tamper-evident archive of artefacts.
- Rotation: scheduled (annually at minimum) plus emergency rotation playbook.
- Recovery: Shamir / MPC re-share procedure, tested.

## 4. Customer wallet security

- Default: bank-custodied via institutional MPC custody with audit trail.
- Self-custody (where permitted): explicit waiver, attested device, hardware-wallet recommendation, recovery procedure, documented risk allocation.
- Phishing-resistant authentication for self-service flows.
- Anti-malware monitoring on customer-facing channels.

## 5. Application and infrastructure security

- Hardened cloud baseline (CIS / cloud-vendor benchmarks).
- Zero-trust networking; default-deny; mTLS between services.
- Secrets management with rotation and least-privilege access.
- Vulnerability management with SLAs by severity.
- Patch management with documented exceptions.
- Secure SDLC: peer review, SAST, DAST, SCA, license compliance.
- SBOM produced and stored for every release.

## 6. Identity service security

- The identity / allowlist service is on the critical path; treat as Tier-0.
- Strict change control for attestations.
- Tamper-evident logs for every attestation issuance and revocation.
- Periodic re-attestation; expiry must propagate atomically.

## 7. RPC and chain access

- Owned validator nodes for permissioned chain; diverse network paths.
- For public chain: redundant RPC providers; monitor for view-mismatch (poisoned RPC returning false state).
- Sign-and-broadcast pipeline does not trust RPC for finality; validates against multiple sources.

## 8. Detection, response, recovery

- 24/7 SOC with chain-event ingestion.
- SIEM correlation between chain events, orchestrator logs, IAM events, payment-rail events.
- Playbooks for: supply-drift, unauthorised mint, key-compromise suspicion, identity service breach, bridge incident.
- Pre-authorised pause guardian invocation path with sub-minute target.
- Post-incident: forensic preservation, regulator notification, customer communication, remediation, lessons-learned.

## 9. Resilience and disaster recovery

- DORA-aligned operational resilience programme (where in scope).
- Threat-led penetration testing (TLPT / TIBER-EU / CBEST) on schedule.
- Tabletop exercises and full DR drills annually.
- Validator failover, RPC failover, custody failover all tested.

## 10. Privacy and data security

- Encryption at rest (AES-256) and in transit (TLS 1.3).
- Tokenization / pseudonymisation of PII in non-prod environments.
- Privacy-by-design review for every change touching customer data.
- DSAR / right-to-erasure workflow integrated.

## 11. Supply chain security

- Pinned dependencies; reproducible builds.
- Provenance (SLSA / SBOM / sigstore) on artefacts.
- Vendor security assessments (SOC 2 / ISO 27001) collected and reviewed.
- Third-party access reviewed quarterly.

## 12. Insider risk

- Segregation of duties between developers and signers.
- Mandatory leave; rotation of high-privilege roles.
- Behavioural analytics on privileged access.
- Whistleblower channel and protection.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`03-compliance-aml-kyc.md`](./03-compliance-aml-kyc.md) · [`04-operational.md`](./04-operational.md) · [`08-governance-controls.md`](./08-governance-controls.md)
