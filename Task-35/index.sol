// Task 35: Using selfdestruct for Contract Termination


// Question: Implement a contract with an owner address that can terminate the contract using selfdestruct. When called, the contract should transfer its balance to the owner and delete itself from the blockchain.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfDestructible {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }

    receive() external payable {}
}

