# 10 — Security and cyber

Stablecoin issuance is a high-value target. Public-chain attack surface is broad: smart contract, bridges, key custody, RPC, frontends, social engineering. Defence-in-depth across all of these is mandatory.

## 1. Threat model

- Smart contract exploit (mint / freeze / blacklist / upgrade).
- Operator key compromise (mint, burn, blacklist, upgrade, pause).
- Validator collusion (limited for Ethereum L1; relevant for L2 sequencers and alt-L1s).
- Bridge attacks (one of the largest historical loss categories in crypto).
- RPC poisoning (incorrect state returned to off-chain orchestrator).
- Frontend / DNS / phishing attacks targeting redeemers.
- Insider mint / unauthorised blacklist removal.
- Social engineering of key-ceremony participants.
- STRIDE / PASTA / LINDDUN as appropriate.

## 2. Smart contract security

- Multi-firm independent audits prior to launch and at every material change.
- Static analysis: Slither, Mythril, Semgrep (custom rules).
- Fuzzing / invariant tests: Foundry, Echidna.
- Formal verification of critical invariants (no unauthorised mint; supply equals reserves at attestation moments; only authorised roles invoke privileged functions; upgrade is timelocked).
- Bug-bounty programme post-launch.

## 3. Key management

- Operator keys (mint, burn, blacklist, pause, upgrade): HSM-backed, MPC-augmented multi-sig with role separation; quorum members geographically and organisationally separated; hardware-rooted approval.
- Documented, witnessed key ceremonies; tamper-evident archives.
- Scheduled rotation + emergency rotation playbook.
- Key recovery (Shamir / MPC re-share) tested.

## 4. Bridge security

- Canonical issuance preferred over wrapped synthetics.
- Bridge contracts independently audited; minimal trust assumptions.
- Attestation oracles for bridged supply; daily reconciliation.
- Bridge-specific incident playbook.

## 5. Application and infrastructure security

- Hardened cloud baseline (CIS / vendor benchmarks).
- Zero-trust networking; mTLS between services.
- Secrets management with rotation and least privilege.
- Vulnerability management with SLAs.
- Secure SDLC: peer review, SAST, DAST, SCA.
- SBOM produced and stored per release.

## 6. RPC and chain access

- Multiple independent RPC providers; cross-validation of state.
- Sign-and-broadcast pipeline does not trust RPC for finality.
- MEV-aware submission for privileged actions (private mempool).

## 7. Frontend / customer-facing security

- Anti-phishing controls (DNSSEC, CAA, SPF/DKIM/DMARC, brand-monitoring).
- Domain protection: registry locks, multi-factor for registrar accounts.
- Sub-resource integrity, content-security policy, secure cookies.
- Clear public-key fingerprints for verification of contract addresses.

## 8. Detection and response

- 24/7 SOC with chain ingestion.
- SIEM correlation across chain, orchestrator, IAM, banking-rail integrations.
- Pre-authorised pause / blacklist invocation paths.
- Forensic preservation, regulator notification, customer communications, remediation.

## 9. Resilience

- DORA-aligned operational resilience programme (where in scope).
- Threat-led penetration testing (TLPT / TIBER-EU / CBEST).
- Tabletop exercises and full DR drills annually.
- Validator failover, RPC failover, custody failover tested.

## 10. Privacy and data security

- Encryption at rest (AES-256) and in transit (TLS 1.3).
- Pseudonymisation in non-prod environments.
- Privacy-by-design review for changes touching customer data.

## 11. Supply chain security

- Pinned dependencies; reproducible builds.
- Provenance (SLSA / SBOM / sigstore).
- Vendor security assessments.
- Quarterly third-party access review.

## 12. Insider risk

- Segregation of duties between developers and signers.
- Mandatory leave; rotation of high-privilege roles.
- Behavioural analytics on privileged access.
- Whistleblower channel.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`03-compliance-aml-kyc.md`](./03-compliance-aml-kyc.md) · [`04-operational.md`](./04-operational.md) · [`08-governance-controls.md`](./08-governance-controls.md)
