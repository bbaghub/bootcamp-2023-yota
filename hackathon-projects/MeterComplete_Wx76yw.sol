// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract MeterComplete {
    address admin;

    // struct to store data
    struct Details {
        string gpsAddress;
        string region;
        string meterType;
        string meterNumber;
    }

    // Map the struct data
    mapping(string => Details) public DetailsMapping;

    // Event emitted after adding details
    event DetailsAdded(string meterNumber, string gpsAddress, string region, string meterType);

    //Modifier to restrict access to only the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // store admin address
    constructor(address _admin) {
        admin = _admin;
    }

     function addDetails(
        string memory _gpsAddress,
        string memory _region,
        string memory _meterType,
        string memory _meterNumber
    ) public onlyAdmin {
        Details memory details = Details(_gpsAddress, _region, _meterType, _meterNumber);

        DetailsMapping[_gpsAddress] = details;
        DetailsMapping[_region] = details;
        DetailsMapping[_meterNumber] = details;
        DetailsMapping[_meterType] = details;
        emit DetailsAdded(_meterNumber, _gpsAddress, _region, _meterType);

    }


}