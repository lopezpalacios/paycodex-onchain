// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: simplified T-REX (ERC-3643) — transfer requires both parties to be in identity registry.
// Real T-REX is much richer (compliance modules, partitions, claims).

interface IIdentityRegistry {
    function isVerified(address account) external view returns (bool);
}

contract WhitelistedToken {
    string public name = "BankUSD-T-REX";
    string public symbol = "BUSD";
    uint8 public constant decimals = 18;

    mapping(address => uint256) private _balances;
    uint256 public totalSupply;

    IIdentityRegistry public immutable identityRegistry;
    address public immutable issuer;

    error NotVerified(address account);

    constructor(IIdentityRegistry registry) {
        identityRegistry = registry;
        issuer = msg.sender;
    }

    /// @notice Issuer-only mint. Recipient must be KYC-verified.
    function issue(address to, uint256 amount) external {
        require(msg.sender == issuer, "only issuer");
        if (!identityRegistry.isVerified(to)) revert NotVerified(to);
        _balances[to] += amount;
        totalSupply += amount;
    }

    /// @notice Transfer requires BOTH sender and recipient to be in registry.
    function transfer(address to, uint256 amount) external returns (bool) {
        if (!identityRegistry.isVerified(msg.sender)) revert NotVerified(msg.sender);
        if (!identityRegistry.isVerified(to)) revert NotVerified(to);
        require(_balances[msg.sender] >= amount, "insufficient");
        unchecked { _balances[msg.sender] -= amount; }
        _balances[to] += amount;
        return true;
    }

    function balanceOf(address a) external view returns (uint256) { return _balances[a]; }
}
