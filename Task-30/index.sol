// Task 30: Creating a Modifier with Conditional Access

// Question: Write a contract with a modifier that restricts access to a function based on specific conditions. Implement a function that can only be called if the caller’s address is odd.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalAccess {
    // Modifier to allow only addresses with an odd address value
    modifier onlyOddAddress() {
        require(uint160(msg.sender) % 2 != 0, "Caller address is even");
        _;
    }

    function restrictedFunction() public onlyOddAddress returns (string memory) {
        return "Function called by an odd address!";
    }
}
