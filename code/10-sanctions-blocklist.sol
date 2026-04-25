// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: ERC-20 with on-chain OFAC-style sanctions blocklist.
// Real-world: USDC has freeze() function; this is a similar pattern via blocklist.

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

contract BlocklistedToken is ERC20, AccessControl {
    bytes32 public constant SANCTIONS_ADMIN = keccak256("SANCTIONS_ADMIN");
    mapping(address => bool) public blocked;

    constructor() ERC20("Compliant Cash", "CCASH") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(SANCTIONS_ADMIN, msg.sender);
    }

    function block_(address account) external onlyRole(SANCTIONS_ADMIN) {
        blocked[account] = true;
        emit Blocked(account);
    }

    function unblock(address account) external onlyRole(SANCTIONS_ADMIN) {
        blocked[account] = false;
        emit Unblocked(account);
    }

    /// @dev Sanctions check enforced inside _update — covers transfer, transferFrom, mint, burn.
    function _update(address from, address to, uint256 value) internal override {
        require(!blocked[from], "sender blocked");
        require(!blocked[to], "recipient blocked");
        super._update(from, to, value);
    }

    event Blocked(address indexed account);
    event Unblocked(address indexed account);
}
