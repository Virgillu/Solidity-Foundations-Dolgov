//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {Script} from "../lib/forge-std/src/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {NFT} from "../src/NFT.sol";
contract CountractForInteractions is Script {
    string public constant Haki =  "ipfs://QmPpzmGyYyj3USksAPg3QPLC6wBENVWfzcUr1eTyQVBM7e";
    function run() external {
        address mostRecentlyDeployed = 
DevOpsTools.get_most_recent_deployment("NFT", block.chainid);
        mintNFTOnContract(mostRecentlyDeployed);
    }
    function mintNFTOnContract(address _contractAddress) public {
        vm.startBroadcast();
        NFT(_contractAddress).mintNFT(Haki);
        vm.stopBroadcast();
    }
}
