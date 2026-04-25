# 002 — ERC-20 transfer with memo (structured reference)

**Tier**: 1
**Incumbent**: [[../../paycodex/processes/qr-bill-receivable]] (Swiss QR-bill structured ref)
**ERC**: ERC-20 + custom event
**Code**: [[../code/02-erc20-transfer-with-memo.sol]]

## What

Token transfer with attached invoice / structured reference. Auto-reconcile on receiving side.

## Why

ERC-20 native transfer has no memo. Two patterns:

1. Wrapper contract emits `Transfer + Memo` event
2. Receiver contract parses incoming + matches to invoice

## Pattern A: wrapper

```solidity
function transferWithMemo(IERC20 token, address to, uint256 amount, bytes32 memo) external {
    token.transferFrom(msg.sender, to, amount);
    emit TransferWithMemo(msg.sender, to, amount, memo);
}
event TransferWithMemo(address indexed from, address indexed to, uint256 amount, bytes32 indexed memo);
```

## Pattern B: receiver-parse

Receiver indexes incoming tx, matches `tx.value` + `block.number` window + sender to its open invoices.

## Equivalent to

Swiss QR-bill 27-digit QRR or ISO 11649 RF in `RmtInf/Strd/CdtrRefInf/Ref` field of pacs.008.

## Linked

[[../../paycodex/data/structured-creditor-reference]] · [[../code/02-erc20-transfer-with-memo.sol]]
