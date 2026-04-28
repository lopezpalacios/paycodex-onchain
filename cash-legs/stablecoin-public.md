# Public-chain stablecoin

A stablecoin is a privately issued digital bearer instrument designed to maintain a stable value against a reference (almost always a single fiat currency at 1:1). In a regulated context it is generally either an **e-money token (EMT)** or, less commonly for cash-management use, an **asset-referenced token (ART)**. The defining property is that the issuer is *not* a deposit-taking bank issuing commercial bank money against fractional-reserve balance sheets; it is an electronic-money institution (or equivalent) holding fully segregated 1:1 reserves.

A stablecoin is not commercial bank money. It is electronic money or, depending on legal framing, a securitised reserve claim. This drives every difference in prudential, accounting, and bankruptcy treatment.

## Why stablecoins exist

1. Programmable on-chain dollars / euros without depending on a single bank.
2. Public-chain liquidity that bridges DeFi, CeFi, and traditional rails.
3. 24/7 settlement, single-issuer fungibility (unlike tokenized deposits which are issuer-specific).
4. Cross-border value transfer cheaper and faster than correspondent banking for many corridors.
5. Onramp / offramp connectivity into the broader tokenised-asset stack (collateral, DvP, FX).

## Major live examples

| Token | Issuer | Regime | Reserves | Notes |
|---|---|---|---|---|
| USDC | Circle | NY DFS, MiCA EMI (EU) | T-bills majority + cash at banks | Most regulator-aligned major USD stable |
| EURC | Circle | MiCA EMT (EU) | EUR cash + short-dated EUR govt | Largest MiCA-compliant euro stable |
| USDT | Tether | Bahamas/El Salvador | Mixed (T-bills majority disclosed) | Largest by volume; reserve transparency improved |
| EURI | Banking Circle | MiCA EMT | EUR reserves at issuer-affiliated bank | Bank-issued EMT |
| PYUSD | PayPal / Paxos Trust | NY DFS | USD reserves | Mid-tier liquidity |
| FDUSD | First Digital Trust | HK | USD | Asia-focused |
| RLUSD | Ripple / Standard Custody | NY DFS | USD reserves | Newer entrant |
| USDP | Paxos Trust | NY DFS | USD reserves | Long-running regulated USD stable |
| GHO | Aave (decentralised) | None (overcollateralised crypto) | Crypto collateral | Not in scope for regulated cash mgmt |
| DAI / sDAI | MakerDAO | None | Mixed crypto + RWA | Not in scope for regulated cash mgmt |

## Stablecoin vs. adjacent instruments

| Dimension | Stablecoin (EMT) | Tokenized deposit | Wholesale CBDC | Tokenized MMF |
|---|---|---|---|---|
| Issuer | EMI / regulated stablecoin issuer | Licensed bank | Central bank | Asset manager |
| Money type | E-money | Commercial bank money | Central bank money | Fund unit |
| Reserves | Segregated 1:1 (HQLA) | Bank balance sheet (fractional) | Central bank itself | T-bills / repo |
| Bankruptcy | Bankruptcy-remote reserve pool | Senior unsecured deposit claim | N/A | Fund-level NAV |
| Yield | Generally none (or restricted) | Possible (interest-bearing) | Policy-rate aligned | Yes (T-bill yield) |
| Holder universe | Broadly open (where permitted) | KYC'd customers of issuer | Banks + select FMIs | KYC'd investors |
| Chain typology | Public (mostly) | Permissioned (mostly) | Permissioned | Permissioned / hybrid |
| Cross-issuer fungibility | Single issuer per token, broadly held | Single issuer, single set of holders | Single CB issuer | Single fund per token |
| Capital treatment for holders | Crypto-asset (Basel SCO60 Group 1b/2) | Bank deposit | Cash | Fund holding |

## Regulatory regimes

### European Union — MiCA
- **EMT (e-money token)** — single fiat reference. Authorisation as a credit institution or EMI; reserve, redemption, and disclosure requirements; significant-EMT additional rules (Art. 43–58).
- **ART (asset-referenced token)** — basket / non-fiat reference. Heavier authorisation; significant-ART additional rules.
- Reserves: 1:1, segregated, HQLA, audited; daily reconciliation.
- Redemption at par on demand from holders; no fees on redemption (with limited exceptions).
- White-paper notification, marketing rules, complaints handling.

### United States
- State trust charters (NY DFS BitLicense and limited-purpose trusts) are the most common authorization path today for major USD stables.
- Federal frameworks (proposed/live: Clarity, GENIUS, payments-stablecoin acts) — confirm which is operative at launch time.
- FinCEN MSB registration; OFAC sanctions screening; BSA programme.
- State money-transmitter licensing where applicable.

### United Kingdom
- FCA cryptoasset regime; Bank of England + FCA stablecoin framework for systemic payment stablecoins (post-FSMA 2023).
- Sandboxed live operation through the Digital Securities Sandbox or related.

### Singapore
- MAS Stablecoin Regulatory Framework (single-currency stablecoins in SGD or G10) — authorisation, reserve, capital, audit requirements.

### Hong Kong
- HKMA Stablecoin Ordinance (in force / phasing in 2025+) — authorisation and supervision regime for fiat-referenced stablecoins.

### Switzerland
- FINMA stablecoin guidance; bank-issued EMT-equivalents under Banking Act; non-bank issuers under collective investment / FinIA depending on construction.

## Operating model

A regulated stablecoin programme is structurally:

1. **Issuer entity** — EMI / trust / bank, authorised in the relevant regime.
2. **Reserve manager** — manages segregated reserves under the regime's rules, often a separate custodian/bank.
3. **Mint / burn (issuance / redemption) operator** — handles primary-market on/offramp via fiat rails.
4. **Smart contract deployer / operator** — the on-chain issuance contract with mint/burn/freeze/blacklist authority.
5. **Distribution channels** — exchanges, OTC desks, institutional partners, on-/off-ramps.
6. **Compliance and ops stack** — KYB on direct redeemers, sanctions screening on every transfer counterparty (where applicable), Travel Rule with VASP partners.

## Lifecycle

1. **Onboarding** — direct redeemers (institutional) onboarded with full KYB; secondary-market holders onboarded by their VASPs.
2. **Issuance (mint)** — fiat received in segregated reserve account → on-chain mint to attested counterparty wallet.
3. **Distribution** — issuer transfers to exchanges / partners; secondary trading on public rails.
4. **Transfer** — broadly free between non-blacklisted addresses; sanctions/blacklist enforced on-chain via blacklist state.
5. **Redemption (burn)** — direct redeemer returns tokens → on-chain burn → fiat payout from reserves.
6. **Reserve management** — daily reconciliation, monthly attestations / audits.
7. **Lifecycle events** — blacklist, freeze, contract upgrade, key rotation, reserve composition change.

## Reference architecture

```
+-------------------+      +------------------------+      +---------------------+
|  Reserve banks /  |<---->|  Issuance & redemption |<---->|  Public chain (L1/L2)|
|  custodians       |      |  orchestrator          |      |  smart contracts    |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^         ^                       ^
        |                          |         |                       |
        v                          v         v                       v
+-------------------+      +------------------------+      +---------------------+
|  Fiat rails       |      |  KYB / KYC for direct  |      |  Distribution       |
|  (SEPA/Fedwire/   |      |  redeemers + Travel    |      |  partners (CEX/OTC) |
|   SWIFT/CHAPS)    |      |  Rule integration      |      |                     |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  Reserve attest.  |      |  Sanctions / AML / TM  |      |  HSM / MPC keys     |
+-------------------+      +------------------------+      +---------------------+
```

## Smart contract surface

- Token contract (ERC-20 base) with `mint`, `burn`, `pause`, `blacklist(address)`, `unblacklist(address)`.
- Upgradeability (proxy + timelock) where allowed.
- Multi-sig / threshold control of admin roles.
- Events for every privileged action (auditor + reconciliation feed).
- Optional: cross-chain bridge contracts (canonical issuance + lock-and-mint or burn-and-mint to other chains).

## Use cases for a bank

- Treasury holding for liquidity / FX (subject to capital treatment and policy).
- Cross-border B2B payment rail (with Travel Rule and counterparty diligence).
- Onramp / offramp to crypto-asset business lines via licensed venues.
- DvP cash leg on public chains where a tokenized deposit is unavailable.
- Cannot mint own stablecoin without becoming an issuer (a separate authorised entity, distinct from the deposit-taking licence).

## Risks

- **De-peg** — reserves underperform or banking-rail outage during stress (USDC SVB episode March 2023; USDT periodic stress).
- **Issuer credit / operational** — reserve manager failure, governance failure.
- **Regulatory** — non-compliant tokens delisted (EU MiCA forced delistings of non-EMT-compliant USDT pairs in 2024 on EU venues).
- **Sanctions / blacklist** — issuer-mandated freezes affect downstream holders; secondary-market participants exposed to issuer policy.
- **Smart contract / bridge** — exploits in core or bridged representations.
- **Concentration** — small number of issuers carry the system (USDC + USDT dominate USD; EURC dominates regulated EUR).

## Onboarding requirements (linked)

The full set of requirements to launch and operate a regulated stablecoin programme is broken out in the [`stablecoin-public/`](./stablecoin-public/README.md) subdirectory:

- [Technical requirements](./stablecoin-public/01-technical.md)
- [Regulatory requirements](./stablecoin-public/02-regulatory.md)
- [Compliance, AML / CFT, sanctions, KYB / KYC](./stablecoin-public/03-compliance-aml-kyc.md)
- [Operational requirements](./stablecoin-public/04-operational.md)
- [Legal and contractual requirements](./stablecoin-public/05-legal-contractual.md)
- [Risk management and capital](./stablecoin-public/06-risk-capital.md)
- [Reserves, banking, payments integration](./stablecoin-public/07-reserves-and-banking.md)
- [Governance, controls, internal audit](./stablecoin-public/08-governance-controls.md)
- [Data, accounting, regulatory reporting](./stablecoin-public/09-data-reporting.md)
- [Security and cyber](./stablecoin-public/10-security-cyber.md)

## Linked

[[tokenized-deposit]] · [[wholesale-cbdc]] · [[tokenized-mmf]] · [[../standards/erc-20]] · [[../compliance/mica-eu]] · [[../decisions/0002-cash-leg-strategy]]
