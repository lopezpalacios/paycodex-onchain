# Solidity code snippets — Hardhat

Standalone Solidity contracts demonstrating cash mgmt use cases.

Stack: Solidity 0.8.20+ · OpenZeppelin Contracts 5.x · Hardhat 2.x · TypeScript · ethers.js v6.

## Quick start

```bash
mkdir paycodex-demo && cd paycodex-demo
npm init -y
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npm install @openzeppelin/contracts
npx hardhat init   # pick "Create a TypeScript project"
# Copy a snippet into contracts/
cp ../paycodex-onchain/code/01-erc20-transfer.sol contracts/
# Copy hardhat.config.ts pinned for OZ 5.x:
cp ../paycodex-onchain/code/hardhat.config.ts hardhat.config.ts
npx hardhat compile
npx hardhat test
```

A reference test (`code/sample.test.ts`) shows how to deploy + interact via ethers.js.

## Snippets

| # | File | Use case |
|---|---|---|
| 01 | [01-erc20-transfer.sol](01-erc20-transfer.sol) | Bank-issued token (mint/burn/pause) |
| 02 | [02-erc20-transfer-with-memo.sol](02-erc20-transfer-with-memo.sol) | Transfer with structured ref event |
| 03 | [03-batch-transfer.sol](03-batch-transfer.sol) | Multi-recipient batch payment |
| 04 | [04-erc20-permit.sol](04-erc20-permit.sol) | Gasless approve via EIP-2612 |
| 05 | [05-multi-recipient-split.sol](05-multi-recipient-split.sol) | Pro-rata split disbursement |
| 06 | [06-trex-whitelist-transfer.sol](06-trex-whitelist-transfer.sol) | Compliance check via identity registry |
| 07 | [07-balance-read.sol](07-balance-read.sol) | View balance + multi-account aggregator |
| 08 | [08-tokenized-deposit-redeem.sol](08-tokenized-deposit-redeem.sol) | Burn + bank credit pattern |
| 09 | [09-tokenized-deposit-mint.sol](09-tokenized-deposit-mint.sol) | Mint on bank deposit |
| 10 | [10-sanctions-blocklist.sol](10-sanctions-blocklist.sol) | OFAC blocklist enforced on-chain |
| 11 | [11-atomic-fx-swap.sol](11-atomic-fx-swap.sol) | Two-token atomic swap |
| 13 | [13-recurring-payment-aa.sol](13-recurring-payment-aa.sol) | ERC-4337 session-key recurring |
| 14 | [14-direct-debit-mandate.sol](14-direct-debit-mandate.sol) | Mandate as smart contract |
| 15 | [15-sweep-contract.sol](15-sweep-contract.sol) | Auto-sweep excess to vault |
| 17 | [17-tokenized-mmf-vault.sol](17-tokenized-mmf-vault.sol) | ERC-4626 MMF vault |
| 18 | [18-repo-onchain.sol](18-repo-onchain.sol) | Collateralized lending |
| 23 | [23-conditional-payment-oracle.sol](23-conditional-payment-oracle.sol) | Chainlink-triggered release |
| 31 | [31-atomic-dvp.sol](31-atomic-dvp.sol) | DvP cash + security atomic |
| 33 | [33-scf-onchain.sol](33-scf-onchain.sol) | Supply chain finance flow |
| 35 | [35-invoice-tokenization.sol](35-invoice-tokenization.sol) | NFT invoice |
| 39 | [39-letter-of-credit.sol](39-letter-of-credit.sol) | LC as escrow with oracle |
| 51 | [51-cross-border-usdc-eurc.sol](51-cross-border-usdc-eurc.sol) | Stablecoin FX swap |
| 69 | [69-esg-linked-loan.sol](69-esg-linked-loan.sol) | KPI oracle adjusts rate |

## Reference Hardhat config + test

- [hardhat.config.ts](hardhat.config.ts) — minimal config pinned for Solidity 0.8.20 + OZ 5.x
- [sample.test.ts](sample.test.ts) — TypeScript test showing deploy + interact via ethers v6

← [../README.md](../README.md)
