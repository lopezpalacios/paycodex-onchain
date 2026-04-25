# 01 — DLT fundamentals

Distributed Ledger Technology overview, framed for cash-management strategist.

## What

Append-only state replicated across N nodes, no single operator. Consensus protocol decides which writes get accepted. Public DLT = permissionless validators; permissioned DLT = whitelisted validators.

## Why for cash management

| Property | Incumbent rails | DLT/EVM |
|---|---|---|
| Settlement finality | Per-rail (T2 sec, SWIFT days) | Atomic on-chain finality (L1 ~12min; L2 secs to mins) |
| Programmability | Scheme rulebooks; rigid | Smart contracts — Turing-complete logic |
| Hours | Cutoffs per rail | 24/7/365 native |
| Reconciliation | Bilateral nostro chains | Single shared ledger |
| Composability | Per-rail bilateral integration | Money + assets + identity composable in one transaction |
| Settlement risk | Limited (CLS for FX, T2S for sec) | Atomic swap baked in |
| Audit trail | Per-bank, per-system | Immutable cryptographic |

## Trade-offs

- **Privacy** — public chains expose flow. Mitigation: private chains, ZK proofs (zk-SNARKs / zk-STARKs / FHE).
- **Reg uncertainty** — improving (MiCA, FINMA DLT Act, EU DLT Pilot Regime). Travel Rule applied via off-chain protocols.
- **Scaling + cost** — L1 expensive ($1-50/tx); L2s solve ($0.001-0.10) but trust assumptions evolve.
- **Key management** — bearer instrument; lose keys, lose funds. MPC + AA mitigates.
- **Bug immutability** — broken contract = trapped funds. Upgradeable proxy + audit + insurance mitigate.

## Cross-link

Compare to incumbent rails: [[../paycodex/comparisons/rails-matrix]]

## Linked

[[02-evm-stack]] · [[03-cash-legs-comparison]] · [[concepts/ethereum-l1]] · [[concepts/permissioned-chains]]
