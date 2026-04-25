# Hardhat

JavaScript / TypeScript Solidity toolchain. Default demo framework for this repo.

## Why default here

- Broad ecosystem familiarity (corp banking IT teams already JS / TS literate)
- Tests written in TypeScript via ethers.js v6 — mirrors typical bank back-office stack
- Plugin ecosystem (hardhat-toolbox, hardhat-deploy, hardhat-upgrades, hardhat-verify)
- Easy fork-mainnet for integration tests against live USDC, Uniswap, etc.

## Quick start

```bash
mkdir demo && cd demo
npm init -y
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npm install @openzeppelin/contracts
npx hardhat init    # Pick: Create a TypeScript project
```

Place snippets from [[../code/README]] under `contracts/`. Use [[../code/hardhat.config.ts|hardhat.config.ts]] as starting config.

## Sample test

See [[../code/sample.test.ts]] — reference TypeScript test for the BankIssuedToken snippet.

## Linked

[[foundry]] · [[solidity]] · [[openzeppelin]] · [[../code/README]]
