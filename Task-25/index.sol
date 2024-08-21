// Task 25: Upgradable Contract using Proxy Pattern

// Question: Implement an upgradable contract pattern using a basic proxy contract that delegates calls to a logic contract. Write a simple storage contract and an upgradable proxy to change logic.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Storage contract
contract StorageContract {
    uint256 public data;

    function setData(uint256 _data) public {
        data = _data;
    }
}

// Proxy contract
contract Proxy {
    address public logic;

    constructor(address _logic) {
        logic = _logic;
    }

    function upgrade(address _newLogic) public {
        logic = _newLogic;
    }

    fallback() external payable {
        (bool success, ) = logic.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }
}
