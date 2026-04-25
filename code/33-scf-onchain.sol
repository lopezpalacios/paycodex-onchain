// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Supply chain finance.
// Buyer approves invoice -> financier pays supplier early at discount -> buyer pays financier at maturity.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SCFFlow {
    enum State { Pending, Approved, Funded, Matured, Repaid, Defaulted }

    struct Invoice {
        address buyer;
        address supplier;
        address financier;
        IERC20 token;
        uint256 faceValue;
        uint256 discountAmount;     // amount paid early to supplier (faceValue - discount)
        uint256 maturity;
        State state;
    }

    mapping(bytes32 => Invoice) public invoices;

    function register(bytes32 id, address supplier, IERC20 token, uint256 faceValue, uint256 discountAmount, uint256 maturity) external {
        invoices[id] = Invoice(msg.sender, supplier, address(0), token, faceValue, discountAmount, maturity, State.Pending);
    }

    /// @notice Buyer approves invoice — financier can fund.
    function approve(bytes32 id) external {
        Invoice storage inv = invoices[id];
        require(msg.sender == inv.buyer, "not buyer");
        require(inv.state == State.Pending, "wrong state");
        inv.state = State.Approved;
    }

    /// @notice Financier pays supplier early.
    function fund(bytes32 id) external {
        Invoice storage inv = invoices[id];
        require(inv.state == State.Approved, "not approved");
        inv.financier = msg.sender;
        inv.state = State.Funded;
        // Financier pays supplier face value minus discount.
        uint256 paid = inv.faceValue - inv.discountAmount;
        require(inv.token.transferFrom(msg.sender, inv.supplier, paid), "payout failed");
    }

    /// @notice At maturity, buyer pays financier face value.
    function repay(bytes32 id) external {
        Invoice storage inv = invoices[id];
        require(inv.state == State.Funded, "not funded");
        require(block.timestamp >= inv.maturity, "not mature");
        require(msg.sender == inv.buyer, "not buyer");
        inv.state = State.Repaid;
        require(inv.token.transferFrom(inv.buyer, inv.financier, inv.faceValue), "repay failed");
    }
}
