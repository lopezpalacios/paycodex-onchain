# 03 — Cash legs — comparison + differentiation

Critical: not all "tokens" are equal. Issuer, legal status, settlement model, reg framework differ deeply. This note is the core map.

## The four+1 cash leg types

| Type | Issuer | Legal status | Reserves | Reg | Examples |
|---|---|---|---|---|---|
| **Stablecoin (public)** | Private issuer | E-money / payment token | Cash + T-bills (regulated); algo (deprecated) | MiCA (EU), state-by-state (US), Type 1 FINMA (CH) | USDC (Circle), USDT (Tether), PYUSD (PayPal/Paxos), EURC (Circle), EURI (Banking Circle) |
| **Tokenized deposit** | Licensed bank | Commercial bank money | Bank's balance sheet | National banking law | JPMD (JPM Chase), EURCV (Société Générale-Forge), DCHF (Sygnum), Banco Santander tokenized deposits |
| **Wholesale CBDC** | Central bank | Central bank money (CB liability) | Central bank itself | Central bank framework | Project Helvetia (SNB CHF wholesale CBDC live since 2023) |
| **Retail CBDC** | Central bank | Central bank money (CB liability) | Central bank itself | Dedicated CBDC reg | Digital euro (in prep), digital pound (in consultation) |
| **Tokenized MMF / treasury bill** (cash-equivalent) | Asset manager / fund | Fund unit | Underlying T-bills | Securities + fund regs | BlackRock BUIDL, Franklin Templeton FOBXX, Ondo OUSG |

## Differentiation in detail

### Stablecoin (public)

- Issued on public chain by private issuer
- 1:1 peg to fiat backed by reserves (T-bills, cash, repo)
- Regulated under MiCA in EU since June 2024 (e-money tokens for fiat-pegged)
- Permissionless transfer; freeze + blacklist via issuer admin keys
- USDC > USDT in regulated bank/corp use due to MiCA + cleaner reserves
- EURC = MiCA-compliant euro stablecoin

### Tokenized deposit

- Bank issues tokenized form of customer deposit
- Same legal status as DDA — commercial bank money
- Subject to bank deposit insurance (where applicable)
- Typically permissioned chain (only KYC'd bank customers)
- Lower legal innovation; higher operational fit with existing banking books
- Examples: JPM JPMD on Onyx, SocGen-FORGE EURCV, Sygnum DCHF
- Lower public-chain liquidity than stablecoin

### Wholesale CBDC

- Central bank issues directly to commercial banks
- Same legal status as central bank reserves (highest tier of money)
- Eliminates settlement risk in interbank
- Project Helvetia live in CHF (SNB + SDX) since 2023
- Banks subscribe via SIC, redeem to SIC
- Used for DvP on tokenized securities

### Retail CBDC

- Central bank money, distributed by intermediaries (banks, EMIs)
- Holding caps to prevent bank disintermediation (likely €3K for digital euro)
- Privacy: low-value offline anonymous, high-value tracked
- Issuance pending: digital euro decision 2026-2027

### Tokenized MMF / T-bill

- Cash-equivalent yield-bearing
- BlackRock BUIDL on Ethereum / Polygon / Avalanche / Arbitrum / Optimism, $500M+ AUM
- Treasury can hold for yield + liquidity, redeemable to USDC
- Sits between cash leg and investment

## When to use which

| Use case | Best cash leg |
|---|---|
| Cross-border B2B (corp to corp, both KYC'd) | Tokenized deposit OR MiCA stablecoin |
| Public-chain DeFi treasury yield | Stablecoin |
| Interbank wholesale settlement | Wholesale CBDC (where available) |
| Retail consumer payments | Retail CBDC (when live) OR licensed e-money |
| Securities DvP (cash leg) | Wholesale CBDC ideal; tokenized deposit acceptable; stablecoin for non-CB-money settings |
| Idle treasury parking | Tokenized MMF |
| FX between CCYs | Atomic swap two stablecoins |
| Cross-permissioned chains | Tokenized deposit (KYC'd both sides) |

## Cross-link

Adjacent to incumbent: [[../paycodex/concepts/wholesale-cbdc]] · [[../paycodex/concepts/digital-euro]] · [[../paycodex/concepts/mmf]] · [[../paycodex/regulations/mica]]

## Linked

[[cash-legs/stablecoin-public]] · [[cash-legs/tokenized-deposit]] · [[cash-legs/wholesale-cbdc]] · [[cash-legs/retail-cbdc]] · [[cash-legs/tokenized-mmf]]
