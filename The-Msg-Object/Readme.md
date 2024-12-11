# Address Type in Solidity and Guestbook Contract Example

## 1. Detailed Explanation of Address Type in Solidity

### What is the Address Type?

In Solidity, the `address` type is used to store 20-byte Ethereum addresses. These addresses represent both:

1. **Externally Owned Accounts (EOAs)**: Accounts controlled by private keys (e.g., wallets).
2. **Smart Contracts**: Contracts deployed on the Ethereum blockchain.

Addresses are essential in interacting with the Ethereum network, such as sending transactions, interacting with contracts, or querying balances.

### Characteristics of the `address` Type

- **Size**: Stores 20 bytes (160 bits).
- **Default Value**: `0x0000000000000000000000000000000000000000` (all zeros).
- **Balance**: Each address has an associated balance (measured in wei).
- **Read-Only**: You can read the balance of an address but can't modify it directly.

### Syntax

```solidity
address public myAddress;
```

### Common Address Operations

1. **Setting an Address**:

   ```solidity
   function setAddress(address _newAddress) public {
       myAddress = _newAddress;
   }
   ```

2. **Getting the Balance of an Address**:

   ```solidity
   function getBalance() public view returns (uint256) {
       return myAddress.balance;
   }
   ```

3. **Using `msg.sender`**: Refers to the address that called the function.

   ```solidity
   function setCallerAddress() public {
       myAddress = msg.sender;
   }
   ```

### Address vs. Address Payable

- **`address`**: Basic address type that cannot receive Ether.
- **`address payable`**: Special type of address that can receive Ether via the `transfer` or `send` functions.

### Address Example

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressExample {
    address public myAddress;

    function setMyAddress(address _address) public {
        myAddress = _address;
    }

    function getBalance() public view returns (uint256) {
        return myAddress.balance;
    }
}
```

---

## 2. Real-Time Example: Guestbook Contract

### Overview

This Guestbook Contract allows users to "sign" the guestbook by storing their address and a custom message. It tracks who the last signer was and what message they left.

### Key Features

- **Sign the Guestbook**: Users can sign the guestbook with their Ethereum address and a message.
- **Track Last Signer**: The contract keeps track of the last person who signed.
- **Reset the Guestbook**: The last signer can reset the guestbook.

### Guestbook Contract Code

```solidity
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
```

### How to Use the Contract

1. **Deploy the Contract**:
   - Use **Remix IDE** or **Hardhat** to deploy the contract to a test network (e.g., Goerli or Sepolia).

2. **Sign the Guestbook**:
   - Call the `signGuestbook` function with a message.

   ```solidity
   signGuestbook("Hello, blockchain!")
   ```

3. **Check the Last Signer**:
   - View `lastSigner` and `lastMessage` to see who signed last.

4. **Reset the Guestbook**:
   - If you are the last signer, call `resetGuestbook` to clear the guestbook.

### Example Workflow

1. **User A signs the guestbook**:
   - **Function Call**: `signGuestbook("Great event!")`
   - **Result**: `lastSigner` = User A's address, `lastMessage` = "Great event!"

2. **User B signs the guestbook**:
   - **Function Call**: `signGuestbook("Loving this dApp!")`
   - **Result**: `lastSigner` = User B's address, `lastMessage` = "Loving this dApp!"

3. **User B resets the guestbook**:
   - **Function Call**: `resetGuestbook()`
   - **Result**: `lastSigner` = `0x0000000000000000000000000000000000000000`, `lastMessage` = ""

### Real-World Applications

- **Event Registrations**: Attendees can sign a digital guestbook at conferences.
- **Proof of Participation**: Track user interactions in decentralized apps.
- **Audit Trails**: Keep a record of the last update made to a contract.

---

## Conclusion

- **Address Type** is crucial for interacting with Ethereum accounts and smart contracts.
- The **Guestbook Contract** demonstrates a real-world use case for tracking addresses and messages in a decentralized way.
