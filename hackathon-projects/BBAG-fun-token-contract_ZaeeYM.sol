// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20FlashMint.sol";
import "@openzeppelin/contracts@5.0.1/access/Ownable.sol";

contract BBAGFuntoken is ERC20, ERC20Burnable, ERC20Permit, ERC20Votes, ERC20FlashMint, Ownable {
    constructor(address initialOwner)
        ERC20("BBAG Funtoken", "BFT")
        ERC20Permit("BBAG Funtoken")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 21000000 * 10 ** decimals());
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}
