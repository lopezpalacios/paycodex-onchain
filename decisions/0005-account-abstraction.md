# ADR 0005 — Account abstraction adoption

**Status**: Proposed
**Date**: 2026-04-25

## Decision

**ERC-4337 smart wallets for all corporate-facing customers. Bank-operated paymaster for gas sponsorship. EOA for treasury internal hot wallets, MPC for cold.**

## Reasoning

- Smart wallets enable spending limits, multi-sig, social recovery, session keys
- Paymaster lets corp customer not hold ETH (huge UX win)
- Treasury hot wallet operations need speed → EOA + custody integration
- Cold treasury → MPC

## Linked

[[../standards/erc-4337]] · [[../architecture/gasless-paymaster-pattern]] · [[../concepts/mpc-custody]]
