# Tokenized money market fund

Fund unit on-chain. Cash-equivalent. Yield-bearing.

## Examples

| Fund | Issuer | Chain | AUM (approx) |
|---|---|---|---|
| BUIDL | BlackRock + Securitize | Ethereum + Polygon + Avalanche + Arbitrum + Optimism | $500M+ |
| FOBXX | Franklin Templeton | Stellar + Polygon | $400M+ |
| OUSG | Ondo Finance | Ethereum | $200M+ |

## Mechanics

- Underlying = US T-bills + repo
- Token = fund share (ERC-4626 typical)
- Subscription / redemption: USDC ↔ fund token, often instant
- Yield accrues to share price (or via rebasing)

## Use

- Treasury idle cash → BUIDL → yield ~5%
- Liquidity (most are 1-day redemption)
- Counterparty: fund manager (BlackRock = strong counterparty)

## Linked

[[stablecoin-public]] · [[../standards/erc-4626]] · [[../paycodex/concepts/mmf]]
