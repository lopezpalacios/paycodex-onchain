# 07 — Custody, fund administration, NAV pipeline

The bridge between regulated fund infrastructure (custody, fund admin, transfer agent) and the on-chain register is the operational backbone of a tokenized MMF.

## 1. Qualified custody

- Underlying assets (T-bills, repo, cash) held at qualified custodians per regime.
- Segregation, asset registration, sub-custody arrangements documented.
- Daily reconciliation between custodian and fund administrator.

## 2. Fund administrator

- NAV calculation, fund accounting, valuation.
- Daily NAV strike per MMF regime.
- Period-end procedures.
- Investor reporting.

## 3. Transfer agent

- Historically off-chain; in tokenized form, the chain register often serves transfer-agent functions under regulator-blessed arrangement.
- Investor register integrity; chain-on-chain register reconciliation.
- Ownership-record finality clarified in legal docs.

## 4. NAV pipeline

- Fund admin computes NAV; signed and published on-chain via oracle / privileged role.
- Drift checks against fund-admin records at every cycle.
- Stale-NAV detection blocks subscriptions and redemptions.
- Multi-source corroboration where the design requires.

## 5. Subscription mechanics

- Investor sends cash leg (USDC / wire / tokenized deposit).
- Cash receipt confirmed; tokens minted to attested wallet.
- Idempotent on subscription reference.
- Cut-off times aligned with NAV cycles.

## 6. Redemption mechanics

- Investor returns tokens.
- Tokens burned; cash leg paid (USDC / wire / tokenized deposit).
- Cut-off times aligned with NAV cycles for off-chain payouts.
- 24/7 redemption against on-chain cash legs (USDC) where the design supports.

## 7. Cash-leg integration

- USDC / EURC: instant on-chain settlement.
- USD wires: standard ACH / Fedwire processing.
- Tokenized deposits: where the bank counterparty supports.
- Reconciliation across cash-leg types.

## 8. Reconciliation

- On-chain `totalSupply()` vs fund register: continuous.
- Fund register vs custodian holdings: daily.
- Custodian holdings vs GL: daily.
- Drift triggers Sev 1 incident.

## 9. Reporting feeds

- Daily NAV and AUM reporting.
- Investor-statement generation.
- Regulator reporting feeds (ESMA / SEC / MAS / FCA).

## 10. Reference data

- Investor ID ↔ wallet ↔ counterparty bank account.
- Fund vehicle ↔ contract address ↔ ticker.
- Subscription / redemption reference ↔ on-chain transaction hash.

## Cross-links

[`./README.md`](./README.md) · [`01-technical.md`](./01-technical.md) · [`04-operational.md`](./04-operational.md) · [`09-data-reporting.md`](./09-data-reporting.md)
