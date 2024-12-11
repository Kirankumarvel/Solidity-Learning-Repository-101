// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Guestbook {
    // Address of the last signer
    address public lastSigner;
    
    // Message left by the last signer
    string public lastMessage;
    
    // Event to log each signing action
    event GuestSigned(address indexed signer, string message);

    // Function to sign the guestbook
    function signGuestbook(string memory message) public {
        lastSigner = msg.sender;
        lastMessage = message;
        
        // Emit an event to log the action
        emit GuestSigned(msg.sender, message);
    }

    // Function to reset the guestbook (only the last signer can reset)
    function resetGuestbook() public {
        require(msg.sender == lastSigner, "Only the last signer can reset the guestbook.");
        lastSigner = address(0);
        lastMessage = "";
    }
}
