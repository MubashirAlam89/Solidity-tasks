// Task 12: Inheritance Example

// Question: Create a contract Base with a function sayHello that returns "Hello from Base". Then create a derived contract Derived that overrides this function to return "Hello from Derived".

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    function sayHello() public pure virtual returns (string memory) {
        return "Hello from Base";
    }
}

contract Derived is Base {
    function sayHello() public pure override returns (string memory) {
        return "Hello from Derived";
    }
}
