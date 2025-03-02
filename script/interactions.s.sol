// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {nft} from "src/nft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintNft is Script {
    string public constant LinPeng = "ipfs://QmWbqUT53zfAbFjMdpEnsi8NMspc8gpdW1wDbPKrCSSEpe";

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment("nft", block.chainid);
        mintNftOnContract(mostRecentDeployed);
    }

    function mintNftOnContract(address _deployed) public {
        vm.startBroadcast();
        nft(_deployed).mintNft(LinPeng);
        vm.stopBroadcast();
    }
}
