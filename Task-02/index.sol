// Task 2: Simple Storage Contract

// Question: Write a contract where a user can store a number and retrieve it.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private data;

    function store(uint256 _data) public {
        data = _data;
    }

    function retrieve() public view returns (uint256) {
        return data;
    }
}