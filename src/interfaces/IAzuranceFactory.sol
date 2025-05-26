// SPDX--License-Identifier: MIT
pragma solidity >=0.5.0;

interface IAzuranceFactory {
    function createAzuranceContract(
        uint256 multiplier_,
        uint256 multiplierBlocks_,
        uint256 staleBlocks_,
        address asset_,
        uint256 fee_,
        address feeTo_,
        address condition_,
        string memory name_,
        string memory symbol_
    ) external returns (address);
}
