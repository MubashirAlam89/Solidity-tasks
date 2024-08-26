// Task 26: Gas Optimization Techniques

// Question: Write a contract that demonstrates a few gas optimization techniques. Use uint8 instead of uint256 where possible, and use unchecked for arithmetic operations where overflow is impossible.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasOptimization {
    uint8 public smallCounter;
    uint256 public largeCounter;

    // Use unchecked for addition where overflow is not possible
    function increment(uint8 _value) public {
        unchecked {
            smallCounter += _value;
        }
    }

    // Use uint8 instead of uint256 if values are small
    function setLargeCounter(uint8 _value) public {
        largeCounter = _value;
    }
}
