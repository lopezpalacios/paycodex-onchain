// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: customer redeems tokenized deposit. Token burned, off-chain bank credits DDA.
// Bank's redemption oracle / operator listens for the event and triggers fiat payout.

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract RedeemableDeposit is ERC20, Ownable {
    constructor() ERC20("Bank Deposit", "BD") Ownable(msg.sender) {}

    /// @notice Customer requests redemption. Token burned. Bank fulfills off-chain.
    /// @param payoutDestination IBAN or alternative routing reference (encoded).
    function redeem(uint256 amount, bytes32 payoutDestination) external {
        _burn(msg.sender, amount);
        emit RedeemRequested(msg.sender, amount, payoutDestination, block.timestamp);
    }

    /// @dev Bank's off-chain operator subscribes; on receipt, executes fiat payout via SEPA / SIC / etc.
    event RedeemRequested(
        address indexed customer,
        uint256 amount,
        bytes32 indexed payoutDestination,
        uint256 timestamp
    );

    /// @notice Bank-only mint (deposit booking).
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
