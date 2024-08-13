// Task 23: Implementing an Interface

// Question: Create an interface ICounter with functions to increment and getCount. Then implement this interface in a contract that allows incrementing a count variable and retrieving its value.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICounter {
    function increment() external;
    function getCount() external view returns (uint256);
}

contract Counter is ICounter {
    uint256 private count;

    function increment() public override {
        count++;
    }

    function getCount() public view override returns (uint256) {
        return count;
    }
}
