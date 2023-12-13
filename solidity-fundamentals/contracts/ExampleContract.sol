// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Importing a basic ownership contract as an example of inheritance and import
import "@openzeppelin/contracts/access/Ownable.sol";

// Contract inherits from Ownable, demonstrating inheritance
contract ExampleContract is Ownable {

    constructor(address initialOwner) Ownable(initialOwner) {}

    // A simple struct demonstrating the struct data type
    struct Person {
        string name;
        uint age;
    }

    // Mapping from an address to a Person - demonstrates use of mapping and address
    mapping(address => Person) public personInfo;

    // An array of addresses to demonstrate array usage
    address[] public participants;

    // Function to add a person
    function addPerson(string memory _name, uint _age) public {
        Person memory newPerson = Person(_name, _age);
        personInfo[msg.sender] = newPerson;
        participants.push(msg.sender);
    }

    // Function demonstrating if/else and a modifier (onlyOwner is from Ownable)
    function checkParticipant(address _addr) public view onlyOwner returns(bool) {
        for(uint i = 0; i < participants.length; i++) {
            if(participants[i] == _addr) {
                return true;
            }
        }
        return false;
    }

    // Function demonstrating a while loop
    function isAdult(address _addr) public view returns (bool) {
        uint i = 0;
        while(i < participants.length) {
            if(participants[i] == _addr && personInfo[_addr].age >= 18) {
                return true;
            }
            i++;
        }
        return false;
    }
}
