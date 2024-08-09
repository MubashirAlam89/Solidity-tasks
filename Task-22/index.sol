// Task 22: Reentrancy Attack Prevention

// Question: Write a contract that is vulnerable to a reentrancy attack and then secure it by using ReentrancyGuard. Use OpenZeppelin’s ReentrancyGuard to prevent multiple withdrawals.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract ReentrancyExample is ReentrancyGuard {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public nonReentrant {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Withdrawal failed");
    }
}
