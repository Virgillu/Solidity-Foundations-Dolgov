//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {Script} from "../lib/forge-std/src/Script.sol";
import {NFT} from "../src/NFT.sol";
contract DeployNFT is Script {
    function run() external returns (NFT) {
        vm.startBroadcast();
        NFT nonfungibleToken = new NFT();
        vm.stopBroadcast();
        return nonfungibleToken;
    }
}
