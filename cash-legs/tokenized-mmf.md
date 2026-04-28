# Tokenized money market fund

A tokenized money market fund is a regulated MMF whose units are issued and transferred on a distributed ledger. The legal claim is identical to a non-tokenized fund unit: a beneficial interest in a regulated investment vehicle holding short-dated cash-equivalent assets (T-bills, repo, central bank reverse repo, very short investment-grade commercial paper). Tokenization is a representation layer on top of the existing fund structure; the prospectus, investment policy, and regulatory regime are largely unchanged.

A tokenized MMF is *not* commercial bank money, central bank money, or e-money. It is a fund unit. This drives the differences in NAV, redemption mechanics, and capital treatment.

## Why tokenized MMFs exist

1. On-chain yield-bearing cash-equivalent that complements zero-yield stablecoins.
2. Programmable collateral mobility (post tokenized MMF as margin or collateral atomically).
3. 24/7 subscription / redemption against a stablecoin or tokenized-deposit cash leg.
4. Faster settlement than legacy fund-administration cycles (T+0 / instant in many tokenized designs).
5. New distribution channels reaching crypto-native institutional treasuries.

## Major live programmes

| Fund | Issuer / sponsor | Chain(s) | AUM (approx) | Notes |
|---|---|---|---|---|
| BUIDL | BlackRock + Securitize | Ethereum + Polygon + Avalanche + Arbitrum + Optimism | $500M+ (and growing) | Largest tokenized MMF; institutional-only |
| FOBXX | Franklin Templeton | Stellar + Polygon | $400M+ | One of the earliest live tokenized MMFs |
| OUSG | Ondo Finance | Ethereum | $200M+ | Tokenizes BlackRock's iShares treasury ETF / direct T-bill exposure |
| BENJI | Franklin Templeton | (FOBXX share class) | (within FOBXX) | Public-chain accessible share |
| WisdomTree Prime | WisdomTree | Stellar / Ethereum | (various) | Multi-product tokenized fund family |
| Hashnote USYC | Hashnote / Cumberland | Ethereum | (varies) | Treasury-backed tokenized fund |
| Backed bIB01 / bC3M | Backed Finance | Ethereum / Polygon / Avalanche / Base | (varies) | Wrapped ETF exposure (CH-issued) |

## Tokenized MMF vs. adjacent instruments

| Dimension | Tokenized MMF | Stablecoin (EMT) | Tokenized deposit | Wholesale CBDC |
|---|---|---|---|---|
| Issuer | Asset manager | EMI / regulated issuer | Licensed bank | Central bank |
| Money type | Fund unit | E-money | Commercial bank money | Central bank money |
| Backing | T-bills, repo, central bank reverse repo, very short paper | Reserves at banks (HQLA) | Bank balance sheet (fractional) | Central bank itself |
| Yield | Yes (T-bill yield, accrued in NAV or via rebasing) | Generally none | Possible | Policy-rate aligned |
| Bankruptcy | Fund-level NAV; bankruptcy-remote from issuer | Bankruptcy-remote reserves | Senior unsecured deposit claim | N/A |
| Holder universe | KYC'd investors | Broadly open | KYC'd customers of issuer | Banks + select FMIs |
| Redemption | Daily (or instant in tokenized form), possibly fees / gates / suspensions | At par on demand | At par on demand | At par to RTGS |
| Chain | Permissioned / hybrid | Public | Permissioned | Permissioned |
| Capital treatment for holders | Fund holding (look-through) | Crypto-asset (Basel SCO60 Group 1b/2) | Bank deposit | Cash |

## Operating model

A tokenized MMF programme is structurally:

1. **Fund manager / sponsor** — authorised asset manager (BlackRock, Franklin, Ondo's RIA/manager, etc.).
2. **Fund vehicle** — Cayman / Delaware / Luxembourg / Irish UCITS / equivalent structure depending on regime.
3. **Custodian** — qualified custodian for underlying assets.
4. **Transfer agent** — historically off-chain; in tokenized form, the chain-based register often serves as the transfer-agent function under regulator-blessed arrangement.
5. **Tokenization provider / issuer agent** — Securitize, Backed, Ondo, in-house.
6. **Distribution** — direct to eligible institutional investors; sometimes via licensed exchanges or DeFi-curated venues.
7. **Compliance and ops stack** — KYB on every holder, sanctions, transfer-restriction enforcement, ongoing reporting.

## Lifecycle

1. **Onboarding** — investor KYB / KYC; eligibility check (typically institutional / accredited / professional only); wallet attestation.
2. **Subscription** — investor sends cash leg (USDC, USD wire, tokenized deposit) → fund credits NAV-equivalent number of tokens to attested wallet.
3. **Yield accrual** — NAV grows daily (T+0 tokenized designs publish NAV on-chain) or via daily rebase / share-price update.
4. **Transfer** — restricted to attested counterparties (allowlist or ERC-3643 gating).
5. **Redemption** — investor returns tokens → fund pays cash leg per redemption mechanics (T+0 instant against stablecoin, T+1 against fiat).
6. **NAV / pricing** — daily NAV publication; intraday for some products.
7. **Lifecycle events** — fund-level events (suspensions, gates, fees), corporate actions, transfer-agent updates, contract upgrades, key rotation.

## Reference architecture

```
+-------------------+      +------------------------+      +---------------------+
|  Custodian /      |<---->|  Fund administrator /  |<---->|  Permissioned chain |
|  T-bill broker    |      |  transfer agent        |      |  / public chain     |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  Cash leg rails   |      |  KYB / KYC + on-chain  |      |  Investor wallets   |
|  (USDC / wires)   |      |  identity (ERC-3643)   |      |                     |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  NAV publication  |      |  Sanctions / AML / TM  |      |  HSM / MPC keys     |
+-------------------+      +------------------------+      +---------------------+
```

## Use cases

- Treasury idle-cash parking with yield (BUIDL adoption pattern).
- Programmable collateral: post tokenized MMF as margin in clearing or repo.
- Cash leg in DeFi-adjacent strategies under controlled venues.
- 24/7 subscription / redemption against stablecoin.
- Tokenized DvP cash leg where yield is preferable to non-yielding stablecoin.

## Risks

- **Underlying asset** — interest-rate, credit, repo-counterparty, sovereign.
- **Liquidity / gating** — fund-level redemption suspensions or fees; tokenized form does not override fund-level risk controls.
- **Smart contract / bridge** — exploits in core or bridged representations.
- **Regulatory** — securities-law treatment varies by jurisdiction; tokenized form may trigger additional rules.
- **Operational** — transfer-agent / NAV-pipeline failure; reconciliation drift between on-chain supply and fund register.
- **Custody / qualified custodian** — failure of the underlying-asset custodian.
- **Concentration** — many products track the same underlying T-bill exposure; correlated stress.

## Onboarding requirements (linked)

The full set of requirements for an asset manager to launch a tokenized MMF programme is broken out in the [`tokenized-mmf/`](./tokenized-mmf/README.md) subdirectory:

- [Technical requirements](./tokenized-mmf/01-technical.md)
- [Regulatory requirements](./tokenized-mmf/02-regulatory.md)
- [Compliance, AML / CFT, KYB / KYC, sanctions](./tokenized-mmf/03-compliance-aml-kyc.md)
- [Operational requirements](./tokenized-mmf/04-operational.md)
- [Legal and contractual requirements](./tokenized-mmf/05-legal-contractual.md)
- [Risk management and capital](./tokenized-mmf/06-risk-capital.md)
- [Custody, fund administration, NAV pipeline](./tokenized-mmf/07-custody-and-fund-admin.md)
- [Governance, controls, internal audit](./tokenized-mmf/08-governance-controls.md)
- [Data, accounting, regulatory reporting](./tokenized-mmf/09-data-reporting.md)
- [Security and cyber](./tokenized-mmf/10-security-cyber.md)

## Linked

[[stablecoin-public]] · [[tokenized-deposit]] · [[../standards/erc-4626]] · [[../standards/erc-3643-trex]] · [[../decisions/0002-cash-leg-strategy]]
