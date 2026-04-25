# OFAC on-chain screening

Bank screening incoming + outgoing wallet addresses against OFAC + EU + UK + UN sanctions.

## Layers

1. **Wallet-address blocklist** — pre-tx check
2. **Counterparty VASP screening** — identify TX recipient's bank/exchange
3. **Chain analytics** — historical wallet history (mixer use, sanctioned interactions)
4. **Smart-contract address screening** — Tornado Cash precedent

## Implementation

- On-chain blocklist (gas-expensive but on-tx enforcement)
- Off-chain screening with denial before tx submission
- Chain analytics post-fact for SAR filing

## Linked

[[../paycodex/concepts/ofac]] · [[chain-analytics]] · [[tornado-cash-precedent]]
