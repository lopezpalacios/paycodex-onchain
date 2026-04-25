# ERC-3643 / T-REX — Token for Regulated EXchanges

Standard for compliant tokenized securities + cash. Identity + compliance enforced on-chain.

## Components

- **Identity Registry** — wallet ↔ ONCHAINID (W3C-style identity)
- **Claim Issuers** — KYC providers issuing claims (verified, jurisdiction, accredited investor)
- **Compliance Module** — runtime check on every transfer (country, holding limits, lockup)
- **Token contract** — ERC-20-like with `canTransfer` predicate

## Use for cash

- Permissioned tokenized deposit — only KYC'd corp wallets can hold + transfer
- Wholesale CBDC equivalent at bank level
- Securities cash leg in DvP (T-REX cash + T-REX security)

## Why over T-REX vs USDC freeze + blacklist

- USDC: issuer freezes post-fact (centralized control)
- T-REX: transfer denied at protocol level pre-fact, transparent compliance
- T-REX = stronger compliance posture for institutional / regulator audit

## Adoption

- Tokeny (Luxembourg-based) leading T-REX implementation
- Used by 100+ tokenization projects globally
- ERC-3643 finalized 2023

## Sample compliance check

```solidity
function transfer(address to, uint256 amount) external returns (bool) {
    require(_compliance.canTransfer(msg.sender, to, amount), "Compliance reject");
    require(_identityRegistry.isVerified(msg.sender), "Sender not KYC");
    require(_identityRegistry.isVerified(to), "Recipient not KYC");
    return _transfer(msg.sender, to, amount);
}
```

## Linked

[[erc-1400]] · [[../compliance/trex-erc-3643]] · [[../use-cases/006-trex-whitelisted-transfer]]
