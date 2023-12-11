// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) pubic myAddressMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}