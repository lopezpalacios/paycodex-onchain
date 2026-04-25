// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: atomic swap of two ERC-20s at agreed rate. Equivalent to FX spot.
// Single tx — both legs settle or neither (PvP).

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FxSwap {
    /// @notice Atomic swap. Both parties pre-approve their token to this contract.
    /// @param tokenA Token Alice gives.
    /// @param amountA How much Alice gives.
    /// @param tokenB Token Bob gives.
    /// @param amountB How much Bob gives.
    /// @param alice  Counterparty A address.
    /// @param bob    Counterparty B address.
    function swap(
        IERC20 tokenA, uint256 amountA,
        IERC20 tokenB, uint256 amountB,
        address alice, address bob
    ) external {
        // Pull both legs. If either fails, whole tx reverts — atomic.
        require(tokenA.transferFrom(alice, bob, amountA), "leg A failed");
        require(tokenB.transferFrom(bob, alice, amountB), "leg B failed");
        emit FxSwapped(alice, bob, address(tokenA), amountA, address(tokenB), amountB);
    }

    event FxSwapped(
        address indexed alice,
        address indexed bob,
        address tokenA,
        uint256 amountA,
        address tokenB,
        uint256 amountB
    );
}
