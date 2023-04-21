// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

import "./ERC20.sol";

contract TokenFactory {
    MyToken[] public tokens;

    function createToken(string memory _name, string memory _symbol, uint8 _decimals) external {
        tokens.push(new MyToken(_name, _symbol, _decimals));
    }

    function getToken(uint256 _tokenId) external view returns(string memory name, string memory symbol) {
        name = tokens[_tokenId].name();
        symbol = tokens[_tokenId].symbol();
    }
}

