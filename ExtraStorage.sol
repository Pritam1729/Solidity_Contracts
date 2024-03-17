// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// Inheritance (is keyword is used for ingeritance)

contract ExtraStorage is SimpleStorage{
    // store to add 5   
    // override and virtual keyword are used for this task

    function store(uint32 _num) public override {
        num = _num + 5;
    }
}