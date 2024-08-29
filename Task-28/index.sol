// Task 28: Emitting Events for State Changes

// Question: Write a contract that emits events whenever a state change occurs. Use an event to log the old and new value whenever a variable is updated.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    uint256 public value;

    event ValueChanged(uint256 oldValue, uint256 newValue);

    function updateValue(uint256 _newValue) public {
        emit ValueChanged(value, _newValue);
        value = _newValue;
    }
}
