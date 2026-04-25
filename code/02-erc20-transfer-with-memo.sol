// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Transfer with structured creditor reference (Swiss QR-bill / ISO 11649 equivalent).
// Mirrors RmtInf/Strd/CdtrRefInf/Ref in pacs.008.
//
// Pattern: wrapper contract takes ERC-20 + payload; emits Transfer + Memo.
// Receiver-side indexer matches memo to invoice for auto-reconciliation.

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MemoPay {
    /// @notice Transfer ERC-20 with attached memo (e.g., Swiss QR reference 27 digits, hashed).
    /// @param token  ERC-20 address (USDC, EURC, tokenized deposit).
    /// @param to     Beneficiary.
    /// @param amount Amount in token's smallest unit.
    /// @param memo   Reference (32 bytes — fits 27-digit QRR after hash, or full ISO 11649 RF).
    function transferWithMemo(
        IERC20 token,
        address to,
        uint256 amount,
        bytes32 memo
    ) external {
        // Caller must have approved this contract for `amount` tokens.
        require(token.transferFrom(msg.sender, to, amount), "transfer failed");
        emit TransferWithMemo(msg.sender, to, amount, memo, block.timestamp);
    }

    /// @dev Indexers (e.g., The Graph) listen on this for AR reconciliation.
    event TransferWithMemo(
        address indexed from,
        address indexed to,
        uint256 amount,
        bytes32 indexed memo,
        uint256 timestamp
    );
}
