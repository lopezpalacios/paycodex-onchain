# MPC custody

Multi-Party Computation. Private key never reconstructed; signatures via secret-sharing protocol.

## Vendors

- Fireblocks
- Copper
- Anchorage
- BitGo (variants)
- Ledger Enterprise

## Vs HSM

- HSM = single physical box, single key
- MPC = key distributed across N parties; m-of-n signs
- MPC has flexibility (rotate parties, change threshold) HSMs lack

## Use for bank

- Hot wallet for high-volume tx
- Threshold m-of-n approval for large tx
- Disaster recovery (lose one party, m-1 still works)

## Linked

[[hsm-custody]]
