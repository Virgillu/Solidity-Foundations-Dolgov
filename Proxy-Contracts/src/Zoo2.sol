//SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
contract Zoo2 {
    uint256 internal numberOfvistors;
    function setNumberOfVisitors (uint256 _number) external {}
    function getNumberofVisitors() external view returns(uint256) {
        return numberOfvistors;
    }
    function version() external pure returns(uint256) {
        return 2;  
    }
}
