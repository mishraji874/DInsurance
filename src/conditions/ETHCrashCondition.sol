// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "../interfaces/IAzuranceCondition.sol";
import "../interfaces/IAzurancePool.sol";

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract ETHCrashCondition is IAzuranceCondition {
    AggregatorV3Interface internal dataFeed;

    constructor() {
        // fixed aggregator in sepolia chain
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function getPrice() public view returns (int256) {
        (
            /* uint80 roundID */
            ,
            int256 answer,
            /*uint startedAt*/
            ,
            /*uint timeStamp*/
            ,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer;
    }

    function isEligible() public view returns (bool) {
        int256 price = getPrice();
        return price < 2500 * (10 ** 8);
    }

    function checkUnlockClaim(address target) external override {
        require(msg.sender == target, "Only target can check itself");
        if (isEligible()) {
            IAzurancePool(target).unlockClaim();
        }
    }

    function checkUnlockTerminate(address target) external override {
        // for demo purpose only. do check the strict condition on production
        IAzurancePool(target).unlockTerminate();
    }
}
