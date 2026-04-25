// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: ERC-2612 permit. Owner signs message off-chain;
// spender submits permit + transferFrom in one tx. No gas tx from owner.

import {IERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Permit.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PermitDemo {
    /// @notice Pull funds from `owner` using a permit signature, then transfer to `to`.
    /// @dev `owner` paid no gas. Spender (msg.sender) submits and pays.
    function permitAndTransfer(
        IERC20Permit permitToken,
        address owner,
        address to,
        uint256 amount,
        uint256 deadline,
        uint8 v, bytes32 r, bytes32 s
    ) external {
        // Apply the off-chain signed approval. Reverts if nonce stale or expired.
        permitToken.permit(owner, address(this), amount, deadline, v, r, s);
        // Now allowed — execute transferFrom.
        require(IERC20(address(permitToken)).transferFrom(owner, to, amount), "transfer failed");
    }
}
