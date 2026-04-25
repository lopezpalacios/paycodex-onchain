# 031 — Atomic DvP (Delivery vs Payment)

**Tier**: 3 — Intermediate
**Incumbent**: [[../../paycodex/processes/securities-cash-leg]] · [[../../paycodex/concepts/dvp]] · [[../../paycodex/concepts/t2s]]
**ERC**: ERC-20 (cash) + ERC-20-compatible security (or ERC-1400 wrapper)
**Code**: [[../code/31-atomic-dvp.sol]]
**Factory contract**: [paycodex-factory/contracts/31-atomic-dvp.sol](https://github.com/lopezpalacios/paycodex-factory/blob/main/contracts/31-atomic-dvp.sol) · deploy gas: 217,672

## What

Atomic single-tx settlement of securities transfer + cash transfer. Either both legs succeed or neither. Equivalent to T2S DvP Model 1.

## Vs T2S DvP

| | T2S DvP | On-chain Atomic DvP |
|---|---|---|
| Settlement model | Gross-gross via T2S platform | Atomic via single tx |
| Cash leg | DCA at NCB | ERC-20 (CBDC / tokenized deposit / stablecoin) |
| Securities leg | CSD ledger | ERC-20-compatible / ERC-1400 |
| Operating hours | T2 cycle | 24/7 |
| Failure penalty | CSDR cash penalty (post-ISD) | None — either settled instantly or never |
| Pre-matching | Required | Not needed (counterparty must approve) |

## Sequence

```mermaid
sequenceDiagram
    actor Buyer
    actor Seller
    participant DvP as AtomicDvP
    participant Cash as Cash Token<br/>(USDC / wholesale CBDC)
    participant Sec as Security Token<br/>(ERC-1400)

    Note over Buyer,Seller: Pre-trade approvals
    Buyer->>Cash: approve(DvP, cashAmount)
    Seller->>Sec: approve(DvP, secAmount)

    Note over Buyer,Seller: Atomic settlement
    Buyer->>DvP: settle(cash, cashAmt, sec, secAmt, buyer, seller)
    DvP->>Cash: transferFrom(buyer, seller, cashAmt)
    Cash-->>DvP: ok
    DvP->>Sec: transferFrom(seller, buyer, secAmt)
    Sec-->>DvP: ok
    DvP-->>Buyer: emit Settled
    Note over DvP: If either transferFrom reverts,<br/>whole tx reverts. Atomic.
```

## Cross-chain DvP

When security and cash live on different chains, atomic DvP needs HTLC (Hash Time Locked Contract):

```mermaid
sequenceDiagram
    actor Seller
    actor Buyer
    participant ChainA as Chain A (Security)
    participant ChainB as Chain B (Cash)

    Seller->>ChainA: lock security with hashlock H, timelock T1
    Buyer->>ChainB: lock cash with hashlock H, timelock T2 (T2 < T1)
    Note over Seller: Reveal secret S where hash(S) = H
    Seller->>ChainB: claim cash by revealing S
    ChainB-->>Seller: cash transferred
    Note over Buyer: S now public on Chain B
    Buyer->>ChainA: claim security using S
    ChainA-->>Buyer: security transferred
```

If either party doesn't act within timelocks, locks expire — funds returned. Atomic without trust.

## Linked

[[../../paycodex/processes/securities-cash-leg]] · [[../../paycodex/concepts/dvp]] · [[../code/31-atomic-dvp.sol]]
