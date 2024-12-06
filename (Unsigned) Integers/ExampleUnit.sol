// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnsignedIntegers {
    // State Variables
    uint256 public myUint;     // Default: 0
    uint8 public smallUint;    // Smaller unsigned integer (0 to 255)
    int256 public myInt;       // Default: 0 (supports negative values)

    // Constructor: Initialize values
    constructor() {
        myUint = 100;        // Initialize uint256 to 100
        smallUint = 250;     // Initialize uint8 to 250
        myInt = -10;         // Initialize int256 to -10
    }

    // Setters for myUint and smallUint
    function setMyUint(uint256 _value) public {
        myUint = _value; // Set new value for uint256
    }

    function setSmallUint(uint8 _value) public {
        smallUint = _value; // Set new value for uint8
    }

    // Increment and Decrement for Unsigned Integers
    function incrementSmallUint() public {
        smallUint++; // Increment by 1 (Reverts if smallUint exceeds 255)
    }

    function decrementSmallUint() public {
        require(smallUint > 0, "smallUint cannot go below zero");
        smallUint--; // Decrement by 1
    }

    // Arithmetic Operations
    function add(uint256 _value) public {
        myUint += _value; // Add to myUint
    }

    function subtract(uint256 _value) public {
        require(myUint >= _value, "Underflow prevented!");
        myUint -= _value; // Subtract from myUint
    }

    // Exponentiation (e.g., 2^4)
    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base ** exponent; // Calculate base^exponent
    }

    // Comparisons
    function isGreater(uint256 _a, uint256 _b) public pure returns (bool) {
        return _a > _b; // Check if _a is greater than _b
    }

    function isEqual(uint256 _a, uint256 _b) public pure returns (bool) {
        return _a == _b; // Check if _a is equal to _b
    }

    // Signed Integers Operations
    function incrementSignedInt() public {
        myInt++; // Increment signed integer
    }

    function decrementSignedInt() public {
        myInt--; // Decrement signed integer
    }

    function setMyInt(int256 _value) public {
        myInt = _value; // Set new value for signed integer
    }

    // Edge Case Testing
    function testOverflow() public {
        smallUint = 255; // Set to max value for uint8
        smallUint++; // Reverts in Solidity >= 0.8.0 due to overflow protection
    }

    function testUnderflow() public {
        smallUint = 0; // Set to min value for uint8
        smallUint--; // Reverts in Solidity >= 0.8.0 due to underflow protection
    }
}
