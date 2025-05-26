// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../../src/AzuranceFactory.sol";

contract DepployFactory is Script {
    function run() public {
        // uint256 deployPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast();

        new AzuranceFactory();

        vm.stopBroadcast();
    }
}