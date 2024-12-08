// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Demonstrates integer rollover and SafeMath in different contexts
contract IntegerRollover {
    
    // Declare two unsigned integers
    uint8 public checkedUint = 255;
    uint8 public uncheckedUint = 255;

    // Function to increment `checkedUint` (default behavior in Solidity 0.8.0+)
    function incrementChecked() public {
        checkedUint += 1; // This will revert if overflow occurs
    }

    // Function to increment `uncheckedUint` using `unchecked` block to allow rollover
    function incrementUnchecked() public {
        unchecked {
            uncheckedUint += 1; // This will wrap around instead of reverting
        }
    }

    // Function to reset both values to 255
    function resetValues() public {
        checkedUint = 255;
        uncheckedUint = 255;
    }
}
