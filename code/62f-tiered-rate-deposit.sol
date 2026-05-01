// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: tiered marginal-rate accrual. Balance sliced through ascending bands.
// Each portion accrues at its band's rate. Standard banking practice.
// See concepts/account-tier.md (in paycodex KG).

contract TieredRateDeposit {
    struct Tier { uint256 upTo; uint256 bps; }
    Tier[] public tiers;
    uint256 public constant SECONDS_PER_YEAR_360 = 360 * 86400;

    constructor(uint256[] memory upTos, uint256[] memory bpsList) {
        require(upTos.length == bpsList.length, "len mismatch");
        for (uint256 i = 0; i < upTos.length; i++) {
            if (i > 0) require(upTos[i] > upTos[i-1], "not sorted");
            tiers.push(Tier({ upTo: upTos[i], bps: bpsList[i] }));
        }
    }

    function previewAccrual(uint256 balance, uint64 fromTs, uint64 toTs) external view returns (uint256) {
        if (balance == 0 || toTs <= fromTs) return 0;
        uint256 dt = uint256(toTs) - uint256(fromTs);
        uint256 prev = 0;
        uint256 total = 0;
        for (uint256 i = 0; i < tiers.length; i++) {
            Tier storage t = tiers[i];
            if (balance <= prev) break;
            uint256 sliceTop = balance < t.upTo ? balance : t.upTo;
            uint256 slice = sliceTop - prev;
            total += slice * t.bps * dt / (10_000 * SECONDS_PER_YEAR_360);
            prev = t.upTo;
            if (balance <= t.upTo) break;
        }
        return total;
    }
}
