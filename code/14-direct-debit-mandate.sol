// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: SDD-style mandate as smart contract.
// Debtor signs mandate authorizing creditor to pull up to amountCap per intervalSeconds.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DirectDebitMandate {
    struct Mandate {
        address debtor;
        address creditor;
        IERC20 token;
        uint256 amountCap;
        uint256 intervalSeconds;
        uint256 lastDrawn;
        bool active;
    }

    mapping(bytes32 => Mandate) public mandates;

    /// @notice Debtor creates a mandate (UMR-equivalent = bytes32 id).
    /// Debtor must also approve(creditor or this contract) on the token.
    function createMandate(
        bytes32 umr,
        address creditor,
        IERC20 token,
        uint256 amountCap,
        uint256 intervalSeconds
    ) external {
        require(mandates[umr].debtor == address(0), "umr in use");
        mandates[umr] = Mandate({
            debtor: msg.sender,
            creditor: creditor,
            token: token,
            amountCap: amountCap,
            intervalSeconds: intervalSeconds,
            lastDrawn: 0,
            active: true
        });
        emit MandateCreated(umr, msg.sender, creditor);
    }

    /// @notice Creditor pulls funds within mandate constraints.
    function collect(bytes32 umr, uint256 amount) external {
        Mandate storage m = mandates[umr];
        require(m.active, "inactive");
        require(msg.sender == m.creditor, "not creditor");
        require(amount <= m.amountCap, "exceeds cap");
        require(block.timestamp >= m.lastDrawn + m.intervalSeconds, "interval not elapsed");
        m.lastDrawn = block.timestamp;
        require(m.token.transferFrom(m.debtor, m.creditor, amount), "pull failed");
        emit Collected(umr, amount, block.timestamp);
    }

    /// @notice Debtor cancels (equivalent to ADDACS / mandate cancellation).
    function cancel(bytes32 umr) external {
        require(mandates[umr].debtor == msg.sender, "not debtor");
        mandates[umr].active = false;
        emit MandateCancelled(umr);
    }

    event MandateCreated(bytes32 indexed umr, address indexed debtor, address indexed creditor);
    event Collected(bytes32 indexed umr, uint256 amount, uint256 timestamp);
    event MandateCancelled(bytes32 indexed umr);
}
