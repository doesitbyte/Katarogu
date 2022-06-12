// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.3;
import "hardhat/console.sol";

contract Catalogue {

    struct Show {
        string id;
        string picture;
        string name;
    }

    Show[] public showList;

    constructor() {
        console.log("Test");
    }

    function addShow(string memory id, string memory picture, string memory name) public {
        showList.push(Show(id, picture, name));
    }
}