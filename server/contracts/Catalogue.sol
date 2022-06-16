// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.3;
import "hardhat/console.sol";

contract Catalogue {

    mapping(address => string[]) public favList;
    mapping(address => string[]) public watchedList;
    mapping(address => string[]) public toWatchList;

    constructor() {
        console.log("Initialized Catalogue.sol");
    }

    function equalsString(string memory a, string memory b) public pure returns (bool) {
         if(bytes(a).length != bytes(b).length) {
            return false;
        } else {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
        }
    }

    // Favourite List functions

    function pushFavList(string memory itemId) public {
        favList[msg.sender].push(itemId);
    }

    function removeFavList(string memory itemId) public {
        for (uint i = 0; i < favList[msg.sender].length; i++) {
            if (equalsString(favList[msg.sender][i], itemId)) {
                for (uint j = i; j < favList[msg.sender].length-1; j++) {
                     favList[msg.sender][j] = favList[msg.sender][j+1];
                }
                favList[msg.sender].pop();
                break;
            }
        }
    }

    function getFavList() public view returns(string[] memory) {
        return favList[msg.sender];
    }

    // Watched List functions

    function pushWatchedList(string memory itemId) public {
        watchedList[msg.sender].push(itemId);
    }

    function removeWatchedList(string memory itemId) public {
        for (uint i = 0; i < watchedList[msg.sender].length; i++) {
            if (equalsString(watchedList[msg.sender][i], itemId)) {
                for (uint j = i; j < watchedList[msg.sender].length-1; j++) {
                     watchedList[msg.sender][j] = watchedList[msg.sender][j+1];
                }
                watchedList[msg.sender].pop();
                break;
            }
        }
    }

    function getWatchedList() public view returns(string[] memory) {
        return watchedList[msg.sender];
    }

    // To Watch List functions

    function pushToWatchList(string memory itemId) public {
        toWatchList[msg.sender].push(itemId);
    }

    function removeToWatchList(string memory itemId) public {
        for (uint i = 0; i < toWatchList[msg.sender].length; i++) {
            if (equalsString(toWatchList[msg.sender][i], itemId)) {
                for (uint j = i; j < toWatchList[msg.sender].length-1; j++) {
                     toWatchList[msg.sender][j] = toWatchList[msg.sender][j+1];
                }
                toWatchList[msg.sender].pop();
                break;
            }
        }
    }

    function getToWatchList() public view returns(string[] memory) {
        return toWatchList[msg.sender];
    }
}