// Task 29: Interacting with an External Contract

// Question: Create a contract that interacts with another contract to retrieve and set data. Assume there is a contract DataStorage with a setData and getData function. Implement a contract that uses DataStorage for storing and retrieving a value.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDataStorage {
    function setData(uint256 _data) external;
    function getData() external view returns (uint256);
}

contract ExternalInteractor {
    address public dataStorageAddress;

    constructor(address _dataStorageAddress) {
        dataStorageAddress = _dataStorageAddress;
    }

    function setExternalData(uint256 _data) public {
        IDataStorage(dataStorageAddress).setData(_data);
    }

    function getExternalData() public view returns (uint256) {
        return IDataStorage(dataStorageAddress).getData();
    }
}
