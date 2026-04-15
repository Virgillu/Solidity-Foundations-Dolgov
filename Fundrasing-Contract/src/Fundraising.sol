//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ETHtoUSDConverter} from "./ETHtoUSDConverter.sol";

//import {AggregatorV3Interface} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract Fundraising {
    using ETHtoUSDConverter for uint256;


    uint256 public minimumAmountSent = 10e18; // 10 ETH in wei
    address [] listOfSenders;
    mapping (address sender => uint256 amountSent) public amountSentByAddress;

    address public owner;

    constructor() {
        owner = msg.sender;
    }
 



    function sendMoney() public payable {

    require(msg.value.convertETHToUSD() >= minimumAmountSent, "Did not send enough money"); // “The msg.value variable in Solidity stands for “message value.” It represents the monetary value that is being sent. That economic value can be of any size—unless specified, as in this case. In traditional finance, msg.value straightforwardly represents the amount of money to be sent from one bank account to another“t means making sure that the amount of money in ETH is more than 1e18 or 1 to the power of 18, which is 1,000,000,000,000,000,000 wei and hence 1 ETH. In Solidity, when you want to specify that a function should receive more than X amount of ETH, you have to think in wei. So instead of saying require(msg.value > 1 ETH, you have to say require(msg.value > 1e18.
        
    listOfSenders.push(msg.sender);
       
    amountSentByAddress[msg.sender] = amountSentByAddress[msg.sender] + msg.value;}


    function withdraw() public onlyTheOwnerCanExecute {
       for (uint256 senderIndex = 0; senderIndex < listOfSenders.length; 
    senderIndex++) {
        address sender = listOfSenders[senderIndex];
        amountSentByAddress[sender] = 0;
    }
    listOfSenders = new address[](0);
 
    (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}
    ("");
    require(callSuccess, "Call failed");
}
modifier onlyTheOwnerCanExecute() {
    require(msg.sender == owner, "Only the owner of the contract can execute this function");
    _;
    }
}


