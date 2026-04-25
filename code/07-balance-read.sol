// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: multi-account aggregated balance read. Equivalent to a camt.052 intraday statement.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BalanceAggregator {
    /// @notice Read same token balance across a set of accounts. Useful for treasury position.
    function balancesOf(IERC20 token, address[] calldata accounts)
        external view returns (uint256[] memory result)
    {
        result = new uint256[](accounts.length);
        for (uint256 i; i < accounts.length; ++i) {
            result[i] = token.balanceOf(accounts[i]);
        }
    }

    /// @notice Read multiple tokens for a single treasury wallet (multi-currency view).
    function multiTokenBalance(address account, IERC20[] calldata tokens)
        external view returns (uint256[] memory result)
    {
        result = new uint256[](tokens.length);
        for (uint256 i; i < tokens.length; ++i) {
            result[i] = tokens[i].balanceOf(account);
        }
    }
}
