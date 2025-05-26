// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../../test/contracts/DAI.sol";
import "../../test/contracts/WETH.sol";
import "../../test/contracts/USDT.sol";

contract DeployTokens is Script {
    function run() public {
        // uint256 deployerPrivateKey = vm.envUint("b038e03f4d51672f1011ad8fc8562b091b6fbc30eee5b1aac9a269d0062c7df4");
        vm.startBroadcast();

        // DAI dai = new DAI();
        // WETH weth = new WETH();
        USDT usdt = new USDT();

        vm.stopBroadcast();
    }
}
