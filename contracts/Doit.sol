//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Doit is ERC20, ERC20Capped, ERC20Burnable, Ownable {
    //Define the max supply
    uint256 public maxSupply = 1000000000;
    uint256 public _totalSupplyAll;
    constructor()
        ERC20("Lenovo", "LEN")
        ERC20Capped(maxSupply)
        Ownable(msg.sender)
    {
        //Initialize the Maximum Supply
        //Max Supply = 1000000000;

        //Mint the initial Supply
        uint256 initialSupply = 7000000 * 10 ** decimals();
        _mint(msg.sender, initialSupply);
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupplyAll;
    }

    //Funtion to Mind tokens and respeting the max supply
    function mint(address to, uint256 amount) public onlyOwner {
        require((totalSupply() + amount) <= maxSupply, "Max supply exceeded");
        _mint(to, amount);
    }

    //Funtion to reward miners or any specified address
    function rewardMiner(address miner, uint256 amount) public onlyOwner {
        require((totalSupply() + amount) <= maxSupply, "Max supply exceeded");
        _mint(miner, amount);
    }

    // Override the _update function
    function _update(
        address from,
        address to,
        uint256 value
    ) internal override(ERC20, ERC20Capped) {
        super._update(from, to, value);
    }
}
