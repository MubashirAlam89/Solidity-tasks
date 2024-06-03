// Task 3: Increment and Decrement

// Question: Create a contract with an integer variable that users can increment or decrement.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    int256 private count;

    function increment() public {
        count += 1;
    }

    function decrement() public {
        count -= 1;
    }

    function getCount() public view returns (int256) {
        return count;
    }
}