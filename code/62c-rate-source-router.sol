// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Rate-source router with multi-tier trust.
// Picks rate from primary, falls back to secondary if primary stale, reverts if both fail.
// Implements deviation guard + sanity bounds.

interface IRateOracle {
    function getRateBps() external view returns (int256);
    function lastUpdate() external view returns (uint256);
}

contract RateSourceRouter {
    IRateOracle public immutable primary;
    IRateOracle public immutable secondary;
    uint256 public immutable maxStaleSeconds;
    int256  public immutable maxDeviationBps;
    int256  public immutable minRateBps;
    int256  public immutable maxRateBps;

    int256 public lastReturned;

    error StalePrimary();
    error AllSourcesStale();
    error DeviationTooLarge();
    error OutOfBounds();

    constructor(IRateOracle primary_, IRateOracle secondary_, uint256 maxStale_, int256 maxDev_, int256 minR_, int256 maxR_) {
        primary = primary_;
        secondary = secondary_;
        maxStaleSeconds = maxStale_;
        maxDeviationBps = maxDev_;
        minRateBps = minR_;
        maxRateBps = maxR_;
    }

    function getRate() external returns (int256) {
        int256 r;
        if (block.timestamp - primary.lastUpdate() <= maxStaleSeconds) {
            r = primary.getRateBps();
        } else if (block.timestamp - secondary.lastUpdate() <= maxStaleSeconds) {
            r = secondary.getRateBps();
        } else {
            revert AllSourcesStale();
        }
        if (r < minRateBps || r > maxRateBps) revert OutOfBounds();
        if (lastReturned != 0) {
            int256 diff = r > lastReturned ? r - lastReturned : lastReturned - r;
            if (diff > maxDeviationBps) revert DeviationTooLarge();
        }
        lastReturned = r;
        return r;
    }
}
