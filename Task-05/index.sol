// Task 5: Simple Voting Contract

// Question: Create a contract where users can vote for one of two options: "Option A" or "Option B".

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    uint256 public votesForA;
    uint256 public votesForB;

    function voteA() public {
        votesForA += 1;
    }

    function voteB() public {
        votesForB += 1;
    }

    function getVotes() public view returns (uint256, uint256) {
        return (votesForA, votesForB);
    }
}
