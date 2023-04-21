// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/proxy/Clones.sol";

import "./ERC20.sol";

contract MinimalClone {
    using Clones for address;

    MyToken implementation;
    
    address[] myTokens;

    constructor() {
        implementation = new MyToken();
    }

    function cloneToken(string memory _name, string memory _symbol, uint8 _decimals) external {
        address myToken = address(implementation).clone();
        MyToken(myToken).initialize(_name, _symbol, _decimals);
        myTokens.push(myToken);
    }

    function getToken(uint256 _tokenId) external view returns(string memory name, string memory symbol) {
        name = MyToken(myTokens[_tokenId]).name();
        symbol = MyToken(myTokens[_tokenId]).symbol();
    }
}
