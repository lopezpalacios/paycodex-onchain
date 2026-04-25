// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Treasury sweep. When account exceeds target by buffer, excess swept to vault.
// Equivalent to investment sweep / ZBA flush.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC4626} from "@openzeppelin/contracts/interfaces/IERC4626.sol";

contract SweepKeeper {
    IERC20 public immutable cash;       // working capital token (USDC)
    IERC4626 public immutable vault;    // yield vault (BUIDL-like)
    address public immutable treasury;
    uint256 public immutable target;
    uint256 public immutable buffer;

    constructor(IERC20 cash_, IERC4626 vault_, address treasury_, uint256 target_, uint256 buffer_) {
        cash = cash_;
        vault = vault_;
        treasury = treasury_;
        target = target_;
        buffer = buffer_;
    }

    /// @notice Permissionless keeper call — anyone can poke.
    /// If treasury balance > target + buffer, sweep excess to vault.
    /// If treasury balance < target - buffer, redeem from vault.
    function sweep() external {
        uint256 bal = cash.balanceOf(treasury);
        if (bal > target + buffer) {
            uint256 excess = bal - target;
            // Treasury must have approved keeper for cash transfer.
            require(cash.transferFrom(treasury, address(this), excess), "pull failed");
            cash.approve(address(vault), excess);
            vault.deposit(excess, treasury);
            emit Swept(int256(excess));
        } else if (bal < target - buffer) {
            uint256 shortfall = target - bal;
            uint256 sharesToBurn = vault.previewWithdraw(shortfall);
            // Treasury must have approved keeper for share burn.
            vault.withdraw(shortfall, treasury, treasury);
            emit Swept(-int256(shortfall));
        }
    }

    event Swept(int256 net);  // positive = into vault, negative = out of vault
}
