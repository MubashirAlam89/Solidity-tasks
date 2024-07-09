// Task 13: Modifier Example with Access Control

// Question: Write a contract that only allows the owner to execute certain functions using a modifier. Add a function restrictedAction that only the owner can call.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function restrictedAction() public onlyOwner returns (string memory) {
        return "This action is restricted to the owner";
    }
}
