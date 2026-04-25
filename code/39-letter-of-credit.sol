// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: minimal LC.
// Issuer locks payment in escrow; release on document oracle confirming compliant docs.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IDocsOracle {
    function isCompliant(bytes32 lcId) external view returns (bool);
}

contract LetterOfCredit {
    struct LC {
        address applicant;       // buyer
        address beneficiary;     // seller
        IERC20 token;
        uint256 amount;
        IDocsOracle docsOracle;
        uint256 expiry;
        bool released;
    }

    mapping(bytes32 => LC) public lcs;

    function issue(bytes32 lcId, address beneficiary, IERC20 token, uint256 amount, IDocsOracle docsOracle, uint256 expiry) external {
        require(lcs[lcId].applicant == address(0), "exists");
        lcs[lcId] = LC(msg.sender, beneficiary, token, amount, docsOracle, expiry, false);
        require(token.transferFrom(msg.sender, address(this), amount), "fund LC failed");
    }

    /// @notice Beneficiary draws once docs marked compliant by oracle.
    function draw(bytes32 lcId) external {
        LC storage lc = lcs[lcId];
        require(!lc.released, "already drawn");
        require(msg.sender == lc.beneficiary, "not beneficiary");
        require(block.timestamp <= lc.expiry, "expired");
        require(lc.docsOracle.isCompliant(lcId), "docs not compliant");
        lc.released = true;
        require(lc.token.transfer(lc.beneficiary, lc.amount), "release failed");
    }

    /// @notice Applicant reclaims if expired without compliant draw.
    function refund(bytes32 lcId) external {
        LC storage lc = lcs[lcId];
        require(!lc.released, "already drawn");
        require(block.timestamp > lc.expiry, "not expired");
        require(msg.sender == lc.applicant, "not applicant");
        lc.released = true;
        require(lc.token.transfer(lc.applicant, lc.amount), "refund failed");
    }
}
