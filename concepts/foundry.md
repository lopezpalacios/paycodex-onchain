# Foundry

Solidity toolkit. Forge (test), Cast (CLI), Anvil (local node), Chisel (REPL).

## Key features

- Tests written in Solidity (not JS like Hardhat)
- Fast (Rust-based)
- Fuzz testing built-in
- Invariant testing
- Mainnet forking

## Use for cash mgmt demos

- Snippets in this graph designed to run via `forge test`
- Mainnet fork = test against real USDC, real Uniswap

## Sample test

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BankIssuedToken} from "../src/BankIssuedToken.sol";

contract BankIssuedTokenTest is Test {
    BankIssuedToken token;
    address treasurer = address(0x1);
    address user = address(0x2);

    function setUp() public {
        token = new BankIssuedToken("BankUSD", "BUSD");
    }

    function testMint() public {
        token.mint(user, 1_000_000e18);
        assertEq(token.balanceOf(user), 1_000_000e18);
    }
}
```

## Linked

[[hardhat]] · [[solidity]] · [[../code/README]]
