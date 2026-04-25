# Account Abstraction (AA)

Smart contract wallets vs EOA (Externally Owned Account). Enables programmable account behavior.

## Standards

- **ERC-4337** — most common, no consensus changes — see [[../standards/erc-4337]]
- **EIP-7702** — adds AA features to EOAs (set-code transactions)
- zkSync native AA — different model (built into chain)

## Cash mgmt features unlocked

- Multi-sig out of box
- Spending limits per-token, per-day
- Session keys (auto-pay specific recipients)
- Social recovery (replace seed phrase with guardians)
- Gasless via paymaster (bank pays gas for corp customer)
- Conditional spending (oracle-fed: only if X)

## Linked

[[../standards/erc-4337]] · [[multisig-gnosis-safe]] · [[../use-cases/020-account-abstraction-treasury-wallet]]
