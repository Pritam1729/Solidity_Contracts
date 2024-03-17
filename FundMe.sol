// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol"; 

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant minimumusd = 50 * 1e18 ;

    address[] public funders;

    mapping (address=>uint256) public addressToFunder;

    function fund() public payable {

        // while sending we require this much ether
        // msg.value - is the amount sent by the sender
        // msg.sender - is the address of the sender
        require(msg.value.getConvertionRate() >=  minimumusd,"Did't send enough");
        funders.push(msg.sender);
        addressToFunder[msg.sender] = msg.value;

    
    }

    function getBalance() view public returns(uint256) {
        return address(this).balance;
    }

    address public immutable owner; // immutabloe used for defining only once but used in constructor constant cannot be used here becox it is defined in the constructor

    constructor() {
        owner = msg.sender;
    }

    function getaddress() public view returns(address) {
        return address(this);
    }
    
    
    function withdraw() public {
        require(msg.sender == owner,"Access Denied");

        for(uint256 i = 0;i<funders.length;i = i + 1) {
            address funder = funders[i];
            addressToFunder[funder] = 0;
        }

        funders = new address[](0);
        // funders is reset to zero elements to start


        // three diff ways to transfer a eth to other account
        // transfer
        // send
        // call

        // transfer
        // msg.sender is a address type and .transfer work only with payableso type casting
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSucess = payable(msg.sender).send(address(this).balance);
        // require(sendSucess,"Send Failure");

        //call
        (bool callsucess,) = payable(msg.sender).call{value:address(this).balance}("");
        require(callsucess,"Failed to withdraw");

    }

    // if no amount is send or only data  is sent we can use to for not getting this error
    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }

}


// modifier onlyOwner {
//     require(msg.sender == owner,"Access Denied");
//     _;

// }