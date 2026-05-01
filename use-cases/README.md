# Top 100 cash management use cases on EVM

Ranked easiest → hardest. Each links to its incumbent equivalent in [[../../paycodex/]]. Top ~20 have full Solidity snippet in [[../code/README]].

## Tier 1 — Single tx, single contract (Easiest)

| # | Use case | Incumbent | ERC | Code |
|---|---|---|---|---|
| 001 | ERC-20 instant transfer | [[../../paycodex/concepts/sct-inst]] | ERC-20 | ✅ |
| 002 | ERC-20 transfer with memo (structured ref) | [[../../paycodex/processes/qr-bill-receivable]] | ERC-20 | ✅ |
| 003 | ERC-20 batch transfer (payroll) | [[../../paycodex/concepts/sepa-sct]] | ERC-20 | ✅ |
| 004 | ERC-20 permit (gasless approve) | n/a | ERC-2612 | ✅ |
| 005 | Multi-recipient split disbursement | [[../../paycodex/concepts/sepa-sct]] | ERC-20 | ✅ |
| 006 | T-REX whitelisted transfer | [[../../paycodex/regulations/amld-amlr-amla]] | ERC-3643 | ✅ |
| 007 | Read on-chain balance (camt.052 equivalent) | [[../../paycodex/concepts/iso-20022]] | ERC-20 view | ✅ |
| 008 | Tokenized deposit redemption | [[../../paycodex/concepts/sweep]] | ERC-20 burn | ✅ |
| 009 | Tokenized deposit issuance (mint) | n/a | ERC-20 mint | ✅ |
| 010 | Sanctions blocklist on transfer | [[../../paycodex/concepts/ofac]] | ERC-20 + modifier | ✅ |

## Tier 2 — Multi-step (Moderate)

| # | Use case | Incumbent | ERC |
|---|---|---|---|
| 011 | Atomic FX swap two ERC-20s | [[../../paycodex/concepts/fx-spot]] | ERC-20 + AMM |
| 012 | Limit order swap | [[../../paycodex/concepts/fx-forward]] | ERC-20 + DEX |
| 013 | Recurring payment via smart wallet | [[../../paycodex/concepts/sepa-sdd]] | ERC-4337 |
| 014 | Direct debit mandate as smart contract | [[../../paycodex/concepts/sepa-mandate]] | ERC-2612 + custom |
| 015 | Sweep contract (auto-move excess) | [[../../paycodex/concepts/sweep]] | ERC-20 + custom |
| 016 | ZBA equivalent (master + sub accounts) | [[../../paycodex/concepts/zba]] | factory pattern |
| 017 | Tokenized money market fund (deposit/redeem) | [[../../paycodex/concepts/mmf]] | ERC-4626 |
| 018 | Repo on-chain (collateral + cash) | [[../../paycodex/concepts/repo]] | ERC-20 + ERC-1400 |
| 019 | Tokenized commercial paper | [[../../paycodex/concepts/mmf]] | ERC-1400 |
| 020 | Account abstraction treasury wallet | n/a | ERC-4337 |
| 021 | Multi-sig escrow | [[../../paycodex/processes/sct-inst-receive]] | Gnosis Safe |
| 022 | Time-locked transfer (vesting) | [[../../paycodex/concepts/sweep]] | custom |
| 023 | Conditional payment via oracle | [[../../paycodex/concepts/letter-of-credit]] | Chainlink + ERC-20 |
| 024 | Whitelisted transfer (simple modifier) | [[../../paycodex/concepts/kyc-aml]] | ERC-20 + modifier |
| 025 | KYC token (soulbound) | [[../../paycodex/concepts/kyc-aml]] | ERC-721 + ERC-5192 |
| 026 | Proof-of-reserves attestation | [[../../paycodex/concepts/account-analysis]] | Chainlink PoR |
| 027 | Cross-chain transfer via CCIP (USDC) | [[../../paycodex/processes/originate-cross-border-wire]] | CCIP |
| 028 | Cross-chain via LayerZero | [[../../paycodex/processes/originate-cross-border-wire]] | LayerZero |
| 029 | xERC20 cross-chain | [[../../paycodex/processes/originate-cross-border-wire]] | ERC-7281 |
| 030 | Permit + transferFrom in single tx | n/a | ERC-2612 |

## Tier 3 — Multi-asset, conditional, oracles (Intermediate)

| # | Use case | Incumbent | ERC |
|---|---|---|---|
| 031 | Atomic DvP (security + cash) | [[../../paycodex/processes/securities-cash-leg]] | ERC-1400 + ERC-20 |
| 032 | Tri-party repo automated | [[../../paycodex/concepts/repo]] | ERC-1400 + ERC-20 |
| 033 | SCF on-chain | [[../../paycodex/concepts/supply-chain-finance]] | ERC-721 + ERC-20 |
| 034 | Factoring on-chain | [[../../paycodex/concepts/factoring]] | ERC-721 + ERC-20 |
| 035 | Invoice tokenization | [[../../paycodex/processes/qr-bill-receivable]] | ERC-721 |
| 036 | Tokenized bond issuance | n/a | ERC-1400 / 3643 |
| 037 | Coupon distribution on-chain | [[../../paycodex/concepts/corp-actions-cash]] | ERC-1400 + ERC-20 |
| 038 | Bond redemption at maturity | [[../../paycodex/concepts/corp-actions-cash]] | ERC-1400 + ERC-20 |
| 039 | Letter of credit smart contract | [[../../paycodex/concepts/letter-of-credit]] | escrow + oracle |
| 040 | LC with shipping oracle | [[../../paycodex/concepts/letter-of-credit]] | escrow + Chainlink |
| 041 | Bank guarantee smart contract | [[../../paycodex/concepts/bank-guarantee]] | escrow + oracle |
| 042 | Standby LC with default oracle | [[../../paycodex/concepts/standby-lc]] | escrow + oracle |
| 043 | Documentary collection D/P escrow | [[../../paycodex/concepts/documentary-collection]] | escrow |
| 044 | Documentary collection D/A | [[../../paycodex/concepts/documentary-collection]] | escrow + IOU |
| 045 | Multi-currency notional pool | [[../../paycodex/concepts/sweep]] | multi-token |
| 046 | Intercompany netting | [[../../paycodex/concepts/in-house-bank]] | aggregator |
| 047 | Cash flow forecasting via on-chain agg | [[../../paycodex/processes/intraday-liquidity]] | indexer |
| 048 | Treasury liquidity pool (Curve LP) | [[../../paycodex/concepts/mmf]] | Curve |
| 049 | Stablecoin yield farming | [[../../paycodex/concepts/mmf]] | various DeFi |
| 050 | Repo with margin call automation | [[../../paycodex/concepts/repo]] | oracle + multi-token |

## Tier 4 — Cross-chain, identity, complex compliance (Advanced)

| # | Use case | Incumbent | ERC |
|---|---|---|---|
| 051 | Cross-border instant payment (USDC ↔ EURC) | [[../../paycodex/processes/originate-cross-border-wire]] | swap + bridge |
| 052 | Cross-chain DvP | [[../../paycodex/processes/securities-cash-leg]] | HTLC |
| 053 | T+0 securities settlement | [[../../paycodex/concepts/csdr]] | ERC-1400 + ERC-20 |
| 054 | Dividend distribution to NFT holders | [[../../paycodex/concepts/corp-actions-cash]] | ERC-721 + ERC-20 |
| 055 | Voting rights on tokenized securities | n/a | ERC-1400 + Governor |
| 056 | Corporate action processing on-chain | [[../../paycodex/concepts/corp-actions-cash]] | ERC-1400 |
| 057 | Token recovery / forced transfer | n/a | ERC-3643 admin |
| 058 | Partition transfer (tranches) | [[../../paycodex/concepts/sepa-sdd]] | ERC-1400 |
| 059 | Whitelist via off-chain attestation (EAS) | [[../../paycodex/concepts/kyc-aml]] | EAS |
| 060 | ZK-KYC | [[../../paycodex/concepts/kyc-aml]] | zk-snark |
| 061 | Merkle airdrop (bulk) | [[../../paycodex/concepts/sepa-sct]] | merkle proof |
| 062 | Interest-bearing deposit (per-second linear) | [[../../paycodex/concepts/interest-calculation]] | ERC-20 + custom — see [code/62-interest-bearing-deposit.sol](../code/62-interest-bearing-deposit.sol) ✅ |
| 062b | Compound deposit pool (Aave-style index) | [[../../paycodex/concepts/interest-calculation]] | RAY index — see [code/62b-compound-deposit.sol](../code/62b-compound-deposit.sol) ✅ |
| 062c | Multi-tier rate-source router | [[../../paycodex/concepts/reference-rates]] | oracle composition — see [code/62c-rate-source-router.sol](../code/62c-rate-source-router.sol) ✅ |
| 062d | Rule registry (rule-driven deployment) | n/a | factory pattern — see [code/62d-rule-registry.sol](../code/62d-rule-registry.sol) ✅ |
| 062e | Deposit factory | n/a | factory pattern — see [code/62e-deposit-factory.sol](../code/62e-deposit-factory.sol) ✅ |
| 062f | Tiered-rate deposit (marginal bands) | [[../../paycodex/concepts/account-tier]] | custom — see [code/62f-tiered-rate-deposit.sol](../code/62f-tiered-rate-deposit.sol) ✅ |
| 062g | Floor/cap floating deposit | [[../../paycodex/concepts/negative-interest]] | oracle + bounds — see [code/62g-floor-cap-deposit.sol](../code/62g-floor-cap-deposit.sol) ✅ |
| 063 | Variable rate stablecoin (rebasing) | n/a | ERC-20 rebase |
| 064 | Auto-rebalancing treasury vault | [[../../paycodex/concepts/sweep]] | ERC-4626 |
| 065 | Permissioned-public bridge | [[../../paycodex/processes/originate-cross-border-wire]] | bridge |
| 066 | Tokenized fund subscription / redemption | n/a | ERC-4626 |
| 067 | Tokenized real estate cash flows | n/a | ERC-1400 |
| 068 | Carbon credit settlement | n/a | ERC-721 + ERC-20 |
| 069 | ESG-linked loan with KPI oracle | [[../../paycodex/concepts/esg-linked-loan]] | oracle + variable rate |
| 070 | Sustainability bond with coupon step-up | [[../../paycodex/concepts/sustainability-linked-bond]] | oracle + ERC-1400 |

## Tier 5 — Multi-party orchestration + reg (Complex)

| # | Use case | Incumbent | ERC |
|---|---|---|---|
| 071 | Cross-chain repo | [[../../paycodex/concepts/repo]] | HTLC + multi-chain |
| 072 | Multi-bank syndicated loan | n/a | multi-sig + ERC-20 |
| 073 | Trade finance multi-stage doc release | [[../../paycodex/concepts/letter-of-credit]] | state machine |
| 074 | Forfaiting on-chain | [[../../paycodex/concepts/forfaiting]] | ERC-721 + market |
| 075 | Securitization SPV on-chain | n/a | multi-asset pool |
| 076 | Tokenized fund-of-funds | n/a | ERC-4626 nested |
| 077 | Dynamic NFT for receivable status | [[../../paycodex/processes/ar-reconciliation]] | ERC-721 |
| 078 | Permissioned ↔ public settlement bridge | [[../../paycodex/concepts/wire]] | bridge |
| 079 | Wholesale CBDC ↔ stablecoin bridge | [[../../paycodex/concepts/wholesale-cbdc]] | bridge |
| 080 | Multi-CBDC corridor (mBridge-style) | [[../../paycodex/concepts/mbridge]] | multi-chain |
| 081 | Tokenized correspondent network | [[../../paycodex/processes/originate-cross-border-wire]] | network of issuers |
| 082 | Programmable liquidity pool with KYC | [[../../paycodex/concepts/sweep]] | T-REX + AMM |
| 083 | AML transaction monitoring on-chain | [[../../paycodex/concepts/kyc-aml]] | hooks + oracles |
| 084 | SAR auto-flagging via on-chain rules | [[../../paycodex/concepts/kyc-aml]] | event watcher |
| 085 | Travel Rule message exchange | [[../../paycodex/regulations/wtr-travel-rule]] | TRP/TRISA |
| 086 | Sanctions screening at smart contract | [[../../paycodex/concepts/ofac]] | Chainalysis oracle |
| 087 | Compliance-as-a-service oracle | n/a | oracle |
| 088 | Fraud scoring oracle | [[../../paycodex/controls/fraud-scoring-control]] | oracle |
| 089 | Atomic FX settlement (CLS-style) | [[../../paycodex/concepts/cls]] | atomic swap |
| 090 | Same-day securities settlement | [[../../paycodex/concepts/csdr]] | ERC-1400 + cash |

## Tier 6 — Frontier / research-grade (Expert)

| # | Use case | Incumbent | Tech |
|---|---|---|---|
| 091 | Confidential transfer (Aztec / FHE) | n/a | zk |
| 092 | ZK proof of compliance for transfer | [[../../paycodex/regulations/wtr-travel-rule]] | zk |
| 093 | AA with social recovery for corp | n/a | ERC-4337 + guardians |
| 094 | Modular blockchain stack (DA Celestia) | n/a | rollup framework |
| 095 | Multi-party computation custody | n/a | MPC |
| 096 | Threshold signatures for treasury | n/a | TSS |
| 097 | Programmable money multi-compliance | n/a | T-REX + composable |
| 098 | Diamond pattern tokenization platform | n/a | ERC-2535 |
| 099 | AI-assisted smart contract audit | n/a | AI tooling |
| 100 | Quantum-safe migration strategy | n/a | post-quantum |

## How to use

- Start at #001 — get an instant transfer working
- Walk up the ladder
- Each row links to incumbent equivalent — see what DLT changes vs same outcome on incumbent rail

← [[../README]]
