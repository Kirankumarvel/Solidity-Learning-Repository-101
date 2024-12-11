// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract BlockchainMessenger {
    // State variables
    uint public changeCounter; // Counter for message updates
    address public owner;       // Address of the contract owner
    string public message;     // The stored message

    // Constructor to initialize state variables
    constructor() {
        owner = msg.sender; // Set the owner to the address that deploys the contract
        message = "";       // Initialize message as empty
        changeCounter = 0;  // Initialize change counter to zero
    }

    // Function to update the message
    function updateMessage(string memory _newMessage) public {
        require(msg.sender == owner, "Only the owner can update the message."); // Check if sender is owner
        message = _newMessage; // Update message with new value
        changeCounter++;       // Increment change counter
    }
}
