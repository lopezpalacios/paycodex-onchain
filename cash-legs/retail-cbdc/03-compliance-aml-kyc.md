# 03 — Compliance: AML / CFT / KYC / sanctions

Retail CBDC layers AML/CFT obligations on top of the bank's existing customer base. Tiered privacy designs often allow lighter checks for small-value flows but strict controls remain for higher tiers and cross-border.

## 1. Customer due diligence

- Standard CDD on all distributor customers (extends from existing DDA KYC).
- Wallet binding to the customer record at the scheme level.
- EDD for higher-risk segments (PEPs, high-risk jurisdictions, cross-border activity).
- Periodic refresh per risk tier.

## 2. Sanctions

- Real-time screening:
  - Customer at onboarding and on list updates.
  - Counterparty (where the scheme exposes counterparty identity at the distributor level).
  - Beneficiary references.
- Block-on-match.
- Coordination with the scheme operator on cross-distributor sanctions enforcement.

## 3. Transaction monitoring

- TM rules tuned to CBDC patterns: high-frequency small payments, structuring across the cap, atypical merchant activity.
- Integration with chain analytics where the scheme is on a public or partially public ledger.
- Alert dispositioning workflow.
- SAR/STR filing per local FIU.

## 4. Travel Rule and equivalent

- Where cross-border CBDC interoperability exists, Travel Rule data flows alongside payment.
- IVMS 101 payload via standard rails.

## 5. Tiered privacy compliance

- Implement scheme-mandated tier rules (e.g., small-value payments below a threshold require minimal data; larger require full data).
- Audit trail for tier assignments and overrides.
- Privacy-by-design review.

## 6. Disputes and complaints

- CBDC schemes often *do not* support classic chargeback semantics.
- Refunds are explicit, payer-cooperative, or merchant-initiated.
- Dispute workflow integrated with bank's complaints process.
- FIU / supervisor notifications on suspected fraud.

## 7. Recordkeeping

- Minimum 5 years (or longer per jurisdiction).
- WORM / cryptographic anchoring.

## 8. Compliance organisation

- MLRO / BSA Officer accountable.
- CBDC distribution reflected in AML/CFT risk assessment.
- Group policies aligned across subsidiaries.

## 9. Specific risks

- Account-takeover via mobile-banking compromise leads to CBDC drainage.
- Mule networks abusing tiered privacy thresholds.
- Cross-border AML escalation in interoperability phases.
- Programmable-payment misuse where the scheme allows scripting.

## 10. Privacy / data protection

- DPIA mandatory.
- Data-protection clauses in scheme participation agreement.
- DSAR / right-to-erasure handling integrated.
- DPAs with all processors.

## 11. Controls testing

- 1LoD: front-line ops + system controls.
- 2LoD: independent compliance testing.
- 3LoD: internal audit cycle on CBDC AML controls.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
