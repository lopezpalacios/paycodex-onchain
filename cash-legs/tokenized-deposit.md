# Tokenized commercial bank deposit

Bank issues token representing customer's deposit at the bank. Same legal status as DDA.

## Major examples

| Token | Bank | Chain | Status |
|---|---|---|---|
| JPMD | JPMorgan | Onyx (private Quorum) | Live, internal use |
| EURCV | Société Générale-FORGE | Public chains + private | MiCA-compliant, live |
| DCHF | Sygnum | Polygon + private | Swiss bank-issued |
| Banco Santander tokenized deposits | Santander | Internal | Pilot |
| HSBC Tokenised Deposit Service | HSBC | Onyx-like | Pilot |

## Vs stablecoin

- **Tokenized deposit** = bank's customer balance (commercial bank money)
- **Stablecoin** = e-money issued by non-bank (or bank-EMI subsidiary)
- Different prudential treatment, different deposit insurance, different bankruptcy treatment

## Use

- Internal interbank settlement (JPM Onyx between corporate clients)
- Trade finance settlement leg
- Securities cash leg in DvP (without wholesale CBDC)
- Multi-bank: each bank issues, settled via interbank netting + transfers between issuers

## Compliance shape

- Permissioned chain typical (only bank's KYC'd customers hold)
- T-REX-style transfer restrictions
- Bank can freeze + claw back

## Linked

[[stablecoin-public]] · [[wholesale-cbdc]] · [[../standards/erc-3643-trex]]
