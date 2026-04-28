# Tokenized commercial bank deposit

A tokenized deposit is a digital bearer-style representation of a commercial bank deposit, issued on a distributed ledger by a chartered/licensed deposit-taking institution. Legally and prudentially the underlying claim is identical to a standard demand deposit account (DDA): the holder has a direct claim on the issuing bank, the deposit sits on the bank's balance sheet as a liability, and (where applicable) it remains within the perimeter of national deposit insurance schemes.

Tokenization is a representation layer, not a new form of money. The token is a programmable, transferable record that points to (or directly constitutes, depending on legal construction) the underlying deposit liability.

## Why tokenized deposits exist

Commercial banks need an on-chain settlement primitive that:

1. Preserves commercial bank money status (so balance-sheet, capital, deposit insurance, and bankruptcy rules are unchanged).
2. Allows programmable settlement (atomic DvP, conditional payments, smart-contract-driven cash legs).
3. Operates 24/7/365 vs. RTGS hours, reducing settlement risk windows (Herstatt risk in FX, T+1/T+2 risk in securities).
4. Composes with other on-chain assets (tokenized securities, tokenized MMFs, stablecoins under controlled bridges).
5. Stays inside the bank's KYC perimeter (only onboarded customers hold/transfer the token).

Stablecoins, e-money tokens, and wholesale CBDC each solve adjacent problems, but only tokenized deposits keep the cash leg fully inside the commercial-banking regime.

## Major live + pilot examples

| Token | Issuer | Chain | Status | Notes |
|---|---|---|---|---|
| JPMD / Onyx Coin Systems | JPMorgan Chase | Onyx (private permissioned Quorum) | Live, internal + select corporate clients | Used for intraday repo + cross-border treasury moves; reportedly multi-bn USD daily flows |
| EURCV | Société Générale-FORGE | Public (Ethereum) + private | Live, MiCA-compliant EMT framing | One of the first regulated euro on public chain by a SIFI |
| DCHF | Sygnum Bank | Polygon + private | Live, Swiss FINMA-supervised | Swiss chartered bank, DLT Act regime |
| HSBC Tokenised Deposit Service | HSBC | HSBC Orion-style permissioned | Pilot/limited prod | Treasury + trade finance focus |
| Banco Santander tokenized deposits | Santander | Internal permissioned | Pilot | Linked to Santander DLT bond issuances |
| Citi Token Services | Citi | Permissioned | Live for select corporates | 24/7 cross-border + trade finance triggers |
| BNY Mellon (announced) | BNY | Permissioned | Build phase | Tied to tokenized collateral mobility |
| DBS Token Services | DBS | Permissioned (ConsenSys-stack) | Live | Treasury + trade |
| MAS Project Guardian deposit pilots | OCBC, UOB, SCB et al. | Mixed | Pilot | Cross-currency tokenized deposit experiments |

## Tokenized deposit vs. adjacent instruments

| Dimension | Tokenized deposit | Stablecoin (EMT/MiCA) | Wholesale CBDC | Tokenized MMF |
|---|---|---|---|---|
| Issuer | Licensed bank | EMI / regulated stablecoin issuer | Central bank | Asset manager |
| Money type | Commercial bank money | E-money | Central bank money | Fund unit (cash-equivalent) |
| Backing | Bank's balance sheet (fractional, capital-backed) | Segregated 1:1 reserves (HQLA) | Central bank itself | Underlying T-bills/repos |
| Deposit insurance | Yes (where applicable) | No | N/A (CB liability) | No |
| Bankruptcy treatment | Senior unsecured deposit claim | Bankruptcy-remote reserve pool | N/A | Fund-level NAV |
| Yield | Possible (interest-bearing deposit) | Generally no (or restricted) | Policy-rate aligned | Yes (T-bill yield) |
| Holder universe | KYC'd customers of issuing bank | Open or restricted depending on issuer | Banks + select FMIs | KYC'd investors |
| Chain typology | Permissioned (mostly) | Public (mostly) | Permissioned | Permissioned/hybrid |
| Programmability | High | High | High | Medium |
| Cross-bank fungibility | No (each bank's token is distinct) | Yes (one issuer, many holders) | Yes (one CB issuer) | No |
| Capital treatment for holders | Bank deposit (low risk-weight if SIFI counterparty) | Crypto-asset (Basel Group 1b/2 depending) | Cash | Fund holding |

Key implication: tokenized deposits are **single-issuer instruments**. JPMD ≠ EURCV ≠ DCHF. Multi-bank settlement requires either (a) interbank netting + correspondent transfers, (b) a shared platform with FX/PvP between deposit tokens, or (c) a wholesale CBDC settlement layer.

## Operating models

### Model A — Single-bank closed loop
- One issuing bank, KYC'd customers only, permissioned chain.
- Internal use case: 24/7 intra-group treasury, intraday liquidity, payroll on weekends.
- Lowest regulatory friction; closest to existing DDA bookkeeping.

### Model B — Multi-bank shared ledger (consortium)
- Multiple issuing banks on a shared permissioned chain.
- Each bank issues its own token; transfers across banks settle via on-chain swap + off-chain (or on-chain) interbank netting.
- Examples: Partior, Fnality (note: Fnality is technically a wholesale CBDC-adjacent model), MAS Project Guardian.

### Model C — Permissioned-to-public bridge
- Tokenized deposit lives on permissioned chain.
- A controlled bridge (mint/burn against a public-chain wrapped representation) allows DvP with public-chain tokenized assets.
- Highest legal complexity; requires explicit regulator dialogue.

### Model D — Public-chain native with allowlist (ERC-3643/T-REX)
- Bank issues directly on public Ethereum (or L2) with on-chain identity gating.
- EURCV is closest to this model.
- Requires robust on-chain compliance primitives + mature key management.

## Lifecycle

1. **Onboarding** — Customer KYC'd at the bank; wallet address attested + linked to customer identity (on-chain identity contract or off-chain registry).
2. **Issuance (mint)** — Customer's DDA debited; equivalent token minted to attested wallet. Mint event references the source bank ledger entry (e.g., camt.054 end-to-end ID) to guarantee one-to-one mapping.
3. **Transfer** — On-chain transfer between attested wallets. Compliance hooks (allowlist, sanctions screening, transfer-limit, jurisdiction rules) enforce policy at transfer time.
4. **Programmable use** — Token used as cash leg in DvP, atomic swap, conditional payment, escrow, payroll automation, etc.
5. **Redemption (burn)** — Customer requests redemption; token burned; bank credits DDA (or external account via SEPA/SIC/Fedwire/SWIFT). Burn event triggers off-chain payout via the bank's payment-rail integration.
6. **Reconciliation** — Continuous reconciliation between on-chain supply and off-chain liability ledger. Any drift requires immediate freeze and investigation.
7. **Lifecycle events** — Freeze, force-transfer (court order), clawback (fraud/AML), key rotation, recovery (lost wallet → reissue to new attested wallet).

## Reference architecture

```
+-------------------+      +------------------------+      +---------------------+
|  Core Banking     |<---->|  Tokenization Engine   |<---->|  Permissioned DLT   |
|  (DDA / GL)       |      |  (mint/burn orchestr.) |      |  (smart contracts)  |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^         ^                       ^
        |                          |         |                       |
        v                          v         v                       v
+-------------------+      +------------------------+      +---------------------+
|  Payments rails   |      |  Identity / KYC        |      |  Customer wallets   |
|  (SEPA/SIC/FED)   |      |  (on-chain attestation)|      |  (custody / MPC)    |
+-------------------+      +------------------------+      +---------------------+
        ^                          ^                                 ^
        |                          |                                 |
        v                          v                                 v
+-------------------+      +------------------------+      +---------------------+
|  Reconciliation   |      |  Sanctions / AML / TM  |      |  HSM / Key mgmt     |
+-------------------+      +------------------------+      +---------------------+
```

The tokenization engine is the system-of-record bridge: it owns the bidirectional invariant that on-chain supply equals the deposit liability sub-ledger at all times.

## Smart contract surface (minimum viable)

- `mintOnDeposit(customer, amount, fiatReference)` — only callable by bank's mint-operator role; idempotent on `fiatReference`.
- `redeem(amount, payoutDestination)` — burns tokens, emits redemption intent.
- `freeze(address)` / `unfreeze(address)` — compliance role; halts transfers from a wallet.
- `forceTransfer(from, to, amount, reason)` — court order / regulator-mandated transfer.
- `pause()` / `unpause()` — global circuit breaker (incident response).
- Transfer hooks: allowlist check, sanctions check, jurisdictional rule check, per-wallet limit check.
- Events for every state-changing call (auditor + reconciliation feed).

See [`../code/09-tokenized-deposit-mint.sol`](../code/09-tokenized-deposit-mint.sol) and [`../code/08-tokenized-deposit-redeem.sol`](../code/08-tokenized-deposit-redeem.sol) for reference implementations.

## Use cases

- **Intraday liquidity / sweeping** — 24/7 treasury moves between subsidiaries.
- **Trade finance settlement leg** — atomic against a tokenized bill of lading or letter of credit.
- **Securities DvP** — cash leg in a tokenized bond/equity issuance, when wholesale CBDC is unavailable.
- **Cross-border B2B** — corp-to-corp payments where both ends are KYC'd by participating banks.
- **Payroll and supplier payments** — programmable disbursement (e.g., release on delivery confirmation).
- **Margin and collateral mobility** — instantly mobilizable cash collateral against tokenized securities.
- **Conditional/escrowed payments** — milestone-based release in M&A, real estate, project finance.

## Compliance and regulatory shape (summary)

- Banking license remains primary authorization; tokenization is a *form* of holding the deposit, not a new license category in most jurisdictions.
- AML/CFT obligations apply to every transfer, even on-chain — Travel Rule data must flow alongside the transfer or via paired off-chain rail.
- T-REX-style transfer restrictions + on-chain identity (ERC-3643) are the dominant compliance pattern.
- The bank retains the ability to freeze, force-transfer, and claw back — non-negotiable for supervisory acceptance.
- Capital treatment: typically unchanged from the underlying DDA; the *tokenized representation* does not add capital charge if structurally identical to the deposit. Operational and tech risk capital may apply (Basel ORC).

For the full requirements set, see the linked subdirectory below.

## Risks (non-exhaustive)

- **Reconciliation drift** — on-chain supply diverges from off-chain liability ledger. Mitigation: continuous reconciliation, incident-response playbook, freeze-on-drift policy.
- **Key compromise** — operator keys (mint/burn/freeze) compromise = systemic risk. Mitigation: HSM, MPC, multi-sig with role separation, hardware-rooted approvals.
- **Smart contract risk** — code bug enables unauthorized mint/burn/freeze. Mitigation: formal verification, multi-firm audits, upgradeability with timelock + pause guardian.
- **Identity / allowlist drift** — sanctioned address slips through. Mitigation: real-time sanctions screening on transfer + periodic re-screen of holder set.
- **Bridge risk** (Model C) — wrapped representation desynchronizes from canonical. Mitigation: minimal trust assumptions, attestation oracles, daily proof-of-reserves.
- **Run risk** — coordinated mass redemption stresses bank liquidity. Mitigation: redemption-rate limits, intraday liquidity facility, monitoring alerts.
- **Operational / change risk** — protocol upgrade breaks downstream integrations. Mitigation: staged rollout, dual-running old/new contracts during transition.

## Onboarding requirements (linked)

The full onboarding stack a bank must satisfy to launch a tokenized deposit programme is broken out in the [`tokenized-deposit/`](./tokenized-deposit/README.md) subdirectory:

- [Technical requirements](./tokenized-deposit/01-technical.md)
- [Regulatory requirements](./tokenized-deposit/02-regulatory.md)
- [Compliance, AML / CFT, sanctions, KYC](./tokenized-deposit/03-compliance-aml-kyc.md)
- [Operational requirements](./tokenized-deposit/04-operational.md)
- [Legal and contractual requirements](./tokenized-deposit/05-legal-contractual.md)
- [Risk management and capital](./tokenized-deposit/06-risk-capital.md)
- [Core banking and payments integration](./tokenized-deposit/07-integration-core-banking.md)
- [Governance, controls, internal audit](./tokenized-deposit/08-governance-controls.md)
- [Data, accounting, regulatory reporting](./tokenized-deposit/09-data-reporting.md)
- [Security and cyber](./tokenized-deposit/10-security-cyber.md)

## Linked

[[stablecoin-public]] · [[wholesale-cbdc]] · [[../standards/erc-3643-trex]] · [[../standards/erc-20]] · [[../architecture/tokenization-platform-pattern]] · [[../architecture/bank-dlt-rail-pattern]] · [[../architecture/permissioned-public-bridge-pattern]] · [[../integrations/core-banking-tokenization-pattern]] · [[../concepts/proof-of-reserves]] · [[../decisions/0002-cash-leg-strategy]] · [[../compliance/basel-iii-crypto]] · [[../compliance/mica-eu]] · [[../compliance/finma-dlt-act]]
