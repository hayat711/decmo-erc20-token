// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";




contract OceanToken is ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;
    
    constructor(uint256 cap, uint256 reward) ERC20("OceanToken", "OCT") ERC20Capped(cap * (10 ** decimals())){
        owner = payable(msg.sender);
        _mint(msg.sender, 70000000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }

    // access-control modifier 
    modifier onlyOwner{
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    function beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        
    }

    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * (10 ** decimals());
    }
}


// Token Design - Ocean Token 
// 1) initial supply (send to owner) - 70 million
// 2) max supply (capped) - 100,000,000
// 3) Mkae token burnable 
