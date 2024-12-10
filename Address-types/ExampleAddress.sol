// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleAddress {
    // Declare a public address variable
    address public someAddress;

    // Function to set the address
    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    // Function to get the balance of the stored address
    function getAddressBalance() public view returns (uint256) {
        return someAddress.balance;
    }
}
