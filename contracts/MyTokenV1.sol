// contract/MyTokenV1.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

contract MyTokenV1 is Initializable, ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable, AccessControlUpgradeable {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    function initialize(string memory name, string memory symbol) initializer public {
        __ERC20_init(name, symbol);
        __Ownable_init();
        __UUPSUpgradeable_init();

        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(BURNER_ROLE, msg.sender);
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    // only ADMIN!!
    function _authorizeUpgrade(address) internal override onlyOwner {}

    // function mint(address to, uint256 amount) public {
    //     require(hasRole(MINTER_ROLE, msg.sender), "invalid-minter");
    //     _mint(to, amount);
    // }

    // function addMinter(address _address) public {
    //     grantRole(MINTER_ROLE, _address);
    // }

    // function removeMinter(address _address) public {
    //     revokeRole(MINTER_ROLE, _address);
    // }

    // function burn(address from, uint256 amount) public {
    //     require(hasRole(BURNER_ROLE, msg.sender), "invalid-burner");
    //     _burn(from, amount);
    // }

    // function addBurner(address _address) public {
    //     grantRole(BURNER_ROLE, _address);
    // }

    // function removeBurner(address _address) public {
    //     revokeRole(BURNER_ROLE, _address);
    // }
}
