// Task 36: Using Chainlink VRF for True Randomness

// Question: Write a contract that uses Chainlink VRF to generate a truly random number, which can be used for applications like lotteries. Set up the contract to request a random number from Chainlink VRF and handle the callback.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomNumber is VRFConsumerBase {
    bytes32 internal keyHash;
    uint256 internal fee;
    uint256 public randomResult;

    constructor(address vrfCoordinator, address link, bytes32 _keyHash, uint256 _fee) 
        VRFConsumerBase(vrfCoordinator, link) 
    {
        keyHash = _keyHash;
        fee = _fee;
    }

    function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK");
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }
}
