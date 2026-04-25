# Checks-Effects-Interactions

Standard Solidity pattern. Order:

1. **Checks** — require statements
2. **Effects** — state updates
3. **Interactions** — external calls (where reentrancy enters)

## Why

If interaction reenters, state is already updated, so second-call requires re-pass conditions and finds different state.

## Linked

[[reentrancy]]
