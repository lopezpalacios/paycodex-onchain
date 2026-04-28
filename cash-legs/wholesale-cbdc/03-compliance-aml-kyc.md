# 03 — Compliance: AML / CFT / sanctions

Wholesale CBDC has no retail customer leg, but every settlement on the platform reflects an underlying customer transaction or interbank flow that *did* originate from a customer. AML/CFT obligations follow the underlying transaction, not the wCBDC settlement leg per se.

## 1. Counterparty due diligence

- KYC / KYB on every counterparty bank or FMI participant (typically already established under correspondent-banking arrangements).
- Periodic review of counterparty risk; FATF-style country-risk overlays.
- For multi-CBDC platforms: enhanced due diligence on cross-jurisdiction counterparties.

## 2. Sanctions

- Pre-trade and pre-settlement sanctions screening of:
  - Counterparty institution.
  - Underlying customer (where the wCBDC settlement is for a customer-initiated payment).
  - Beneficiary references (memo fields, end-to-end IDs).
- Real-time list updates (OFAC, EU consolidated, UN, UK OFSI, local).
- Block-on-match.

## 3. Transaction monitoring

- TM on flows passing through wCBDC settlement, integrated with the bank's enterprise-wide TM.
- Velocity, structuring, unusual-counterparty patterns.
- SAR/STR filing per local FIU.

## 4. Travel Rule

- For underlying customer transactions, Travel Rule applies between participating banks.
- IVMS 101 payload via the bank's standard correspondent / Travel Rule infrastructure.
- Cross-border platform: ensure Travel Rule data flows alongside the wCBDC leg.

## 5. Recordkeeping

- Minimum 5 years (or longer) for: counterparty due diligence, sanctions hits, TM alerts, SARs, on-chain settlement logs.
- Tamper-evident archive.

## 6. Compliance organisation

- MLRO / BSA Officer accountable.
- Wholesale CBDC participation reflected in AML/CFT risk assessment.
- Group-wide policies aligned to subsidiary participants.

## 7. Specific risk areas

- Cross-border AML risk on multi-CBDC platforms (jurisdictional arbitrage).
- Programmable-payment misuse: smart contracts must not enable transfers that bypass screening.
- Identity drift between counterparty institution and underlying customer.

## 8. Privacy

- On-chain personal data avoided.
- Off-chain Travel Rule data handled per privacy regime.
- DSAR coverage for underlying customer data even where settlement leg is on-chain.

## 9. Controls testing

- 1LoD: settlement and screening operations.
- 2LoD: independent compliance testing.
- 3LoD: internal audit cycle on wCBDC AML controls.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`10-security-cyber.md`](./10-security-cyber.md)
