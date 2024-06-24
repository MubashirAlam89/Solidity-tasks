// Task 9: Basic Struct and Mapping Contract

// Question: Create a contract that allows users to register with their name and age. Store this information in a mapping with their address as the key.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistry {
    struct User {
        string name;
        uint256 age;
    }

    mapping(address => User) public users;

    function register(string memory _name, uint256 _age) public {
        users[msg.sender] = User(_name, _age);
    }

    function getUser(address _addr) public view returns (string memory, uint256) {
        User memory user = users[_addr];
        return (user.name, user.age);
    }
}
