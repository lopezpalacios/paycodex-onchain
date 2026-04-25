# 001 — ERC-20 instant transfer

**Tier**: 1 — Easiest
**Incumbent**: [[../../paycodex/concepts/sct-inst]] · [[../../paycodex/concepts/fps]]
**ERC**: ERC-20 (any cash leg implementing it)
**Code**: [[../code/01-erc20-transfer.sol]]

## What

Send X token from A to B. Atomic, irrevocable, ~1-12s finality depending on chain.

## Vs incumbent SCT Inst

| | SCT Inst | ERC-20 transfer |
|---|---|---|
| Hours | 24/7 (post-IPR) | 24/7 always |
| SLA | <10s | <12s on L2, <12min on L1 |
| Limit | No scheme cap (PSP discretion) | Block-size dependent (effectively unlimited) |
| Cost | €0.05-€0.30 | $0.001-$5 (chain-dependent) |
| VOP / pre-validation | Mandatory Oct 2025 | Address book pattern, ENS lookup |
| Sanctions | Daily customer screening | Pre-tx wallet screening |

## Code

See [[../code/01-erc20-transfer.sol]]:

```solidity
function transfer(address to, uint256 amount) external returns (bool);
```

Same call works for any ERC-20: USDC, EURC, JPMD, EURCV, DCHF, BUIDL.

## Reg considerations

- KYC at issuance (offramp / onramp) handles customer identification
- Travel Rule applies if amount ≥ €1k EU / $3k US between VASPs
- Sanctions: pre-tx address screening via [[../compliance/ofac-onchain-screening]]

## Linked

[[002-erc20-transfer-with-memo]] · [[../code/01-erc20-transfer.sol]]
