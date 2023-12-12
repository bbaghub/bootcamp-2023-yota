
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ModifierExample {
    mapping(address => uint) balanceReceived;

    address payable owner;

    constructor() public {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address) {
        return owner;
    }
    
    
}