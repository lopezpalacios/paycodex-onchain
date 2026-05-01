// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Compounding via cumulative liquidity index (Aave-style Pattern B).
// One index for the pool; user balance = scaledBalance × index.
// Avoids per-user accrual on every interaction.

contract CompoundDepositPool {
    uint256 public constant WAD = 1e18;
    uint256 public constant SECONDS_PER_YEAR = 360 * 86400;

    uint256 public rateBps;            // current annualized rate (settable by ops)
    uint256 public liquidityIndex = WAD; // starts at 1.0
    uint64  public lastUpdateTs;

    mapping(address => uint256) public scaledBalance; // balance / index_at_deposit

    constructor(uint256 rateBps_) {
        rateBps = rateBps_;
        lastUpdateTs = uint64(block.timestamp);
    }

    function _updateIndex() internal {
        uint256 dt = block.timestamp - lastUpdateTs;
        if (dt == 0) return;
        // index *= 1 + rate * dt / yearSecs   (linear — continuous-approx)
        uint256 delta = (rateBps * WAD * dt) / (10_000 * SECONDS_PER_YEAR);
        liquidityIndex = (liquidityIndex * (WAD + delta)) / WAD;
        lastUpdateTs = uint64(block.timestamp);
    }

    function deposit(uint256 amount) external {
        _updateIndex();
        scaledBalance[msg.sender] += (amount * WAD) / liquidityIndex;
    }

    function balanceOf(address u) external view returns (uint256) {
        // include pending accrual since last update
        uint256 dt = block.timestamp - lastUpdateTs;
        uint256 idx = liquidityIndex;
        if (dt > 0) {
            uint256 delta = (rateBps * WAD * dt) / (10_000 * SECONDS_PER_YEAR);
            idx = (idx * (WAD + delta)) / WAD;
        }
        return (scaledBalance[u] * idx) / WAD;
    }

    function setRate(uint256 newBps) external {
        _updateIndex();   // close out at old rate before flipping
        rateBps = newBps;
    }
}
