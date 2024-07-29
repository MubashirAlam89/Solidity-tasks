// Task 19: Crowdfunding Contract

// Question: Write a basic crowdfunding contract that allows contributors to donate ether. Set a funding goal and a deadline. If the goal is met by the deadline, funds go to the creator; otherwise, contributors can withdraw.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public creator;
    uint256 public goal;
    uint256 public deadline;
    mapping(address => uint256) public contributions;
    uint256 public totalContributed;

    constructor(uint256 _goal, uint256 _duration) {
        creator = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Crowdfunding has ended");
        contributions[msg.sender] += msg.value;
        totalContributed += msg.value;
    }

    function withdrawFunds() public {
        require(block.timestamp >= deadline, "Crowdfunding still active");

        if (totalContributed >= goal) {
            require(msg.sender == creator, "Only creator can withdraw");
            payable(creator).transfer(address(this).balance);
        } else {
            uint256 amount = contributions[msg.sender];
            contributions[msg.sender] = 0;
            payable(msg.sender).transfer(amount);
        }
    }
}
