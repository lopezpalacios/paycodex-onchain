// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: ERC-4626 minimal vault. Treasury deposits USDC, gets shares; redeems for USDC + yield.
// Yield accrues by external "rebase" via direct USDC top-up to vault's balance.
// Real BUIDL is similar shape with off-chain yield distribution.

import {ERC20, IERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC4626, IERC4626} from "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";

contract MMFVault is ERC4626 {
    constructor(IERC20 asset_) ERC20("MMF Share", "MMFS") ERC4626(asset_) {}
}
