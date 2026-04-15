//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
contract RetrievableNumber is Ownable {
    uint256 private s_number;
    event NumberChanged(uint256 s_number);

     constructor() Ownable(msg.sender) {}
    
    function store (uint256 newNumber) public onlyOwner {
        s_number = newNumber;
        emit NumberChanged(newNumber);
    }

    function retrieveNumber() external view returns (uint256) {
        return s_number;
    }
}

    
