# Reentrancy

Smart contract attack — recursive call before state update. Famous: DAO hack 2016.

## Defense

- Checks-Effects-Interactions pattern
- ReentrancyGuard modifier (OpenZeppelin)
- Pull over push for value

## Linked

[[checks-effects-interactions]]
