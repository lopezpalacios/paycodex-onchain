# 02 — Regulatory requirements

A stablecoin issuer must hold an authorisation under the relevant jurisdiction's e-money / payments / banking framework. Tokenization is not an exemption from authorisation; it is the form factor of an authorised liability.

## 1. Authorization base by jurisdiction

### European Union — MiCA
- **EMT (e-money token)** — issued by a credit institution or authorised EMI.
- Reserve requirements: 1:1 segregated, HQLA composition, daily reconciliation, monthly disclosures.
- Redemption-at-par on demand; no fees on redemption (limited exceptions).
- White paper notification to the home supervisor; marketing rules; complaints handling.
- Significant-EMT thresholds (Art. 43–58) trigger heavier capital, governance, interoperability, and EBA oversight.
- **ART (asset-referenced token)** — heavier authorisation, similar reserve and disclosure regime.
- Cross-border passporting within EEA available for authorised issuers.

### United States
- Federal payment-stablecoin frameworks (confirm operative act at issuance: GENIUS, Clarity, etc.) — federal vs. state pathway matters for activity scope.
- State trust charters: NY DFS limited-purpose trust (Paxos, Circle's New York presence) is a well-trodden path for major USD stables.
- FinCEN MSB registration; OFAC compliance; state money-transmitter licences where applicable.
- SEC perimeter: avoid securities-style features (yield, profit-sharing) absent securities-law compliance.

### United Kingdom
- FCA cryptoasset registration; PRA / BoE supervisory expectations for systemic payment stablecoins.
- HMT / FSMA stablecoin regime (as it phases in) — confirm at issuance.
- Sandboxes: Digital Securities Sandbox / FCA sandbox for live experimentation.

### Singapore — MAS
- MAS Stablecoin Regulatory Framework (single-currency stablecoins in SGD or G10).
- Authorisation, reserve, capital, audit, redemption, and disclosure requirements.

### Hong Kong — HKMA
- HKMA Stablecoin Ordinance — authorisation and supervision regime for fiat-referenced stablecoins (active phase-in 2025+).

### Switzerland — FINMA
- Bank Banking Act framework for bank-issued EMT-equivalents.
- FinIA / CISA implications for fund-style structures.
- DLT Act underpinning ledger-based instruments.

### Other jurisdictions
- Bermuda DABA, BVI VASP regime, UAE (DFSA / FSRA / VARA), Brazil BCB, Japan FSA, Korea FSC, Australia APRA — map per launch market.

## 2. Reserve regime

- Segregation (bankruptcy-remote) at custodian banks.
- HQLA composition: cash at central banks (where allowed), short-dated government securities, repo against HQLA — per regime rules.
- Independent attestation monthly; full audit annually.
- Daily reconciliation of on-chain supply vs reserves.
- Concentration limits per counterparty bank.

## 3. Redemption regime

- Redemption-at-par on demand for direct redeemers.
- Documented redemption SLAs.
- Fees: limited per regime (MiCA: no fees except in defined cases).
- Operational continuity of redemption during stress (banking-rail outage, etc.).

## 4. Cross-border

- Where the token circulates outside the home jurisdiction, host-state rules matrix.
- EU MiCA passporting; US state-by-state assessment; UK, SG, HK overseas-issuer regimes.
- Sanctions: comprehensive country/sector screening at direct-redeemer onboarding and on every transfer counterparty (as applicable).

## 5. Consumer protection and disclosures

- White paper or equivalent: token mechanics, reserves, redemption rights, risks.
- Periodic reserve disclosures.
- Complaints and dispute-resolution channel.
- Marketing and promotional rules per jurisdiction.

## 6. Significant / systemic designation

- MiCA significant-EMT, BoE systemic stablecoin, MAS / HKMA equivalent — confirm thresholds and prepare for elevated obligations (higher capital, additional reporting, more intrusive supervision).
- Operational and financial-resilience uplift planned in advance.

## 7. Resolution and recovery

- Wind-down plan: orderly run-off where the issuer ceases.
- Reserve segregation ensures holders receive par on resolution.
- Continuity of access during wind-down: redemption window, rail continuity, communications.

## 8. Tax

- Issuer-level tax treatment of reserves and issuance/redemption flows.
- VAT / GST on fees where applicable.
- Information reporting (CRS, FATCA, DAC8) where relevant.
- Holder-side tax: typically not the issuer's burden, but document it for direct-redeemer institutional holders.

## Cross-links

[`./README.md`](./README.md) · [`05-legal-contractual.md`](./05-legal-contractual.md) · [`06-risk-capital.md`](./06-risk-capital.md) · [`07-reserves-and-banking.md`](./07-reserves-and-banking.md) · [`../../compliance/mica-eu.md`](../../compliance/mica-eu.md)
