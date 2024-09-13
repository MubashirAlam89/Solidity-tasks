// Task 32: Multi-Signature Wallet

// Question: Implement a basic multi-signature wallet contract where multiple owners must approve a transaction before it can be executed. Require at least 2 of 3 owners to approve any transaction.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet {
    address[3] public owners;
    mapping(address => bool) public approvals;

    constructor(address[3] memory _owners) {
        owners = _owners;
    }

    function approve() public {
        require(isOwner(msg.sender), "Not an owner");
        approvals[msg.sender] = true;
    }

    function executeTransaction(address payable _to, uint256 _amount) public {
        require(countApprovals() >= 2, "Need at least 2 approvals");
        _to.transfer(_amount);
        resetApprovals();
    }

    function isOwner(address _address) private view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == _address) return true;
        }
        return false;
    }

    function countApprovals() private view returns (uint8 count) {
        for (uint i = 0; i < owners.length; i++) {
            if (approvals[owners[i]]) count++;
        }
    }

    function resetApprovals() private {
        for (uint i = 0; i < owners.length; i++) {
            approvals[owners[i]] = false;
        }
    }

    receive() external payable {}
}
