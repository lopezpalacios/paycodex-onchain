// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Tokenized deposit with per-second linear interest accrual.
// Use case 062 — interest-bearing token. Companion: paycodex-rules-poc/contracts/InterestBearingDeposit.sol
//
// Pattern: each user holds underlying balance; interest computed via principal × rate × dt / yearSecs.
// This is the simplest "Pattern A" from concepts/interest-accrual-onchain.md.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract InterestBearingDeposit {
    using SafeERC20 for IERC20;

    IERC20  public immutable asset;
    address public immutable customer;
    uint256 public immutable rateBps;             // e.g. 350 = 3.50% annual
    uint256 public constant   SECONDS_PER_YEAR = 360 * 86400;  // act/360

    uint256 public principal;
    uint256 public accruedInterest;
    uint64  public lastAccrualTs;

    constructor(IERC20 asset_, address customer_, uint256 rateBps_) {
        asset = asset_;
        customer = customer_;
        rateBps = rateBps_;
        lastAccrualTs = uint64(block.timestamp);
    }

    function deposit(uint256 amount) external {
        require(msg.sender == customer, "not customer");
        _accrue();
        asset.safeTransferFrom(msg.sender, address(this), amount);
        principal += amount;
    }

    function withdraw(uint256 amount) external {
        require(msg.sender == customer, "not customer");
        _accrue();
        require(amount <= principal, "exceeds principal");
        principal -= amount;
        asset.safeTransfer(msg.sender, amount);
    }

    function postInterest() external returns (uint256 credited) {
        _accrue();
        credited = accruedInterest;
        accruedInterest = 0;
        principal += credited;
    }

    function previewBalance() external view returns (uint256) {
        uint256 dt = block.timestamp - lastAccrualTs;
        uint256 fresh = principal * rateBps * dt / (10_000 * SECONDS_PER_YEAR);
        return principal + accruedInterest + fresh;
    }

    function _accrue() internal {
        uint256 dt = block.timestamp - lastAccrualTs;
        if (dt == 0) return;
        accruedInterest += principal * rateBps * dt / (10_000 * SECONDS_PER_YEAR);
        lastAccrualTs = uint64(block.timestamp);
    }
}
