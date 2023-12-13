// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FunctionsExample {
    mapping(address => uint) tokenBalance;

    address payable owner;

    uint tokenPrice = 1 ether;

    constructor() public {
        owner = payable(msg.sender);
        tokenBalance[owner] = 100;
    }


    function getOwner() public view returns(address) {
        return owner;
    }
    
    function createNewToken() public {
        require(msg.sender == owner, "You are not authorized");
        tokenBalance[owner]++;
    }

    function burnToken() public {
        require(msg.sender == owner, "You are not authorized");
        tokenBalance[owner]--;
    }
    
}

/*
public: The function is accessible from outside the contract but cannot receive Ether.
public payable: The function is accessible from outside the contract and can receive Ether.
internal: The function is only accessible from within the contract.
private: The function is only accessible from within the contract and derived contracts.
view: The function is read-only and does not modify the contract's state. It cannot receive Ether.
pure: The function is read-only and does not access the contract's state or receive Ether.
nonpayable: The function is accessible from outside the contract but cannot receive Ether.
*/