// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: minimal recurring payment via session key on smart wallet.
// Real ERC-4337 flow uses EntryPoint + Bundler; this shows the on-chain auth check.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RecurringPayer {
    struct Schedule {
        IERC20 token;
        address recipient;
        uint256 amount;
        uint256 intervalSeconds;
        uint256 lastExecuted;
        bool active;
    }

    address public immutable owner;
    mapping(bytes32 => Schedule) public schedules;
    mapping(address => bool) public sessionKey;

    error NotAuthorized();
    error TooEarly();

    constructor() { owner = msg.sender; }

    function setSessionKey(address key, bool allowed) external {
        if (msg.sender != owner) revert NotAuthorized();
        sessionKey[key] = allowed;
    }

    function setSchedule(bytes32 id, Schedule calldata s) external {
        if (msg.sender != owner) revert NotAuthorized();
        schedules[id] = s;
    }

    /// @notice Anyone with a valid session key can trigger the next due payment.
    function execute(bytes32 id) external {
        if (!sessionKey[msg.sender] && msg.sender != owner) revert NotAuthorized();
        Schedule storage s = schedules[id];
        require(s.active, "inactive");
        if (block.timestamp < s.lastExecuted + s.intervalSeconds) revert TooEarly();
        s.lastExecuted = block.timestamp;
        require(s.token.transferFrom(owner, s.recipient, s.amount), "transfer failed");
        emit Executed(id, s.recipient, s.amount, block.timestamp);
    }

    event Executed(bytes32 indexed id, address indexed recipient, uint256 amount, uint256 timestamp);
}
