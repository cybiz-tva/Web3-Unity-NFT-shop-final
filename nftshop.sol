// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Importing ERC 1155 Token contract from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";


contract NftShop is ERC1155 , Ownable  {
    
    string public name = "Unity NFT Shop";

    mapping(uint256 => string) _tokenUrls;
    
    constructor() ERC1155("")  {}

    function buyItem(uint256 _tokenId, string memory _tokenUrl, bytes memory data) public /*onlyOwner*/{
        
        //IMPORTANT Implement own security (set ownership to users). Not production ready contract
        
        _tokenUrls[_tokenId] = _tokenUrl;
        _mint(msg.sender, _tokenId, 1, data);
    }
    
    function uri(uint256 id) public view virtual override returns (string memory) {
        return _tokenUrls[id];
    }
}