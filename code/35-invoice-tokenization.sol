// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: Invoice as ERC-721 NFT. Each tokenId = one invoice, transferable to factor / financier.

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract InvoiceNFT is ERC721, Ownable {
    struct Invoice {
        address debtor;
        uint256 faceValue;
        uint256 dueDate;
        bytes32 metadataHash;  // IPFS / Arweave hash of full invoice doc
        bool paid;
    }

    mapping(uint256 => Invoice) public invoices;
    uint256 public nextId;

    constructor() ERC721("Invoice NFT", "INV") Ownable(msg.sender) {}

    /// @notice Issuer (creditor) mints invoice NFT to themselves.
    function issue(address debtor, uint256 faceValue, uint256 dueDate, bytes32 metadataHash) external returns (uint256 id) {
        id = ++nextId;
        invoices[id] = Invoice(debtor, faceValue, dueDate, metadataHash, false);
        _safeMint(msg.sender, id);
    }

    /// @notice Debtor settles invoice. Burns NFT, marks paid (for audit).
    function settle(uint256 id) external {
        Invoice storage inv = invoices[id];
        require(!inv.paid, "already paid");
        require(msg.sender == inv.debtor, "not debtor");
        inv.paid = true;
        _burn(id);
        // Note: actual cash leg is separate — typically ERC-20 transferred to current NFT holder.
    }
}
