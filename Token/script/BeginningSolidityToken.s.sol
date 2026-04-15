// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {BeginningSolidityToken} from "../src/BeginningSolidityToken.sol";
import {Script} from "forge-std/Script.sol";

contract DBeginningSolidityToken is Script {
    uint256 public constant INITIAL_SUPPLY = 100 ether;

    function run() external {
        vm.startBroadcast();
        new BeginningSolidityToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}

