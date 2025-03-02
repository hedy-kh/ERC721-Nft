// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployNft} from "script/DeployNft.s.sol";
import {MoodNft} from "src/Moodnft.sol";

contract TestMoodNft is Test {
    MoodNft moodNft;
    address user = makeAddr("user");
    string public constant H_svg =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+DQogIDxjaXJjbGUgY3g9IjUwIiBjeT0iNTAiIHI9IjQ1IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9InllbGxvdyIgLz4NCiAgPGNpcmNsZSBjeD0iMzUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siIC8+DQogIDxjaXJjbGUgY3g9IjY1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIiAvPg0KICA8cGF0aCBkPSJNMzUgNjAgUTUwIDc1IDY1IDYwIiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIC8+DQo8L3N2Zz4NCg==";
    string public constant S_svg =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgMTAwIDEwMCI+DQogIDxjaXJjbGUgY3g9IjUwIiBjeT0iNTAiIHI9IjQ1IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9InJlZCIgLz4NCiAgPGNpcmNsZSBjeD0iMzUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siIC8+DQogIDxjaXJjbGUgY3g9IjY1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIiAvPg0KICA8cGF0aCBkPSJNMzUgNzAgUTUwIDU1IDY1IDcwIiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIC8+DQo8L3N2Zz4NCg==";

    function setUp() public {
        moodNft = new MoodNft(S_svg, H_svg);
    }

    function testViewTokenUri() public {
        vm.prank(user);
        moodNft.mint();
        console.log(moodNft.tokenURI(0));
    }
}
