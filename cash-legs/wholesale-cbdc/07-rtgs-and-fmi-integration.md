# 07 — RTGS and FMI integration

The wholesale CBDC bridges two systems: the central bank's RTGS (where reserves are held) and the FMI's DLT (where wCBDC tokens settle). Subscription and redemption move balances between the two. Settlement happens entirely on the DLT.

## 1. Subscription mechanics

- Bank initiates subscription request to the CB / FMI.
- RTGS reserve account debited (e.g., SIC, T2, Fedwire reserve account).
- CB / FMI mints wCBDC to the bank's on-chain wallet.
- Confirmation flows back; bank's internal sub-ledger updated.
- Idempotent on RTGS reference + on-chain transaction hash.

## 2. Redemption mechanics

- Bank submits on-chain redemption / burn request.
- wCBDC tokens burned; CB / FMI receives the burn confirmation.
- RTGS reserve account credited.
- Internal sub-ledger updated.

## 3. Settlement on the DLT

- DvP atomic swap with tokenized securities (Helvetia / SDX model): cash leg locks, securities leg releases, both settle atomically.
- PvP atomic swap between wCBDCs of different currencies (Mariana / mBridge model).
- Conditional settlement via CB-approved smart contract templates.
- Settlement instruction submitted via signed transaction; finality on consensus confirmation (typically deterministic BFT).

## 4. Sub-ledger and GL

- Dedicated sub-ledger for wCBDC balances.
- Daily journal posting to GL.
- Reconciliation against RTGS account, on-chain wallet, and CB / FMI statements.
- Period-end balances tied out across all three.

## 5. Liquidity management

- Real-time visibility of wCBDC balances in intraday liquidity dashboards.
- Subscription and redemption forecasting based on settlement pipeline.
- Pre-funding strategy for high-volume settlement events.

## 6. Reference data

- Bank participant ID ↔ on-chain wallet ↔ RTGS account.
- Settlement reference ↔ on-chain transaction hash ↔ securities settlement reference (for DvP).
- Cross-CBDC mapping (currency codes, FX references) for multi-CBDC platforms.

## 7. End-of-day cycles

- DLT EOD coordinated with RTGS EOD.
- Holiday calendars and off-hours availability documented.
- CB-side balance-sheet consolidation aligned to bank's internal close.

## 8. Reporting feeds

- Real-time risk and ops dashboards.
- Daily liquidity report including wCBDC balances.
- Settlement-pipeline reporting.
- Regulatory reporting feeds.

## 9. APIs and connectivity

- mTLS / IPsec connectivity to FMI / CB endpoints.
- Redundant network paths and providers.
- API rate limits and load testing in pre-prod.

## 10. Migration / coexistence

- Coexistence with classical RTGS-only settlement during pilot.
- Phased rollout: closed pilot → expanded participants → full live.
- Decommissioning plan if a CB ends a wCBDC programme.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`04-operational.md`](./04-operational.md) · [`09-data-reporting.md`](./09-data-reporting.md)
