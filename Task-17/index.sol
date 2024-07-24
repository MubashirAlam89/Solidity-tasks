// Task 17: Time-Based Access Control

// Question: Write a contract that allows users to deposit ether, but they can only withdraw after a set time (e.g., 1 week after deposit).

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLockedWallet {
    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Deposit) public deposits;

    function deposit() public payable {
        require(msg.value > 0, "Send ether to deposit");
        deposits[msg.sender] = Deposit(msg.value, block.timestamp + 1 weeks);
    }

    function withdraw() public {
        Deposit memory userDeposit = deposits[msg.sender];
        require(block.timestamp >= userDeposit.unlockTime, "Funds are locked");
        require(userDeposit.amount > 0, "No funds to withdraw");

        uint256 amount = userDeposit.amount;
        deposits[msg.sender].amount = 0;
        payable(msg.sender).transfer(amount);
    }

    function getDepositDetails() public view returns (uint256, uint256) {
        Deposit memory userDeposit = deposits[msg.sender];
        return (userDeposit.amount, userDeposit.unlockTime);
    }
}
