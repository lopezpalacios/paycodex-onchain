# Upgradeable proxy patterns

Smart contracts are immutable. Upgrade via proxy:

- **UUPS** ([[uups]]) — upgrade logic in implementation
- **Transparent** ([[transparent-proxy]]) — upgrade logic in proxy admin
- **Beacon** — multiple proxies share single beacon pointer
- **Diamond** ([[../standards/erc-2535]]) — modular, multi-facet

## Linked

[[uups]] · [[transparent-proxy]] · [[../standards/erc-1967]]
