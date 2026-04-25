# Oracles

Bridge between off-chain data + on-chain smart contracts.

## Use cases for cash mgmt

- FX rates (for hedge accounting check, conditional payment)
- Reference rates (SOFR, ESTR — for variable rate loans)
- Sanctions list updates (push to on-chain blocklist)
- Shipment confirmations (LC release trigger)
- Default oracle (SBLC trigger)
- ESG KPI feed (sustainability-linked loan margin step)

## Vendors

- [[chainlink]] — dominant
- Pyth — pull-based, fast
- Redstone — modular
- UMA — optimistic oracle (dispute-resolution model)
- API3 — first-party oracles

## Linked

[[chainlink]] · [[../use-cases/023-conditional-payment-oracle-trigger]]
