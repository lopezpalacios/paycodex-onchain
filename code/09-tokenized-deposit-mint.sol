// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: when fiat hits the bank's omnibus account from a customer, an oracle / off-chain process
// signs an attestation; the bank's operator submits the mint on-chain.

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MintOnDeposit is ERC20, Ownable {
    // Each fiat reference (bank reference like end-to-end ID) only mintable once.
    mapping(bytes32 => bool) public processed;

    constructor() ERC20("EUR Tokenized Deposit", "EUR-TD") Ownable(msg.sender) {}

    /// @notice Bank operator submits proof-of-deposit and mints to customer wallet.
    /// @param customer wallet receiving the token.
    /// @param amount in token decimals.
    /// @param fiatReference unique end-to-end ID from the bank file (camt.054 ref).
    function mintOnDeposit(address customer, uint256 amount, bytes32 fiatReference)
        external onlyOwner
    {
        require(!processed[fiatReference], "already minted for this deposit");
        processed[fiatReference] = true;
        _mint(customer, amount);
        emit DepositMinted(customer, amount, fiatReference);
    }

    event DepositMinted(address indexed customer, uint256 amount, bytes32 indexed fiatReference);
}
