// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {nft} from "src/nft.sol";

contract DeployNft is Script {
    function run() external returns (nft) {
        vm.startBroadcast();
        nft Nft = new nft();
        vm.stopBroadcast();
        return Nft;
    }
}
