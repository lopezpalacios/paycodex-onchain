# Circle CCTP — Cross-Chain Transfer Protocol

USDC native bridge. Burn-and-mint (vs lock-and-mint). Reduces wrapping risk.

## Mechanics

- USDC burned on source chain
- Attestation by Circle
- Mint on destination chain
- No wrapped representation

## Cash mgmt impact

- Treasury can move USDC across chains (Ethereum L1 ↔ Base ↔ Arbitrum ↔ Polygon ↔ Optimism ↔ Avalanche ↔ Solana)
- Same USDC entity throughout (no wUSDC)
- Lower bridge risk

## Linked

[[ccip]] · [[../cash-legs/stablecoin-public]]
