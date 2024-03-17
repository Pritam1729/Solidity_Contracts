// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7 <0.9.0; //0.8.7

// to use a version greater than 0.8.7 and less than 0.9.0
// to use any version greater than a version we can use ^<version>
// to use a version just use <version>


// contract is a key word which specify after this keyword the contract will start
contract SimpleStorage {
    // bool, unit, address : an address like public key, bytes, int;
    uint32 public num; // it not specified the number will be initialized to 0

    // struct
    struct people {
        uint32 fnum;
        string name;
    }

    people public person = people({fnum: 2,name: "Pritam"});


    // mapping 

    mapping(string => uint32) public nametonum;

    // Array

    people[] public pe; // dynamic array
    // people[3] public pe; static array
    // uint32[] public num2; array of uint32

    // functions

    function store(uint32 _num) public virtual {
        num = _num;
        // get();
        // num = num + 1;
    }

    // function update() public {
    //     num = num + 1;
    // }

    // view, pure are the keywords does not use gas 

    function get() public view returns(uint32) {
        return num;
    }

    function add(string memory _name, uint32 _num) public {
        // people memory temp = people(_num,_name);

        // pe.push(temp);
        pe.push(people(_num,_name)); // another method to put it into array
        nametonum[_name] = _num;
    } 


    // memory (can be modified) and calldata (cannot be modified) -> data will exist only temp ony inside the function
    // storage -> data will exist outisde the function defination 
    // these three can only be specified ot array, struct or mapping types it is not defined for int, uint etc
    // string is an array of bytes so we need to define any one of them
}

// 0xa131AD247055FD2e2aA8b156A11bdEc81b9eAD95
