// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: oracle-triggered payment. Equivalent to LC release on shipping confirmation, or
// SBLC trigger on default oracle.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ITriggerOracle {
    function triggered(bytes32 conditionId) external view returns (bool);
}

contract ConditionalPayment {
    struct Escrow {
        address payer;
        address payee;
        IERC20 token;
        uint256 amount;
        bytes32 conditionId;
        ITriggerOracle oracle;
        uint256 expiry;
        bool released;
    }

    mapping(bytes32 => Escrow) public escrows;

    function lock(bytes32 id, address payee, IERC20 token, uint256 amount, bytes32 conditionId, ITriggerOracle oracle, uint256 expiry) external {
        require(escrows[id].payer == address(0), "exists");
        escrows[id] = Escrow(msg.sender, payee, token, amount, conditionId, oracle, expiry, false);
        require(token.transferFrom(msg.sender, address(this), amount), "lock failed");
    }

    /// @notice Anyone can trigger release once oracle says condition met.
    function release(bytes32 id) external {
        Escrow storage e = escrows[id];
        require(!e.released, "already released");
        require(e.oracle.triggered(e.conditionId), "condition not met");
        e.released = true;
        require(e.token.transfer(e.payee, e.amount), "release failed");
    }

    /// @notice Payer can reclaim after expiry if condition never triggered.
    function refund(bytes32 id) external {
        Escrow storage e = escrows[id];
        require(!e.released, "already released");
        require(block.timestamp >= e.expiry, "not expired");
        e.released = true;  // mark settled (reuse field)
        require(e.token.transfer(e.payer, e.amount), "refund failed");
    }
}
