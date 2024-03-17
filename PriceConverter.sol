// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    function getPrice() internal view returns(uint256){
        // ABI , Address 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);



    }


    function getConvertionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethprice = getPrice();
        uint256 ethamountinusd = (ethprice * ethAmount) / 1e18;
        return ethamountinusd;
    }
}