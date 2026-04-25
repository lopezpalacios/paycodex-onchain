// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: batch payroll / supplier disbursement. Single tx, many recipients.
// Equivalent: SEPA bulk SCT or Bacs bulk credit.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BatchPayout {
    /// @notice Pay many recipients in a single tx. Saves gas vs N separate transfers.
    /// @param token ERC-20 to send.
    /// @param recipients Array of beneficiary addresses.
    /// @param amounts Parallel array of amounts (must match recipients.length).
    function batchTransfer(
        IERC20 token,
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external {
        require(recipients.length == amounts.length, "length mismatch");
        uint256 total;
        unchecked {
            for (uint256 i; i < amounts.length; ++i) total += amounts[i];
        }
        // Pull total once, then disburse — minimizes external calls.
        require(token.transferFrom(msg.sender, address(this), total), "pull failed");
        for (uint256 i; i < recipients.length; ++i) {
            require(token.transfer(recipients[i], amounts[i]), "push failed");
        }
        emit BatchPaid(msg.sender, recipients.length, total);
    }

    event BatchPaid(address indexed payer, uint256 count, uint256 total);
}
