// Task 11: Event Logging

// Question: Write a contract that logs an event whenever a user deposits ether. Create a function to allow deposits, and emit an event with the depositor's address and amount.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherLogger {
    event Deposit(address indexed depositor, uint256 amount);

    function deposit() public payable {
        require(msg.value > 0, "Must send some ether");
        emit Deposit(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
