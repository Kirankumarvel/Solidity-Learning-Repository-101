// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerExample {
    address public owner;

    // Constructor assigns the deployer as the owner
    constructor() {
        owner = msg.sender;
    }
}
