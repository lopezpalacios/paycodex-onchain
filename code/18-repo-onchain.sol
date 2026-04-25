// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: simplified bilateral repo. Borrower locks security token, receives cash; on maturity, returns cash + fee, gets security back.
// No CCP, no margin call. Production version needs price oracle for variation margin.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Repo {
    struct Deal {
        address borrower;
        address lender;
        IERC20 security;
        IERC20 cash;
        uint256 securityAmount;
        uint256 cashAmount;
        uint256 fee;             // cash to repay above cashAmount
        uint256 maturity;        // block.timestamp >= maturity to settle
        bool open;
    }

    mapping(bytes32 => Deal) public deals;

    function open(
        bytes32 id,
        address lender,
        IERC20 security,
        uint256 securityAmount,
        IERC20 cash,
        uint256 cashAmount,
        uint256 fee,
        uint256 maturity
    ) external {
        require(!deals[id].open, "exists");
        deals[id] = Deal(msg.sender, lender, security, cash, securityAmount, cashAmount, fee, maturity, true);
        // Borrower locks security, gets cash.
        require(security.transferFrom(msg.sender, address(this), securityAmount), "sec lock failed");
        require(cash.transferFrom(lender, msg.sender, cashAmount), "cash advance failed");
    }

    /// @notice Borrower closes by repaying cash + fee, security returned.
    function close(bytes32 id) external {
        Deal storage d = deals[id];
        require(d.open, "not open");
        require(msg.sender == d.borrower, "not borrower");
        require(block.timestamp >= d.maturity, "not mature");
        d.open = false;
        require(d.cash.transferFrom(d.borrower, d.lender, d.cashAmount + d.fee), "repay failed");
        require(d.security.transfer(d.borrower, d.securityAmount), "return failed");
    }

    /// @notice On default (past maturity, no close), lender liquidates security.
    function liquidate(bytes32 id) external {
        Deal storage d = deals[id];
        require(d.open, "not open");
        require(msg.sender == d.lender, "not lender");
        require(block.timestamp >= d.maturity, "not mature");
        d.open = false;
        require(d.security.transfer(d.lender, d.securityAmount), "seize failed");
    }
}
