//SPDX-License-Identifier: MIT;

pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber = 255;  // checked

// unchecked key word make our gass mmore efficient
    function add() public {
       unchecked {bigNumber = bigNumber + 1;}
    }
}