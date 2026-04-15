//SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
contract Zoo1 is UUPSUpgradeable {
    uint256 internal numberOfVisitors;
 
    function getNumberOfVisitors() external view returns(uint256){
        return numberOfVisitors;
    }
 
    function version() external pure returns(uint256){
        return 1;
    }
 
    function _authorizeUpgrade(address newImplementation) internal override {}
 
}
