// Task 31: Timestamp Manipulation for Delayed Functions

// Question: Write a contract that allows a function to be executed only after a specific time delay. Use block timestamps to implement a function that can only be called 1 hour after a specific time.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLockedFunction {
    uint256 public unlockTime;

    function setUnlockTime(uint256 _hours) public {
        unlockTime = block.timestamp + (_hours * 1 hours);
    }

    function executeAfterUnlock() public view returns (string memory) {
        require(block.timestamp >= unlockTime, "Function locked");
        return "Function executed after delay!";
    }
}
