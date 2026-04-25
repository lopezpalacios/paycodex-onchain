# ADR 0004 — Multi-chain strategy

**Status**: Proposed
**Date**: 2026-04-25

## Decision

**Permissioned Besu primary. Ethereum L1 as anchor + final settlement. Base + Arbitrum as L2s for liquidity. Polygon PoS for low-cost settlement when L1 anchoring not needed.**

## Reasoning

- Besu: KYC'd participants, compliance, low cost
- Ethereum L1: maximum security, anchor for big settlements
- Base + Arbitrum: deepest USDC liquidity, low cost
- Polygon PoS: BUIDL home + cheap settlement

## Linked

[[../platforms/besu]] · [[../platforms/ethereum-l1]] · [[../platforms/base]] · [[../platforms/arbitrum]]
