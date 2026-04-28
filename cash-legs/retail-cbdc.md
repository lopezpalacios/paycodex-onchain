# Retail CBDC

A retail central bank digital currency is central bank money issued for use by the general public — individuals and non-financial corporates. It is a direct liability of the central bank, like physical cash, with the form of a digital bearer record. Distribution is almost universally **intermediated**: end-users hold and transact through commercial banks, payment institutions, or licensed non-bank PSPs; the central bank does not run retail accounts itself.

The bank's role is therefore that of a **regulated distributor / PSP**, not an issuer. Cash on the bank's balance sheet is not increased by retail CBDC — it sits in the customer's CBDC wallet (a CB liability), with the bank providing the wallet, KYC, AML, and customer-facing service layer.

## Why retail CBDC exists

1. Preserve public access to central bank money in a cash-declining economy.
2. Provide a public-good payments option that is open, free at point of use, and resilient.
3. Strengthen monetary sovereignty against private digital monies (foreign stablecoins, big-tech wallets).
4. Improve cross-border retail payments (some designs include cross-currency interoperability).
5. Enable programmable retail payments under public oversight (with strict policy constraints on programmability).

## Live + planned programmes

| Programme | Sponsor | Status | Notes |
|---|---|---|---|
| Digital euro | ECB / Eurosystem | Preparation phase since Nov 2023; go-ahead decision expected 2026-2027; earliest issuance 2027-2028 | Intermediated via PSPs; holding cap (likely EUR 3K); programmable but no expiry / no targeted-use restrictions |
| Digital pound | BoE / HMT | Consultation; design phase | Intermediated; holding cap considered |
| e-CNY | PBoC | At-scale pilot, multi-million users | Two-tier (PBoC issues, banks distribute); offline; programmable |
| eNaira | CBN (Nigeria) | Live since 2021 | Limited adoption |
| Sand Dollar | Central Bank of Bahamas | Live since 2020 | First live retail CBDC |
| JAM-DEX | Bank of Jamaica | Live | Limited adoption |
| Project Aber / digital riyal | Saudi / UAE / others | Various | Mostly wholesale focus |
| DCash | ECCB (Eastern Caribbean) | Live, then pause | Operational issues required reset |

## Retail CBDC vs. adjacent instruments

| Dimension | Retail CBDC | Tokenized deposit | Stablecoin | Cash (banknotes) |
|---|---|---|---|---|
| Issuer | Central bank | Licensed bank | EMI / regulated issuer | Central bank |
| Money type | Central bank money | Commercial bank money | E-money | Central bank money |
| Distribution | Intermediated via PSPs | Bank's customers | Open / VASP-mediated | Banks, ATMs, retail |
| Holder universe | General public | KYC'd customers of issuer | Broadly open | Universal |
| Yield | Generally none (often prohibited or zero policy) | Possibly | Generally none | None |
| Holding caps | Yes (typical) | None | None | None |
| Programmability | Limited (typically simple smart payments) | High | High | None |
| Privacy | Tiered (small payments private; larger AML-monitored) | Bank-monitored | Pseudonymous on chain | High (cash) |
| Bank balance-sheet impact | Liability shift away from deposits if uncapped | Same as DDA | None on bank | None on bank |

## Design choices that shape distributor onboarding

The supervisory expectations for a distributor depend heavily on programme design choices:

- **Single-tier vs. two-tier** — most live designs are two-tier (CB issues, intermediaries distribute).
- **Account-based vs. token-based** — affects KYC obligations and offline capability.
- **Holding cap** — the EUR 3K cap (likely for the digital euro) materially limits disintermediation but adds reverse-waterfall logic (see below).
- **Reverse waterfall / waterfall** — the digital euro design uses automatic top-up from the linked DDA when payment exceeds wallet balance, and automatic offload back to DDA when wallet balance exceeds the cap.
- **Programmability** — ECB / BoE designs explicitly *exclude* targeted-use restrictions and expiry. e-CNY allows more programmability.
- **Offline capability** — present in several designs (digital euro target; e-CNY live).
- **Cross-border** — early designs are domestic-first; cross-border interoperability is a later phase.

## Operating model (distributor view)

The bank as PSP provides:

1. **Onboarding** — extension of standard banking KYC to the CBDC wallet.
2. **Wallet provisioning** — branded CBDC wallet inside online and mobile banking.
3. **Funding and defunding** — DDA-to-CBDC and CBDC-to-DDA transfers; reverse-waterfall logic.
4. **Payments** — initiate, receive, refund, and reconcile CBDC payments.
5. **Compliance** — AML/CFT screening, sanctions, suspicious-activity reporting.
6. **Customer support** — disputes, lost-device handling, fraud, complaints.
7. **Reporting** — to the CB / scheme operator and to the supervisor.

## Lifecycle (customer-facing)

1. **Onboarding** — customer KYC at the bank; CBDC wallet provisioned and bound to identity at the scheme level.
2. **Funding** — DDA debited / cash deposited; CBDC wallet credited (CB-side mint to that wallet).
3. **Payment** — P2P, P2B, or B2B flows on the CBDC scheme; finality at central bank money level.
4. **Reverse waterfall / waterfall** — automatic top-up from DDA on insufficient balance; automatic offload on cap breach.
5. **Refund / dispute** — handled per scheme rulebook; scheme-defined reversibility properties.
6. **Defunding** — customer transfers from CBDC wallet to DDA or cash.
7. **Lifecycle events** — wallet recovery (lost device), key rotation, compliance freeze, account closure.

## Reference architecture (distributor side)

```
+-------------------+      +------------------------+      +---------------------+
|  Online / mobile  |<---->|  Bank-side CBDC SDK /  |<---->|  CBDC scheme        |
|  banking apps     |      |  PSP integration       |      |  infrastructure     |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  Core banking     |      |  Reverse waterfall /   |      |  CBDC wallets       |
|  (DDA / GL)       |      |  funding orchestrator  |      |  (CB-tier balances) |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  AML / KYC / TM   |      |  Sanctions / disputes  |      |  Customer support   |
+-------------------+      +------------------------+      +---------------------+
```

## Use cases and impact

- Public-good payments rail; alternative to cards and existing instant-payment schemes.
- Retail merchant acceptance via QR / NFC / online.
- Government disbursements (digital euro is *not* targeted-use, but disbursement use case is straightforward).
- Cross-border retail (later phase in most designs).
- Offline payments (where the design supports).

## Risks (distributor view)

- **Disintermediation** — deposits shift to CBDC if cap is too high or absent (mitigated in EU by the EUR 3K cap, deposit-to-CBDC fee structures, and reverse waterfall).
- **Operational** — integration complexity; new scheme rulebook; new customer-support volumes.
- **Compliance** — AML/CFT obligations on a new channel; potential for new typologies.
- **Reputational** — high-visibility scheme, public expectations of reliability.
- **Liquidity** — short-notice funding pulls from DDA into CBDC wallet during stress events; intraday liquidity sizing must include CBDC outflows.
- **Mandatory distribution** — most live / planned regimes make distribution mandatory for credit institutions of a certain size; non-compliance has supervisory consequences.

## Onboarding requirements (linked)

The full set of requirements for a bank to onboard as a retail CBDC distributor is broken out in the [`retail-cbdc/`](./retail-cbdc/README.md) subdirectory:

- [Technical requirements](./retail-cbdc/01-technical.md)
- [Regulatory requirements](./retail-cbdc/02-regulatory.md)
- [Compliance, AML / CFT, sanctions, KYC](./retail-cbdc/03-compliance-aml-kyc.md)
- [Operational requirements](./retail-cbdc/04-operational.md)
- [Legal and contractual requirements](./retail-cbdc/05-legal-contractual.md)
- [Risk management and capital](./retail-cbdc/06-risk-capital.md)
- [Core banking, payments, reverse-waterfall integration](./retail-cbdc/07-integration-core-banking.md)
- [Governance, controls, internal audit](./retail-cbdc/08-governance-controls.md)
- [Data, accounting, regulatory reporting](./retail-cbdc/09-data-reporting.md)
- [Security and cyber](./retail-cbdc/10-security-cyber.md)

## Linked

[[wholesale-cbdc]] · [[tokenized-deposit]] · [[stablecoin-public]] · [[../decisions/0002-cash-leg-strategy]]
