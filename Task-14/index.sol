// Task 14: Lottery Contract

// Question: Write a simple lottery contract where users can buy tickets (by sending ether). At the end of the lottery, randomly pick a winner who receives the entire balance.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address[] public players;

    function enter() public payable {
        require(msg.value > 0.01 ether, "Minimum of 0.01 ether required");
        players.push(msg.sender);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function pickWinner() public {
        require(players.length > 0, "No players in the lottery");
        uint256 index = random() % players.length;
        address winner = players[index];
        payable(winner).transfer(address(this).balance);
        players = new address[]; // Reset for the next lottery
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }
}

