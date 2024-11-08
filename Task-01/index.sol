// Task 1: Hello World Contract

// Question: Write a Solidity contract that stores and returns the message "Hello, World!".


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;

    constructor() {
        message = "Hello, World!";
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}