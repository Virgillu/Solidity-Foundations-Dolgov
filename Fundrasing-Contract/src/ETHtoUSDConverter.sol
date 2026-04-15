// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {AggregatorV3Interface} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
 
library ETHtoUSDConverter {
 
    function priceOfOneETHInUSD() public view returns(uint256) {
        AggregatorV3Interface priceFeed = 
AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,, ) = priceFeed.latestRoundData();
        return uint256(answer * 1e10); 
    }
 
    function convertETHToUSD (uint256 amountOfETH) public view returns(uint256) {
        uint256 priceOfETH = priceOfOneETHInUSD();
        uint256 ethPriceInUSD = (priceOfETH * amountOfETH) / 1e18;
        return ethPriceInUSD;
    }
}
