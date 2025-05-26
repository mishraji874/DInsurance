// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../../src/conditions/ETHDiffCondition.sol";

contract DeployETHDiffCondition is Script {
    function run() public {
        // uint256 deployPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast();

        new ETHDiffCondition(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        vm.stopBroadcast();
    }
}