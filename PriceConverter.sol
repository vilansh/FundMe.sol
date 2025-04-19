// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24; //Version of solidity

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; 

library PriceConverter{

    function getPrice() internal view returns (uint256){
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
             
      //    ( uint80 roundID,
      //     int256 answer,       // <== this is the ETH/USD price
      //     uint256 startedAt,
      //     uint256 updatedAt,
      //     uint80 answeredInRound   )       So we write (,int256 price,,,) commas to skip the unnecessary

        // Price of ETH in terms of USD
        // 2000.0000
        return uint256(price * 1e10);  
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() internal view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
