# ERC-20

Foundational fungible token standard. Used for ALL cash leg types in EVM space.

## Interface

```solidity
function totalSupply() external view returns (uint256);
function balanceOf(address account) external view returns (uint256);
function transfer(address to, uint256 amount) external returns (bool);
function allowance(address owner, address spender) external view returns (uint256);
function approve(address spender, uint256 amount) external returns (bool);
function transferFrom(address from, address to, uint256 amount) external returns (bool);

event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);
```

## Cash leg implementations

- USDC, USDT, EURC — public stablecoin
- JPMD, EURCV, DCHF — tokenized deposit (often gated via compliance modules)
- Tokenized MMF (BUIDL) — ERC-20 with redemption logic

## Patterns

- **Mint / burn** — issuer adds / removes from supply
- **Pause** — issuer can halt all transfers (regulatory hook)
- **Blacklist** — issuer can block specific addresses (USDC has this)
- **Permit (EIP-2612)** — gasless approval via signed message — see [[erc-2612]]

## Cash mgmt mapping

- One-to-one with ledger account (DDA equivalent)
- balanceOf = balance enquiry
- transfer = SCT Inst-equivalent
- transferFrom = ACH-debit-equivalent (with prior approve = mandate)

## Sample minimal mintable + burnable + pausable

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

contract BankIssuedToken is ERC20, ERC20Pausable, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) external onlyRole(MINTER_ROLE) {
        _burn(from, amount);
    }

    function pause() external onlyRole(PAUSER_ROLE) { _pause(); }
    function unpause() external onlyRole(PAUSER_ROLE) { _unpause(); }

    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }
}
```

## Linked

[[erc-2612]] · [[../cash-legs/stablecoin-public]] · [[../cash-legs/tokenized-deposit]] · [[../use-cases/001-erc20-instant-transfer]]
