// Task 27: Custom Errors in Solidity

// Question: Write a contract that demonstrates the use of custom errors to save gas. Create a contract with a function that only allows even numbers to be set, and throw a custom error if the condition fails.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomErrorExample {
    uint256 public number;

    error NotEvenNumber(uint256 input);

    function setNumber(uint256 _number) public {
        if (_number % 2 != 0) {
            revert NotEvenNumber(_number);
        }
        number = _number;
    }
}
