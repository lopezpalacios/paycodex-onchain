# Gas optimization

Reducing gas cost is core engineering discipline.

## Patterns

- Storage minimal (writes most expensive: ~20K gas vs 100 for compute)
- Pack structs into 32-byte slots
- Use `unchecked {}` blocks for safe math (saves ~30 gas/op in 0.8.x)
- Cache `storage` reads in `memory`
- Avoid string operations on-chain
- Batch operations (transferFrom multiple in one tx)

## Tools

- Foundry `forge test --gas-report`
- Hardhat gas reporter

## Linked

[[foundry]]
