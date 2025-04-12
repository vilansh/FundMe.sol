// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    //Get funds from the users
    //Withdraw funds to the owner of the contract
    using PriceConverter for uint256;

    //Set a minimum funding value in USD
    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;

    address public immutable i_owner; 

    mapping( address => uint256) public addressToAmountFunded;

    constructor(){
        i_owner = msg.sender;
    }
    function fund() public payable{
        // Allow Users to send $
        // Have a minimum $ sent
        // 1.How do we send ETH to this transact?
       
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didnt send enough ETH"); //1e18 = 1ETH = 1*10**18 WEI
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =addressToAmountFunded[msg.sender]+ msg.value;
        //msg.sender = global variable = address of the person calling the function
        //msg.value = global variable = The amount of ETH (in wei) that the person is sending with this transaction
    }


    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Only Owner can withdraw");
        //for(starting index ; ending index ; step amount)
        for(uint256 funderIndex = 0 ; funderIndex < funders.length; funderIndex++){
            address funder =  funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }
            //resetting the array
            funders = new address[](0);

            //Actually withdraw the funds now
            //3 methods, Use anyone

            // // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call
         (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
            
    }

    modifier onlyOwner(){
        // require(msg.sender == i_owner , "Only the Owner can perform this action!");
        if(msg.sender != i_owner){
            revert NotOwner();
        }
        _;
    }

    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \
    //         yes  no
    //         /     \
    //    receive()?  fallback()
    //     /   \
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }

}



