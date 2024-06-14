// Task 7: Basic Array Operations

// Question: Create a contract that allows users to add and remove integers from an array and retrieve the entire array.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerArray {
    int256[] private numbers;

    function addNumber(int256 _num) public {
        numbers.push(_num);
    }

    function removeLast() public {
        require(numbers.length > 0, "Array is empty");
        numbers.pop();
    }

    function getNumbers() public view returns (int256[] memory) {
        return numbers;
    }
}
