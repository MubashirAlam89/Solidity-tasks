// Task 34: Implementing Gasless Transactions with EIP-712

// Question: Create a contract that allows gasless transactions using EIP-712. Implement a permit function that allows token transfer without paying gas fees.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract GaslessToken is ERC20Permit {
    constructor() ERC20("GaslessToken", "GLT") ERC20Permit("GaslessToken") {
        _mint(msg.sender, 1000 * 10**18);
    }
}
