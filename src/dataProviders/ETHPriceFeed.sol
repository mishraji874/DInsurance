// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract ETHPriceFeed {
    AggregatorV3Interface internal dataFeed;

    int256 public startPrice;
    int256 pricediff;
    bool public isBelow100USD;

    constructor() {
        // fixed aggregator in sepolia chain
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );

        (
            ,
            /* uint80 roundID */
            int answer,
            /*uint startedAt*/
            /*uint timeStamp*/
            /*uint80 answeredInRound*/
            ,
            ,
        ) = dataFeed.latestRoundData();
        startPrice = answer;
    }

    /**
     * Returns the latest answer
     */
    function getPrice() public view returns (int256) {
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer;
    }

    function calPrice() public returns (int256) {
        (
            /*uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        pricediff = ((startPrice - answer) / startPrice) * 100;
        if(answer < 100 * (10**6)) {
            isBelow100USD = true;
        }
        return answer;
    }
}