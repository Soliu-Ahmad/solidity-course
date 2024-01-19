// SPDX_License-identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//single file solidity can hold mulple contract
contract StorageFactory {

// Type visibility variable
SimpleStorage[] public simpleStorageArray;


function createSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
    }

    function sFStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI APPLICATION BINARY INTERFACE 
        // HOW WE CAN INTERACT WITH CONTRACT

        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
        
    }

    function sFGet(uint256 _simpleStorageIndex) public view returns(uint256) {

        return simpleStorageArray[_simpleStorageIndex].retrieve();
    } 
}