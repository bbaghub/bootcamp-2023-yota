// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    uint8 public myUint8;

    function incrementUint() public {
        myUint8++;
    }

    function decrementUint() public {
        myUint8--;
    }

    address public myAddress;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }

    string public myString = 'hack the planet';

    function setMyString(string memory _mystring) public {
        myString = _mystring;
    }
}