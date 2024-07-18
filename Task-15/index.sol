// Task 15: MultiSig Wallet

// Question: Implement a basic MultiSig Wallet contract that requires two out of three owners to approve a transaction before it can be executed.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet {
    address[3] public owners;
    mapping(address => bool) public isOwner;
    uint256 public approvalCount;
    mapping(address => bool) public approvals;

    constructor(address _owner1, address _owner2, address _owner3) {
        owners[0] = _owner1;
        owners[1] = _owner2;
        owners[2] = _owner3;
        isOwner[_owner1] = true;
        isOwner[_owner2] = true;
        isOwner[_owner3] = true;
    }

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    function approveTransaction() public onlyOwner {
        require(!approvals[msg.sender], "Already approved");
        approvals[msg.sender] = true;
        approvalCount += 1;
    }

    function executeTransaction(address payable to, uint256 amount) public onlyOwner {
        require(approvalCount >= 2, "Need at least two approvals");
        approvalCount = 0;
        approvals[owners[0]] = false;
        approvals[owners[1]] = false;
        approvals[owners[2]] = false;
        to.transfer(amount);
    }

    receive() external payable {}
}
