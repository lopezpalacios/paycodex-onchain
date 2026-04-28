# 06 — Risk management and capital

Wholesale CBDC is the highest-tier money: zero credit risk to the holder. The bank's risk surface is therefore concentrated in operational, cyber, and intraday-liquidity risk on the participation leg, plus settlement and counterparty risk on the underlying flows.

## 1. Capital treatment

- wCBDC is central bank money — zero risk-weight under Basel.
- No additional capital charge from holding wCBDC itself.
- Operational and cyber risk capital (Basel ORC) accounts for the new technology and integration risk.
- ICAAP captures the wCBDC operating posture under operational and reputational risk.

## 2. Liquidity treatment

- LCR: wCBDC counts as Level 1 HQLA (cash at central bank).
- NSFR: highest-quality stable funding asset.
- Intraday liquidity: factor wCBDC subscription / redemption mechanics into intraday monitoring.
- 24/7 DLT operations vs. RTGS hours create timing mismatches; size buffers accordingly.

## 3. Risk taxonomy

- **Operational** — DLT outage, integration failure, key compromise, EOD-cycle mishandling.
- **Cyber** — wallet key compromise, smart contract exploit (CB-template bug), connectivity attack.
- **Settlement** — DvP failure, atomic-swap failure, partial settlement.
- **Intraday liquidity** — settlement demand spikes during constrained RTGS hours.
- **Concentration** — heavy reliance on a single FMI / DLT operator.
- **Cross-border / multi-CBDC** — host-state and FX-regime stress; Travel Rule failure.
- **Reputational** — high-visibility incident on a CB platform.

## 4. Risk appetite

- KRIs:
  - Settlement-finality breaches (target 0).
  - Subscription / redemption failed-attempt rate.
  - Reconciliation drift (target 0).
  - Time-to-detect anomaly.
  - Key-ceremony quorum integrity.
  - Intraday liquidity buffer utilisation.

## 5. Stress testing

- DLT outage scenarios (1h, 4h, 24h).
- Atomic-swap failure storm.
- Multi-CBDC platform partial outage.
- Cross-border AML escalation.
- Counterparty-bank default mid-settlement.

## 6. Recovery and resolution

- Inclusion in RRP: wCBDC participation continuity, key-recovery, FMI default participation.
- Resolution-friendly: ability for resolution authority to assume positions; ability of acquirer to take over participation.

## 7. Insurance

- Crime / specie covering key compromise.
- Cyber insurance covering wCBDC integration.
- D&O cover.

## 8. Risk reporting

- Daily KRI dashboard.
- Monthly risk pack to risk committee.
- Quarterly to board.
- Sev 1 ad-hoc.

## 9. Model risk

- Intraday liquidity model on wCBDC participation.
- Settlement-failure cost model.
- Annual revalidation.

## 10. Concentration management

- Where multiple wCBDC platforms overlap, allocation policy across them.
- Correspondent / agent dependencies on participating banks.

## Cross-links

[`./README.md`](./README.md) · [`02-regulatory.md`](./02-regulatory.md) · [`07-rtgs-and-fmi-integration.md`](./07-rtgs-and-fmi-integration.md) · [`08-governance-controls.md`](./08-governance-controls.md) · [`../../compliance/basel-iii-crypto.md`](../../compliance/basel-iii-crypto.md)
