pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

// contract Kryptobird{
//     string public name;
//     string public symbol;

//     constructor () {
//         name ='Kryptobird';
//         symbol = 'KBIRDZ';
//     }
// }

contract KryptoBird is ERC721Connector {
    string[] public KryptoBirdz;

    mapping(string => bool) _kryptoBirdzExists;

    function mint(string memory _kryptoBird) public {
        require(!_kryptoBirdzExists[_kryptoBird],'ERROR - present');
        KryptoBirdz.push(_kryptoBird);
        uint256 _id = KryptoBirdz.length - 1;

        _mint(msg.sender,_id);

        _kryptoBirdzExists[_kryptoBird] = true;
    }

    constructor() ERC721Connector("KryptoBird", "KBIRDZ") {}
}
