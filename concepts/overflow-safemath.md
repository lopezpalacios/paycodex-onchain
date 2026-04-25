# Integer overflow / SafeMath

Solidity <0.8.0: overflow silently wrapped. Caused bugs.

## Solution

- Solidity 0.8.0+ reverts on overflow
- Use `unchecked {}` block ONLY when you've proven no overflow possible
- SafeMath library historical (pre-0.8.0)

## Linked

[[gas-optimization]]
