// Task 21: Fallback and Receive Functions

// Question: Write a contract that implements both receive and fallback functions. The receive function should be called when ether is sent without data, and the fallback function should log an event if ether is sent with data.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample {
    event FallbackCalled(address sender, uint256 value, bytes data);

    receive() external payable {
        // Handle plain ether transfers
    }

    fallback() external payable {
        // Log fallback call when ether is sent with data
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

