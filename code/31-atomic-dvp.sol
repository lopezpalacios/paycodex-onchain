// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Atomic DvP — buyer sends cash, seller sends security, both in one tx.
// Equivalent to T2S DvP Model 1.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AtomicDvP {
    /// @notice Atomic delivery versus payment. Both legs must succeed or whole tx reverts.
    /// @param cash      Cash leg token (e.g., wholesale CBDC, tokenized deposit, USDC).
    /// @param cashAmt   Cash amount.
    /// @param security  Security token (ERC-20-compatible — could be ERC-1400 wrapper).
    /// @param secAmt    Security amount.
    /// @param buyer     Receives security.
    /// @param seller    Receives cash.
    function settle(
        IERC20 cash, uint256 cashAmt,
        IERC20 security, uint256 secAmt,
        address buyer, address seller
    ) external {
        // Atomic — both legs in single tx.
        require(cash.transferFrom(buyer, seller, cashAmt), "cash leg failed");
        require(security.transferFrom(seller, buyer, secAmt), "security leg failed");
        emit Settled(buyer, seller, address(cash), cashAmt, address(security), secAmt);
    }

    event Settled(
        address indexed buyer,
        address indexed seller,
        address cash,
        uint256 cashAmt,
        address security,
        uint256 secAmt
    );
}
