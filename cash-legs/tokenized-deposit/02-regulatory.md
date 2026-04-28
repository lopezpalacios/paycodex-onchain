# 02 — Regulatory requirements

A tokenized deposit programme is generally not a new licence; it is a new *channel* under the existing banking licence. The bar is supervisory non-objection plus full alignment with the jurisdiction's DLT/crypto regime.

## 1. Authorization base

- Existing banking licence in the jurisdiction(s) of issuance.
- Confirmation from the prudential supervisor that issuing tokenized deposits falls within the bank's authorised activities.
- Where the token is offered cross-border, mapping of host-state rules and any required passporting / branch authorization.

## 2. Jurisdiction-specific regimes

### European Union
- **MiCA** — generally a tokenized deposit by a credit institution is *out of scope* of MiCA (Art. 2(4) excludes deposits as defined under DGSD). However:
  - The bank should explicitly document the legal classification (deposit vs. EMT vs. ART) and obtain supervisory confirmation.
  - If the token is structured to look like an EMT (e.g., issued by a non-bank subsidiary), MiCA EMT rules apply.
- **DGSD (Deposit Guarantee Schemes Directive)** — coverage applies to the underlying deposit; ensure the token is recognised by the national DGS as the same protected deposit.
- **DORA** — operational resilience, ICT risk, third-party risk register, threat-led penetration testing (TLPT).
- **PSD2 / PSD3 (proposed)** — payment service framing where the token is used in payments.
- **AMLD (5th/6th)** + **Travel Rule (TFR)** — applies fully to on-chain transfers.
- **GDPR** — pseudonymity is not anonymity; on-chain addresses linked to identity are personal data. Right-to-erasure tension with immutable ledgers must be addressed (typically via off-chain identity store + on-chain pointers).

### Switzerland
- **DLT Act** (in force since 2021) — explicit recognition of ledger-based securities and DLT trading facilities.
- **FINMA** banking licence; FINMA stablecoin/tokenized-deposit guidance.
- **AMLA** + **AMLO-FINMA** for AML/CFT; Travel Rule.

### United Kingdom
- **PRA / FCA** dual regulation; PRA non-objection for the prudential angle.
- **FMI Sandbox / Digital Securities Sandbox** for live experimentation.
- **MLR 2017** for AML/CFT; FCA cryptoasset registration where applicable.

### United States
- **OCC / Fed / FDIC / state regulator** alignment depending on charter.
- **OCC interpretive letters** 1170, 1172, 1174 (and their successors / clarifications) on permissible blockchain activity for national banks.
- **NYDFS** for state-chartered banks in NY; BitLicence framework for non-bank actors (informative).
- **FinCEN** AML/CFT, BSA, Travel Rule.
- **OFAC** sanctions screening and SDN list enforcement.

### Singapore
- **MAS** under the Banking Act + Payment Services Act.
- **Project Guardian / Project Orchid** sandboxes.
- **MAS Notice PSN02** for AML/CFT in DPT.

### Hong Kong
- **HKMA** under Banking Ordinance; HKMA's Stablecoin Ordinance is informative (different regime, but similar control expectations).

### UAE / DIFC / ADGM
- **CBUAE / DFSA / FSRA** depending on free zone; specific DLT frameworks per regulator.

### Brazil, Japan, Korea, Australia
- BCB, FSA Japan, FSC Korea, APRA — each has its own DLT/crypto guidance; mapping required.

## 3. Supervisory engagement

- Pre-launch dialogue with home and host supervisors.
- Submission of: target operating model, risk assessment, ICAAP/ILAAP impact, ICT/DORA package, AML/CFT framework, governance memo, exit/wind-down plan.
- Often a formal non-objection letter or category-specific authorization.
- Ongoing supervisory reporting cadence.

## 4. Cross-border considerations

- Where the token is transferable to wallets in other jurisdictions, a host-state rules matrix must define:
  - Whether the token can be marketed / offered there.
  - Whether transfers to/from that jurisdiction are restricted by the bank's allowlist.
  - Local AML/CFT and tax-reporting obligations triggered.
- Sanctions: comprehensive country/sector screening at allowlist enrolment + per-transfer.

## 5. Consumer / investor protection

- Disclosures: token T&Cs, risk warnings, redemption rights, scenarios under bank resolution.
- Fair-treatment expectations: parity with non-tokenized deposit holders in liquidation.
- Complaints handling integrated with the bank's standard process.

## 6. Resolution and recovery

- Tokenized deposits must fit within the bank's existing recovery and resolution plan (RRP).
- Resolvability: how does a bail-in / transfer of liabilities work when the deposit is a tokenized claim? Documented playbook required.
- Continuity-of-access during resolution: customer can still redeem or have token re-pointed to acquirer.

## 7. Tax

- Withholding on interest (if interest-bearing token).
- VAT/GST on fees.
- Information reporting (CRS, FATCA, DAC8 for the EU).
- Capital-gains characterisation for holders (typically not, because it's a deposit; but document it).

## Cross-links

[`./README.md`](./README.md) · [`03-compliance-aml-kyc.md`](./03-compliance-aml-kyc.md) · [`05-legal-contractual.md`](./05-legal-contractual.md) · [`06-risk-capital.md`](./06-risk-capital.md) · [`../../compliance/mica-eu.md`](../../compliance/mica-eu.md) · [`../../compliance/finma-dlt-act.md`](../../compliance/finma-dlt-act.md) · [`../../compliance/basel-iii-crypto.md`](../../compliance/basel-iii-crypto.md)
