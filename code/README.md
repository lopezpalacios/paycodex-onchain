# Solidity code snippets

Standalone Solidity contracts demonstrating cash mgmt use cases.

Stack: Solidity 0.8.20+, OpenZeppelin 5.x, Foundry test runner.

To run any snippet:

```bash
forge init demo
cd demo
forge install OpenZeppelin/openzeppelin-contracts
# copy snippet into src/
forge build
forge test
```

## Snippets

| # | File | Use case |
|---|---|---|
| 01 | [[01-erc20-transfer.sol]] | Bank-issued token (mint/burn/pause) |
| 02 | [[02-erc20-transfer-with-memo.sol]] | Transfer with structured ref event |
| 03 | [[03-batch-transfer.sol]] | Multi-recipient batch payment |
| 04 | [[04-erc20-permit.sol]] | Gasless approve via EIP-2612 |
| 05 | [[05-multi-recipient-split.sol]] | Pro-rata split disbursement |
| 06 | [[06-trex-whitelist-transfer.sol]] | Compliance check via identity registry |
| 07 | [[07-balance-read.sol]] | View balance + multi-account aggregator |
| 08 | [[08-tokenized-deposit-redeem.sol]] | Burn + bank credit pattern |
| 09 | [[09-tokenized-deposit-mint.sol]] | Mint on bank deposit |
| 10 | [[10-sanctions-blocklist.sol]] | OFAC blocklist enforced on-chain |
| 11 | [[11-atomic-fx-swap.sol]] | Two-token atomic swap |
| 13 | [[13-recurring-payment-aa.sol]] | ERC-4337 session-key recurring |
| 14 | [[14-direct-debit-mandate.sol]] | Mandate as smart contract |
| 15 | [[15-sweep-contract.sol]] | Auto-sweep excess to vault |
| 17 | [[17-tokenized-mmf-vault.sol]] | ERC-4626 MMF vault |
| 18 | [[18-repo-onchain.sol]] | Collateralized lending |
| 23 | [[23-conditional-payment-oracle.sol]] | Chainlink-triggered release |
| 31 | [[31-atomic-dvp.sol]] | DvP cash + security atomic |
| 33 | [[33-scf-onchain.sol]] | Supply chain finance flow |
| 35 | [[35-invoice-tokenization.sol]] | NFT invoice |
| 39 | [[39-letter-of-credit.sol]] | LC as escrow with oracle |
| 51 | [[51-cross-border-usdc-eurc.sol]] | Stablecoin FX swap |
| 69 | [[69-esg-linked-loan.sol]] | KPI oracle adjusts rate |

← [[../README]]
