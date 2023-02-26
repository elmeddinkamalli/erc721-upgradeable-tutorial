// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Panda is Initializable, UUPSUpgradeable,  ERC721Upgradeable, ERC721URIStorageUpgradeable, OwnableUpgradeable {
    uint256 public tokenId;

    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC721_init("Panda", "PND");
        __ERC721URIStorage_init();
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function mint(string memory uri)
        public
    {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
        tokenId++;
    }

    function _burn(uint256 id) internal override(ERC721Upgradeable, ERC721URIStorageUpgradeable) {
        super._burn(id);
    }

    function tokenURI(uint256 id)
        public
        view
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
        returns (string memory)
    {
        return super.tokenURI(id);
    }

    function _authorizeUpgrade(address newImplementation) internal onlyOwner override{}
}