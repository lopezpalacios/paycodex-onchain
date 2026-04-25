// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: split incoming amount among recipients by basis points.
// Use case: tax, supplier+factor, multi-party vendor pay.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Splitter {
    address[] public recipients;
    uint16[] public bpsShares; // basis points (10000 = 100%)

    constructor(address[] memory recipients_, uint16[] memory bpsShares_) {
        require(recipients_.length == bpsShares_.length, "length mismatch");
        uint256 total;
        for (uint256 i; i < bpsShares_.length; ++i) total += bpsShares_[i];
        require(total == 10_000, "shares must sum to 10000");
        recipients = recipients_;
        bpsShares = bpsShares_;
    }

    /// @notice Pull `amount` from sender, then distribute by configured basis points.
    function split(IERC20 token, uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount), "pull failed");
        for (uint256 i; i < recipients.length; ++i) {
            uint256 share = (amount * bpsShares[i]) / 10_000;
            require(token.transfer(recipients[i], share), "push failed");
        }
    }
}
