// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Bank-issued ERC-20 token with mint, burn, and pause.
// Mirrors a tokenized commercial bank deposit (e.g., DCHF, EURCV, JPMD).
//
// Stack: OpenZeppelin Contracts v5.x
// To run: npm install @openzeppelin/contracts && npx hardhat compile

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

/// @title BankIssuedToken
/// @notice Tokenized commercial bank deposit. Bank treasury controls supply via mint/burn.
contract BankIssuedToken is ERC20, ERC20Pausable, AccessControl {
    // Roles separated so different teams can hold them with least privilege.
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
    }

    /// @notice Mint when bank receives a fiat deposit. Customer's chain wallet credited.
    /// @dev MINTER_ROLE = bank treasury operations.
    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    /// @notice Burn when customer redeems token for fiat. Bank debits chain wallet, credits DDA.
    function burn(address from, uint256 amount) external onlyRole(MINTER_ROLE) {
        _burn(from, amount);
    }

    /// @notice Halt all transfers (regulatory event, court order).
    function pause() external onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() external onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    /// @dev OZ v5 multiple-inheritance plumbing: route _update through both parents.
    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}
