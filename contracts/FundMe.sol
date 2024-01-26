// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18; // 1 * 10 ** 18;

    address[] public funders;
     mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
       i_owner = msg.sender;
    }


    function fund() public payable {
    require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!"); //1e18,
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
}

    function withdraw() public {
        
        /* starting index, ending index, step amount */

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);
        // actual withdraw the funds

        // transfer
        // payable(msg.sender).transfer(address(this).balance);
        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
        revert();
    }

    modifier onlyOwner{
        // require(msg.sender == i_owner, "Sender is not owner");

        if(msg.sender != i_owner) {revert NotOwner(); }
        _;
    }

    // what happen if someone sends this contract ETH without calling the fund function

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
   
}

// 1. Enums
// 2. Events
// 3. Try / catch
// 4. Function Selector
// 5. abi.encode / decode
// 6. Hashing
// 7. Yul / Assembly