// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: floating rate (oracle + spread) with floor and cap.
// Floors negative-rate pass-through to depositor (most retail products).
// Caps depositor exposure if oracle spikes (rare, but tail-protection).
// See concepts/negative-interest.md (paycodex KG) and decisions/0008-rate-source-trust-model.md.

interface IRateOracle {
    function getRateBps() external view returns (int256);
}

contract FloorCapDeposit {
    IRateOracle public immutable oracle;
    int256 public immutable spreadBps;
    int256 public immutable floorBps;   // typically 0 for retail
    int256 public immutable capBps;     // protect against runaway spikes
    uint256 public constant SECONDS_PER_YEAR = 360 * 86400;

    constructor(IRateOracle oracle_, int256 spread_, int256 floor_, int256 cap_) {
        require(cap_ >= floor_, "cap < floor");
        oracle = oracle_;
        spreadBps = spread_;
        floorBps = floor_;
        capBps = cap_;
    }

    function effectiveRateBps() public view returns (uint256) {
        int256 r = oracle.getRateBps() + spreadBps;
        if (r < floorBps) r = floorBps;
        if (r > capBps) r = capBps;
        if (r < 0) return 0; // depositor never pays
        return uint256(r);
    }

    function previewAccrual(uint256 balance, uint64 fromTs, uint64 toTs) external view returns (uint256) {
        if (balance == 0 || toTs <= fromTs) return 0;
        uint256 dt = uint256(toTs) - uint256(fromTs);
        uint256 r = effectiveRateBps();
        if (r == 0) return 0;
        return balance * r * dt / (10_000 * SECONDS_PER_YEAR);
    }
}
