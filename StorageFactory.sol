// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    
    SimpleStorage[] public simplestoragearr;


    function createSimpleStorageContract() public {
        SimpleStorage simplestorage = new SimpleStorage();
        simplestoragearr.push(simplestorage);
    }

    function sfstore(uint32 _simpleStorageIndex, uint32 _simpleStoragevalue)  public {
        // to interact with an contract we would require two things one is address and other is ABI - application binary interface
        // ABI - will tell out code how it can interact with the contract
        // we get the abi automatically when we import it

        // SimpleStorage simplestorage = simplestoragearr[_simpleStorageIndex];

        // simplestorage.store(_simpleStoragevalue);

        simplestoragearr[_simpleStorageIndex].store(_simpleStoragevalue);


    }


    function sfget(uint32 _simplestorageindex) public view returns(uint32) {
        // SimpleStorage simplestorage = simplestoragearr[_simplestorageindex];
        // return simplestorage.get();
        return simplestoragearr[_simplestorageindex].get();

    }

}