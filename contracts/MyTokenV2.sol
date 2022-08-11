// contracts/MyTokenV2.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol';
import '@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol';
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract MyTokenV2 is Initializable, ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable {
    uint public num;
    bool blacklist;

    function initialize() public initializer {
        __ERC20_init('MyToken', 'MTK');

        __Ownable_init();

        _mint(msg.sender, 1000 * 10**decimals());
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}

    function add(uint _num) public {
      num += _num;
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        require(blacklist, 'oh-dear');
        super.transfer(to, value);
    }

}
