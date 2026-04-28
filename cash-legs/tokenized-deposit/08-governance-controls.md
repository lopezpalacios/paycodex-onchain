# 08 — Governance, controls, internal audit

Governance is the layer supervisors look at first: who decides, who approves, who tests, who reports. Tokenized deposits introduce novel decisions (smart contract changes, key ceremonies, oracle reliance) that must fit cleanly into the bank's existing governance machinery.

## 1. Board and committee oversight

- Board approval of the tokenized deposit programme strategy and risk appetite.
- Risk Committee oversight of risk appetite, KRIs, incidents.
- Audit Committee oversight of internal audit coverage and external audit reliance.
- Tech / IT Committee (or equivalent) for ICT risk, DORA, change governance.
- Periodic reporting cadence: monthly to executive committee; quarterly to board committees.

## 2. Three lines of defence

- **1LoD — Business + Technology + Operations**: own the controls, run the platform, execute reconciliations, manage incidents.
- **2LoD — Risk + Compliance**: independent oversight, control testing, KRI monitoring, policy ownership.
- **3LoD — Internal Audit**: periodic independent assurance, including thematic reviews.

## 3. Roles and responsibilities (RACI)

- **Product owner**: strategy, customer journey, P&L.
- **CTO / Head of Engineering**: platform reliability, change control, security baseline.
- **CISO**: cyber, key management, vulnerability management, red-team programme.
- **CRO**: risk framework, KRIs, stress testing, ICAAP/ILAAP integration.
- **CCO / MLRO**: AML/CFT, sanctions, Travel Rule, regulatory engagement on conduct.
- **General Counsel**: legal classification, contracts, supervisor liaison.
- **CFO / Head of Finance**: accounting policy, regulatory reporting, capital impact.
- **Head of Treasury**: liquidity treatment, funding-cost transfer pricing.
- **Head of Operations**: day-to-day ops, incident commander.
- Documented decision rights matrix (e.g., contract upgrade requires CTO + CISO + CRO + CCO + Legal sign-off).

## 4. Policy framework

- Tokenized deposit product policy.
- Smart contract change policy.
- Key management and ceremony policy.
- Allowlist enrolment and re-attestation policy.
- Sanctions policy (existing, updated for on-chain context).
- AML/CFT policy (existing, updated).
- Information security policy (existing, updated).
- Third-party risk policy (existing, updated).
- Incident response policy (existing, updated).
- Each policy reviewed at least annually.

## 5. Standards and frameworks alignment

- COBIT or equivalent IT governance.
- ISO 27001, ISO 22301 (BCM), ISO 31000 (risk).
- NIST CSF 2.0; for US banks, FFIEC handbooks.
- DORA (EU) for ICT risk, third-party, incident reporting, TLPT.
- SOX / SOC 1 / SOC 2 for financial reporting and service-org controls.
- Basel Principles for Operational Resilience.

## 6. Internal audit programme

- Tokenized deposit added to the audit universe.
- Annual coverage of: smart contract change governance, key ceremonies, AML controls, reconciliation, incident response, third-party management, regulatory reporting.
- Thematic reviews: e.g., end-to-end mint flow, end-to-end redemption flow, force-transfer governance.
- Independent re-performance of reconciliation samples.

## 7. External audit and assurance

- Statutory financial audit covers the sub-ledger, GL impact, accounting policy.
- ISAE 3402 / SOC 1 / SOC 2 over service-organization aspects (custody, identity, orchestration).
- Smart contract audits (multiple firms, pre-launch and at every material change).
- Penetration tests including TLPT / red-team.
- Proof-of-reserves / proof-of-liability attestations where applicable (especially Model C).

## 8. Issue and incident management

- Centralised issue log with risk rating, owner, due date, evidence of closure.
- Escalation thresholds defined.
- Lessons-learned process feeds policy updates and control redesign.

## 9. Training and culture

- Role-based training: developers, ops, compliance, customer support.
- Mandatory annual refresh; new-joiner module within 30 days.
- Culture indicators: speak-up, near-miss reporting volume, control-issue self-disclosure rate.

## 10. Decision logs

- Architectural Decision Records (ADRs) — see [`../../decisions/`](../../decisions/).
- Smart contract upgrade decisions logged with rationale, audit reports, sign-offs.
- Key ceremony minutes, witnessed and stored in tamper-evident archive.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`04-operational.md`](./04-operational.md) · [`06-risk-capital.md`](./06-risk-capital.md) · [`10-security-cyber.md`](./10-security-cyber.md)
