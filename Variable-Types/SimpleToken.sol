// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    // State variables
    string public name = "MyToken";           // String type
    string public symbol = "MTK";
    uint8 public decimals = 18;               // 18 decimals (fixed-point simulation)
    uint public totalSupply;                  // Unsigned integer for total supply
    address public owner;                     // Address type

    // Mapping for balances
    mapping(address => uint) public balanceOf; // Mapping to track token balance

    // Constructor to initialize total supply and assign to the owner
    constructor(uint _initialSupply) {
        owner = msg.sender;                // Assign the deployer as the owner
        totalSupply = _initialSupply;      
        balanceOf[owner] = _initialSupply; // Assign all tokens to the deployer
    }

    // Transfer function
    function transfer(address _to, uint _amount) public returns (bool success) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        balanceOf[msg.sender] -= _amount;   // Deduct from sender
        balanceOf[_to] += _amount;          // Add to recipient
        return true;
    }
}
