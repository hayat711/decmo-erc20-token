// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Token is ERC20 {

    constructor() ERC20("OnMyChain", "OMC") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    



}

