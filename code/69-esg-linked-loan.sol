// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: ESG-linked loan. Interest rate adjusts based on KPI oracle (e.g., GHG emission target).
// Borrower's loan: base rate + spread, where spread reduces if KPI met, increases if missed.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IKPIOracle {
    /// @return delta in basis points (negative = better than target = discount; positive = penalty)
    function spreadAdjustmentBps(bytes32 loanId) external view returns (int16 delta);
}

contract ESGLinkedLoan {
    struct Loan {
        address borrower;
        address lender;
        IERC20 token;
        uint256 principal;
        uint16 baseSpreadBps;       // e.g., 200 = 2%
        IKPIOracle oracle;
        uint256 maturity;
        bool repaid;
    }

    mapping(bytes32 => Loan) public loans;

    function originate(bytes32 id, address borrower, IERC20 token, uint256 principal, uint16 baseSpreadBps, IKPIOracle oracle, uint256 maturity) external {
        loans[id] = Loan(borrower, msg.sender, token, principal, baseSpreadBps, oracle, maturity, false);
        require(token.transferFrom(msg.sender, borrower, principal), "fund failed");
    }

    /// @notice Compute interest using KPI-adjusted spread.
    /// @dev Simplified — real loans use day-count conventions, compounding, partial periods.
    function computeRepayment(bytes32 id) public view returns (uint256) {
        Loan storage l = loans[id];
        int16 adj = l.oracle.spreadAdjustmentBps(id);
        // Apply adjustment to base spread, floor at 0.
        int256 effectiveBps = int256(uint256(l.baseSpreadBps)) + adj;
        if (effectiveBps < 0) effectiveBps = 0;
        // For demo: simple interest from origination -> maturity (1 year assumed).
        uint256 interest = (l.principal * uint256(effectiveBps)) / 10_000;
        return l.principal + interest;
    }

    function repay(bytes32 id) external {
        Loan storage l = loans[id];
        require(!l.repaid, "already repaid");
        require(msg.sender == l.borrower, "not borrower");
        l.repaid = true;
        uint256 due = computeRepayment(id);
        require(l.token.transferFrom(l.borrower, l.lender, due), "repay failed");
    }
}
