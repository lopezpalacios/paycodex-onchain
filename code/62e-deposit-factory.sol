// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Demo: factory deploys interest-bearing deposit instances bound to a rule's strategy.
// Each customer onboarding = one factory call. Same factory contract handles all rule kinds.

interface IRuleRegistry {
    struct Entry {
        address strategy;
        bytes32 ruleHash;
        uint64  registeredAt;
        bool    deprecated;
    }
    function entries(bytes32 ruleId) external view returns (Entry memory);
}

interface IInterestStrategy {}
interface IERC20 {}

contract InterestBearingDepositMinimal {
    address public immutable customer;
    IInterestStrategy public immutable strategy;
    bytes32 public immutable ruleId;
    constructor(address c_, IInterestStrategy s_, bytes32 id_) {
        customer = c_; strategy = s_; ruleId = id_;
    }
}

contract DepositFactory {
    IRuleRegistry public immutable registry;
    event Deployed(bytes32 indexed ruleId, address indexed customer, address deposit);
    error RuleDeprecated();
    constructor(IRuleRegistry r_) { registry = r_; }

    function deploy(bytes32 ruleId, address customer) external returns (address) {
        IRuleRegistry.Entry memory e = registry.entries(ruleId);
        if (e.deprecated) revert RuleDeprecated();
        InterestBearingDepositMinimal d = new InterestBearingDepositMinimal(
            customer, IInterestStrategy(e.strategy), ruleId
        );
        emit Deployed(ruleId, customer, address(d));
        return address(d);
    }
}
