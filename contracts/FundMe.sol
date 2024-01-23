// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 50 * 1e18; // 1 * 10 ** 18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

     function fund() public payable {
// Want to be able to start a minimum fund amount in USD
        // 1. How do we send ETH to this contract
    require(msg.value > 1e18, "Didn't send enough!");
    // funders.push(msg.sender);
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
}


    function getPrice() public view returns (uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price,,,) = priceFeed.latestRoundData();
    return uint256(price * 1e10); 
}

    function getVersion() public view returns(uint256) {
       AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

  
function getConversionRate(uint256 ethAmount) public view returns (uint256){
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
    return ethAmountInUsd;
}
}
