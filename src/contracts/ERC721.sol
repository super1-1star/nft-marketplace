pragma solidity ^0.8.0;

import "./ERC721Metadata.sol";

contract ERC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    mapping(uint256 => address) private _tokenOwner;

    mapping(address => uint256) private _OwnedTokensCount;


    function balanceOf(address _owner) public view returns(uint256){
        
        
        require(_owner !=address(0),'owner quriey for non-exist');
        return _OwnedTokensCount[_owner];
    }


    function ownerOf(uint256 _tokenId) external view returns(address){
        address owner = _tokenOwner[_tokenId];
        return owner;
    }

    function _exist(uint256 tokenId) internal view returns (bool) {
        address onwer = _tokenOwner[tokenId];
        return onwer != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721 minting to the zero address");

        _tokenOwner[tokenId] = to;
        _OwnedTokensCount[to] += 1;


        emit Transfer(address(0), to, tokenId);
    }
}
