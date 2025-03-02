// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract nft is ERC721 {
    uint256 private s_TokenCounter;
    mapping(uint256 => string) private s_tokenIdToURI;

    constructor() ERC721("DOGE", "DOG") {
        s_TokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToURI[s_TokenCounter] = tokenUri;
        _safeMint(msg.sender, s_TokenCounter);
        s_TokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
