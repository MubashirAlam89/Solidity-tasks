// Task 24: Random Number Generation in Lottery Game

// Question: Write a simple lottery contract where users can buy tickets (by sending ether), and a winner is selected at random. Use block variables as a basic source of randomness.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LotteryGame {
    address[] public players;

    function buyTicket() public payable {
        require(msg.value == 0.1 ether, "Ticket costs 0.1 ether");
        players.push(msg.sender);
    }

    function pickWinner() public {
        require(players.length > 0, "No players in the lottery");
        uint256 winnerIndex = random() % players.length;
        address winner = players[winnerIndex];
        payable(winner).transfer(address(this).balance);
        players = new address; //Reset players for next lottery
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players)));
    }
}
