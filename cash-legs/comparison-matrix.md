# Cash legs comparison matrix

| Property | Stablecoin (public) | Tokenized deposit | Wholesale CBDC | Retail CBDC | Tokenized MMF |
|---|---|---|---|---|---|
| Issuer | Private (regulated EMI) | Licensed bank | Central bank | Central bank | Asset manager |
| Legal status | E-money | Commercial bank money | Central bank money | Central bank money | Fund unit |
| Tier of money | Tier 2 | Tier 2 | Tier 1 | Tier 1 | Investment |
| Reserves | T-bills + cash | Bank balance sheet | Central bank itself | Central bank itself | T-bills |
| Reserve audit | Quarterly attestation | Bank capital adequacy | N/A (CB) | N/A (CB) | Daily NAV |
| Counterparty | Issuer (Circle, etc.) | Bank | Central bank | Central bank | Fund manager |
| Deposit insurance | No | Yes (up to limit) | N/A | N/A | No (but fund-level protection in some jurisdictions) |
| Yield | Issuer keeps yield | Bank keeps (or pays via account) | None | None | Pass-through (~5% T-bill) |
| Settlement finality | Public chain finality | Permissioned chain finality | Permissioned + CB sign-off | Permissioned + CB sign-off | Public chain finality |
| Permissioned | No | Yes (typical) | Yes | Yes (with caps) | No |
| Programmability | Full EVM | Full EVM (in permissioned chain) | Limited (operator) | Limited | Full EVM |
| Reg framework | MiCA, NY DFS, FINMA | National banking law | Central bank | Dedicated CBDC reg | Securities law |
| Travel rule applies | Yes (CASP) | Internal (bank already KYC) | Internal | Public-side: yes | Internal |
| Cross-border | Strong (24/7) | Bank-network bound | Bilateral CB-to-CB (mBridge) | Limited | Bridges to public chains |
| Best for | DeFi treasury, FX, cross-border | Interbank deposits, in-house bank | DvP wholesale, interbank | Retail, P2P | Idle cash yield |

## Decision flowchart

```
Need: cash leg for what?
├── Pay corporate counterparty (B2B) → tokenized deposit (if same/peer bank) OR stablecoin (if cross-bank, regulated)
├── Settle securities trade → wholesale CBDC (best) > tokenized deposit > stablecoin
├── Park idle cash for yield → tokenized MMF
├── Customer-facing payment (retail) → retail CBDC (when live) OR licensed e-money
├── DeFi yield strategies → public stablecoin (USDC preferred)
└── Cross-border instant → MiCA stablecoin (EURC) OR multi-CBDC corridor (where exists)
```

## Linked

All five cash leg types above. [[../03-cash-legs-comparison]]
