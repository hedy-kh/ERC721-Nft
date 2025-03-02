// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    error MoodNft__CantFlipMoodIfNotOwner();

    uint256 private s_TokenId;
    string private s_Hsvg;
    string private s_Ssvg;

    enum Mood {
        Ha,
        Sa
    }

    mapping(uint256 => Mood) s_tokentToMood;

    constructor(string memory Ssvg, string memory Hsvg) ERC721("MoodNft", "MNFT") {
        s_TokenId = 0;
        s_Hsvg = Hsvg;
        s_Ssvg = Ssvg;
    }

    function mint() public {
        _safeMint(msg.sender, s_TokenId);
        s_tokentToMood[s_TokenId] = Mood.Ha;
        s_TokenId++;
    }

    function flipMood(uint256 tokenId) public {
        if (getApproved(tokenId) != msg.sender && ownerOf(tokenId) != msg.sender) {
            revert MoodNft__CantFlipMoodIfNotOwner();
        }
        if (s_tokentToMood[tokenId] == Mood.Ha) {
            s_tokentToMood[tokenId] == Mood.Sa;
        } else {
            s_tokentToMood[tokenId] == Mood.Ha;
        }
    }

    function _baseURI() internal view override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokentToMood[tokenId] == Mood.Ha) {
            imageURI = s_Hsvg;
        } else {
            imageURI = s_Ssvg;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
}
