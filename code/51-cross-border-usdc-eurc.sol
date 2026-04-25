// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: cross-border B2B payment via stablecoin atomic swap.
// Sending corp pays in USDC, receiving corp wants EURC. Single tx, instant FX.
// Production: route via DEX (Uniswap, 0x) for live FX rate.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IDexRouter {
    function exactInputSingle(
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOutMinimum,
        address recipient
    ) external returns (uint256 amountOut);
}

contract CrossBorderPayment {
    IDexRouter public immutable dex;

    constructor(IDexRouter dex_) { dex = dex_; }

    /// @notice Pay supplier in their preferred currency (single-tx FX).
    function payAcrossCurrencies(
        IERC20 tokenIn,
        IERC20 tokenOut,
        uint256 amountIn,
        uint256 minAmountOut,
        address supplier,
        bytes32 invoiceRef
    ) external {
        require(tokenIn.transferFrom(msg.sender, address(this), amountIn), "pull failed");
        tokenIn.approve(address(dex), amountIn);
        uint256 amountOut = dex.exactInputSingle(
            address(tokenIn), address(tokenOut), amountIn, minAmountOut, supplier
        );
        emit CrossBorderPaid(msg.sender, supplier, address(tokenIn), amountIn, address(tokenOut), amountOut, invoiceRef);
    }

    event CrossBorderPaid(
        address indexed payer,
        address indexed supplier,
        address tokenIn,
        uint256 amountIn,
        address tokenOut,
        uint256 amountOut,
        bytes32 indexed invoiceRef
    );
}
