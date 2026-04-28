# Wholesale CBDC (token form)

A wholesale central bank digital currency is central bank money issued natively on a distributed ledger and made available exclusively to authorised financial institutions for interbank and FMI settlement. The legal claim is identical to a reserve held at the central bank: a direct liability of the central bank, the highest tier of money in the system. The novelty is form: a programmable, on-chain bearer record rather than a balance held in the central bank's RTGS.

Wholesale CBDC is *not* retail money. End-customers do not hold or transact in it. The audience is banks, payment system operators, and (in some designs) tokenized securities settlement systems.

## Why wholesale CBDC exists

1. Credit-risk-free settlement asset for tokenized securities (DvP cash leg) when the rest of the trade is on DLT.
2. Atomic, programmable interbank settlement with finality at central bank money level.
3. 24/7/365 settlement extending RTGS hours.
4. Cross-border interoperability (multi-CBDC platforms — mBridge, Agorá, Mariana).
5. Preserves central bank settlement-asset role in a tokenised-asset world (avoiding the displacement of CB money by stablecoins and tokenized deposits in interbank settlement).

## Programmes (live and active)

| Programme | Sponsor(s) | Currency | Status | Notes |
|---|---|---|---|---|
| Project Helvetia (III) | SNB + SIX (SDX) | CHF | Live since 2023, extended through 2027 | Real wholesale CBDC for DvP on SDX; multiple banks participating |
| Project Mariana | SNB + BdF + MAS + BIS Innovation Hub | CHF / EUR / SGD | PoC complete | Multi-CBDC FX with AMM-style atomic swap |
| Project Jura | SNB + BdF + BIS | CHF / EUR | PoC complete | Cross-border tokenized commercial paper |
| Project Agorá | BIS + 7 CBs (Fed NY, ECB, BoE, BoJ, BoK, BdM, BdF, SNB) | Multi | In progress | Tokenized correspondent banking with wCBDC |
| mBridge | HKMA + BoT + UAE CB + PBoC + Saudi CB | HKD / THB / AED / CNY / SAR | Multi-jurisdictional | Cross-border wholesale settlement |
| Project Cedar/Ubin/Dunbar | NY Fed / MAS / BIS | Various | PoC | Cross-border foundations |
| Project Pine | NY Fed | USD | PoC | Smart-contract toolkit for monetary policy ops |

## Wholesale CBDC vs. adjacent instruments

| Dimension | Wholesale CBDC | Tokenized deposit | Stablecoin | Tokenized MMF |
|---|---|---|---|---|
| Issuer | Central bank | Licensed bank | EMI / regulated issuer | Asset manager |
| Money type | Central bank money (highest tier) | Commercial bank money | E-money | Fund unit |
| Credit risk to holder | None | Bank credit risk | Issuer credit risk | Fund / underlying credit risk |
| Holder universe | Authorised banks + select FMIs | KYC'd customers of issuer | Broadly open | KYC'd investors |
| Yield | Possibly remunerated (policy-rate aligned) | Possibly | Generally none | Yes |
| Chain | Permissioned (CB-operated or CB-supervised) | Permissioned | Public | Permissioned / hybrid |
| Programmability | High | High | High | Medium |
| Settlement role | Highest-tier interbank settlement asset | Acceptable for many cash legs | Acceptable for non-CB-money settings | Cash-equivalent only |

## Operating models

### Model H — Helvetia-style integrated DLT-FMI settlement
- Wholesale CBDC issued onto an FMI's DLT (e.g., SIX SDX).
- Banks subscribe by debiting RTGS reserve and crediting their on-chain wallet on the DLT.
- DvP atomic with tokenized securities on the same DLT.
- Redemption to RTGS reserve on demand.

### Model A — Agorá-style unified ledger
- Tokenised reserves + tokenised deposits on a unified ledger operated by central banks and commercial banks jointly.
- Cross-border correspondent flows tokenised end-to-end.

### Model B — mBridge-style multi-CBDC platform
- Multiple central banks issue their wCBDC onto a shared platform.
- Cross-border atomic FX / payments between banks of different jurisdictions.

### Model M — Mariana-style automated FX
- Central banks issue wCBDC; AMM-style smart contract enables atomic FX between currencies.

## Lifecycle (bank participant view)

1. **Authorization** — central bank admits the bank as participant; legal documentation signed.
2. **Onboarding** — IT integration, key custody set-up, allowlist enrolment on the DLT.
3. **Subscription** — bank debits RTGS reserve at the central bank; central bank issues wCBDC tokens to the bank's on-chain wallet.
4. **Use** — settlement of DvP, PvP, and interbank payments on the DLT; programmable payments via smart contracts approved by the central bank.
5. **Redemption** — bank submits on-chain burn / redemption request; central bank credits RTGS reserve.
6. **Reconciliation** — continuous reconciliation between wCBDC holdings and the bank's books; central bank publishes daily totals.
7. **Lifecycle events** — key rotation, contract upgrades (CB-controlled), parameter changes, end-of-day cycles.

## Reference architecture (bank side)

```
+-------------------+      +------------------------+      +---------------------+
|  RTGS reserve     |<---->|  CB-DLT bridge /       |<---->|  Wholesale CBDC     |
|  (e.g., SIC, T2)  |      |  subscription rail     |      |  on permissioned DLT|
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  Bank treasury    |      |  Settlement engine     |      |  Tokenized assets   |
|  / liquidity mgmt |      |  (DvP / PvP)           |      |  (SDX / equivalent) |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  Reconciliation   |      |  Compliance / audit    |      |  HSM / MPC keys     |
+-------------------+      +------------------------+      +---------------------+
```

## Use cases

- Atomic DvP for tokenised bond / equity / structured-product issuance (Helvetia model).
- Cross-border PvP between banks of different jurisdictions (mBridge / Mariana).
- Programmable conditional settlement (e.g., margin call, corporate action payouts).
- Intraday liquidity management with finality at CB money tier.
- Tokenised correspondent banking (Agorá).

## Risks

- **Operational** — DLT outage, key compromise, integration failure with RTGS.
- **Cyber** — although the CB operates the chain, banks' wallet / custody is their responsibility.
- **Concentration** — heavy reliance on a single FMI / DLT operator.
- **Liquidity** — DLT operating hours mismatch with RTGS hours; intraday liquidity stress.
- **Programmability misuse** — smart contract bug in a CB-approved contract template.
- **Cross-border regulatory** — multi-CBDC platforms raise host-state and capital-flow questions.

## Onboarding requirements (linked)

The full set of requirements for a bank to participate in a wholesale CBDC programme is broken out in the [`wholesale-cbdc/`](./wholesale-cbdc/README.md) subdirectory:

- [Technical requirements](./wholesale-cbdc/01-technical.md)
- [Regulatory requirements](./wholesale-cbdc/02-regulatory.md)
- [Compliance, AML / CFT, sanctions](./wholesale-cbdc/03-compliance-aml-kyc.md)
- [Operational requirements](./wholesale-cbdc/04-operational.md)
- [Legal and contractual requirements](./wholesale-cbdc/05-legal-contractual.md)
- [Risk management and capital](./wholesale-cbdc/06-risk-capital.md)
- [RTGS and FMI integration](./wholesale-cbdc/07-rtgs-and-fmi-integration.md)
- [Governance, controls, internal audit](./wholesale-cbdc/08-governance-controls.md)
- [Data, accounting, regulatory reporting](./wholesale-cbdc/09-data-reporting.md)
- [Security and cyber](./wholesale-cbdc/10-security-cyber.md)

## Linked

[[tokenized-deposit]] · [[stablecoin-public]] · [[retail-cbdc]] · [[../decisions/0002-cash-leg-strategy]]
