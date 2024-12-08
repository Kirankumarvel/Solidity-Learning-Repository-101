// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleString {
    string public myString = "Hello World"; // A public string variable initialized with "Hello World"
    bytes public myBytes = "Hellow World";   // A public bytes variable initialized with "Hellow World"

    /// @notice Sets the value of myString to a new string.
    /// @param _myString The new string value to set.
    function setMyString(string memory _myString) public {
        myString = _myString; // Updates myString with the provided input
    }

    /// @notice Compares the current myString with another string.
    /// @param _myString The string to compare against myString.
    /// @return bool Returns true if the strings are equal, false otherwise.
    function compareTwoStrings(string memory _myString) public view returns(bool) {
        // Compares the keccak256 hash of both strings for equality
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }
}
