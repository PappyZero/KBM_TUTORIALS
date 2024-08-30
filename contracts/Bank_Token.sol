// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable 
{

    uint256 public constant INITIAL_SUPPLY = 100 * (10 ** uint256(decimals()));

    constructor() ERC20("MyToken", "MTK") Ownable(msg.sender){
        _mint(msg.sender, INITIAL_SUPPLY); // Mint initial supply to the owner
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
