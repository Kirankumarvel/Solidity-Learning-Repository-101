// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    contract ExampleWrapAround{
        uint256 public myUnit; //0-(2*256)-1

        uint8 public myUnit8 = 2**4;

        function setUint(uint _myUint) public {
            myUnit = _myUint;
        }

        function decrementUint() public {
            unchecked {
                myUnit--;
            }
        }
        function incrementUnit8() public {
            myUnit8++;
        }

    }
