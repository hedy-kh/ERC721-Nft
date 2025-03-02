// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "src/Moodnft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./images/sadFace.svg");
        string memory happySvg = vm.readFile("./images/happyface.svg");
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToUrl(sadSvg), svgToUrl(happySvg));
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToUrl(string memory svg) public returns (string memory) {
        string memory BaseUrl = "data:image/svg+xml;base64,";
        string memory base64Svg = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(BaseUrl, base64Svg));
    }
}
