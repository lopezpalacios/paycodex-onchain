# Foundry

Solidity toolkit (Forge / Cast / Anvil / Chisel). Rust-based. Tests in Solidity, fast, fuzz built in.

## Strengths

- Native Solidity testing (no JS bridge)
- Fastest compile + test cycle
- Mainnet forking + invariant testing built in
- Preferred by protocol engineers + auditors

## In this repo

Snippets in [[../code/README]] target **[[hardhat]]** by default for demo purposes (broad familiarity, JS/TS toolchain, easier integration with corp CI). Snippets are framework-agnostic Solidity — they compile fine under Foundry too:

```bash
forge init demo && cd demo
forge install OpenZeppelin/openzeppelin-contracts
cp ../paycodex-onchain/code/01-erc20-transfer.sol src/
forge build && forge test
```

## Linked

[[hardhat]] · [[solidity]] · [[../code/README]]
