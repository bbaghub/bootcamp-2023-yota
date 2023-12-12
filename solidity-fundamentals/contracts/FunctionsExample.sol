// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

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