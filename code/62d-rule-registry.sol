// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: append-only registry mapping ruleId → strategy address + ruleHash.
// Rule hash = keccak256(canonical JSON) anchors off-chain rule to on-chain strategy.
// See architecture/rule-driven-deployment-pattern.md.

contract RuleRegistry {
    struct Entry {
        address strategy;
        bytes32 ruleHash;
        uint64  registeredAt;
        bool    deprecated;
    }

    address public immutable operator;
    mapping(bytes32 => Entry) public entries;

    event Registered(bytes32 indexed ruleId, address strategy, bytes32 ruleHash);
    event Deprecated(bytes32 indexed ruleId);

    error NotOperator();
    error AlreadyRegistered();

    constructor(address op_) { operator = op_; }
    modifier onlyOp() { if (msg.sender != operator) revert NotOperator(); _; }

    function register(bytes32 ruleId, address strategy, bytes32 ruleHash) external onlyOp {
        if (entries[ruleId].strategy != address(0)) revert AlreadyRegistered();
        entries[ruleId] = Entry(strategy, ruleHash, uint64(block.timestamp), false);
        emit Registered(ruleId, strategy, ruleHash);
    }

    function deprecate(bytes32 ruleId) external onlyOp {
        entries[ruleId].deprecated = true;
        emit Deprecated(ruleId);
    }
}
