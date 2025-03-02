// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";
import {MoodNft} from "src/Moodnft.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public Deployer;

    function setUp() public {
        Deployer = new DeployMoodNft();
    }

    function testConvertSVGtoUri() public {
        string memory expectedSvg =
            "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+PGNpcmNsZSBjeD0iNTAiIGN5PSI1MCIgcj0iNTAiIGZpbGw9IiM0Q0FGNTAiIC8+PGNpcmNsZSBjeD0iNTAiIGN5PSI0MCIgcj0iMTgiIGZpbGw9IiNGRkQ3MDAiIC8+PGNpcmNsZSBjeD0iNDMiIGN5PSIzNSIgcj0iMiIgZmlsbD0iIzMzMyIgLz48Y2lyY2xlIGN4PSI1NyIgY3k9IjM1IiByPSIyIiBmaWxsPSIjMzMzIiAvPjxwYXRoIGQ9Ik00MiA0NSBRNTAgNTAgNTggNDUiIHN0cm9rZT0iIzMzMyIgc3Ryb2tlLXdpZHRoPSIyIiBmaWxsPSJub25lIiAvPjxyZWN0IHg9IjM1IiB5PSI2MCIgd2lkdGg9IjMwIiBoZWlnaHQ9IjIwIiBmaWxsPSIjRkZENzAwIiAvPjx0ZXh0IHg9IjUwIiB5PSI5MiIgZm9udC1zaXplPSIxMiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iI0ZGRkZGRiIgZm9udC1mYW1pbHk9IkFyaWFsIj5KRDwvdGV4dD48L3N2Zz4=";
        string memory svg =
            '<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="50" fill="#4CAF50" /><circle cx="50" cy="40" r="18" fill="#FFD700" /><circle cx="43" cy="35" r="2" fill="#333" /><circle cx="57" cy="35" r="2" fill="#333" /><path d="M42 45 Q50 50 58 45" stroke="#333" stroke-width="2" fill="none" /><rect x="35" y="60" width="30" height="20" fill="#FFD700" /><text x="50" y="92" font-size="12" text-anchor="middle" fill="#FFFFFF" font-family="Arial">JD</text></svg>';
        string memory correctUri = Deployer.svgToUrl(svg);
        assert(keccak256(abi.encodePacked(expectedSvg)) == keccak256(abi.encodePacked(correctUri)));
    }
}
