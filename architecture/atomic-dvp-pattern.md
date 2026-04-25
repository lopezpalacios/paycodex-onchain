# Atomic DvP pattern

Securities + cash settle atomically on-chain. Replaces T2S DvP pattern.

## Single-chain DvP

```solidity
function atomicDvP(
    IERC20 cashToken,
    IERC1400 securityToken,
    uint256 cashAmount,
    uint256 securityAmount,
    address buyer,
    address seller
) external {
    cashToken.transferFrom(buyer, seller, cashAmount);
    securityToken.transferFrom(seller, buyer, securityAmount);
}
```

If either transfer reverts, both revert. Atomic.

## Cross-chain DvP

- Security token on chain A
- Cash token on chain B
- Need atomic mechanism: HTLC (Hash Time Locked Contract) or trusted bridge

```
1. Seller locks security on A with hashlock H
2. Buyer locks cash on B with hashlock H
3. Seller reveals secret on B → claims cash
4. Buyer uses revealed secret on A → claims security
```

If either party doesn't proceed, timelock returns funds.

## Linked

[[../paycodex/processes/securities-cash-leg]] · [[../paycodex/concepts/dvp]] · [[../use-cases/031-atomic-dvp-security-cash]]
