# Public chain stablecoin

Privately issued e-money pegged 1:1 to fiat, backed by reserves.

## Major examples

| Token | Issuer | Reg | Reserves | Notes |
|---|---|---|---|---|
| USDC | Circle | NY DFS, MiCA EMI (Q4 2024 — EURC live) | T-bills + cash | Most regulator-friendly |
| USDT | Tether | (Bahamas / El Salvador) | Mixed (T-bills majority) | Largest by volume; reserve transparency improved |
| EURC | Circle | MiCA EMI | EUR reserves | EU-friendly stable |
| EURI | Banking Circle (LU) | MiCA EMI | EUR reserves | Bank-issued |
| PYUSD | PayPal/Paxos | NY DFS | USD reserves | Mid-tier liquidity |
| FDUSD | First Digital Trust | HK | USD | Asia-focused |

## MiCA classification (since June 2024)

- **EMT** (E-money Token) — single fiat (USDC, EURC qualify)
- **ART** (Asset-Referenced Token) — basket / non-fiat (rare for cash mgmt)
- Both require authorization; EMT lighter

## How bank uses

- Treasury holds for liquidity / FX
- Cross-border B2B payment rail
- Onramp / offramp via licensed exchange or fiat partner
- Cannot mint own ones without becoming issuer (high cost)

## Risk

- De-peg risk (USDC briefly de-pegged Mar 2023 SVB exposure; USDT periodically)
- Issuer risk (reserve quality, banking relationships)
- Regulatory risk (MiCA-non-compliant tokens may be delisted in EU)

## Linked

[[../paycodex/regulations/mica|MiCA]] · [[../paycodex/concepts/digital-euro]] · [[tokenized-deposit]]
