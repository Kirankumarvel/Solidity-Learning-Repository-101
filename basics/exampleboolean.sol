// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

/// @title ExampleBoolean Contract
/// @notice A simple contract to demonstrate boolean state management.

contract ExampleBoolean {
    /// @notice Public boolean state variable.
    bool public myBool;

    /// @notice Sets myBool to the negation of the input value.
    /// @param _myBool The input boolean value.
    function setMyBool(bool _myBool) public {
        myBool = !_myBool; // Update myBool to the opposite of _myBool
    }
}
