// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringAndBytesExample {
    // String storage variable
    string public myString = "Hello World";

    // Bytes storage variable
    bytes public myBytes = "Hello";

    // Function to update the string
    function setMyString(string memory newString) public {
        myString = newString;
    }

    // Function to update the bytes
    function setMyBytes(bytes memory newBytes) public {
        myBytes = newBytes;
    }

    // Function to compare two strings
    function compareStrings(string memory str) public view returns (bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(str));
    }

    // Function to get the length of the bytes array
    function getBytesLength() public view returns (uint) {
        return myBytes.length;
    }

    // Function to convert a string to bytes
    function stringToBytes(string memory str) public pure returns (bytes memory) {
        return bytes(str);
    }

    // Function to convert bytes to string
    function bytesToString(bytes memory b) public pure returns (string memory) {
        return string(b);
    }
}
