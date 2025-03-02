// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployNft} from "script/DeployNft.s.sol";
import {nft} from "src/nft.sol";

contract TestNft is Test {
    DeployNft public Deployer;
    nft public basicNft;
    string public constant LinPeng = "ipfs://QmWbqUT53zfAbFjMdpEnsi8NMspc8gpdW1wDbPKrCSSEpe";
    address User = makeAddr("hedi");

    function setUp() public {
        Deployer = new DeployNft();
        basicNft = Deployer.run();
    }

    function testName() public view {
        string memory expectedname = "DOGE";
        string memory realname = basicNft.name();
        assert(keccak256(abi.encodePacked(expectedname)) == keccak256(abi.encodePacked(realname)));
    }

    function testCanMintAndHaveBlanace() public {
        vm.prank(User);
        basicNft.mintNft(LinPeng);
        assert(basicNft.balanceOf(User) == 1);
        assert(keccak256(abi.encodePacked(LinPeng)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
