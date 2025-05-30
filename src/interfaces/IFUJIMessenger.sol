// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IFUJIMessenger {
    function isLendingDemo() external view returns (bool);

    function owner() external view returns (address);

    function sendMessagePayLINK(uint64 _destinationChainSelector, address _receiver, string memory _text)
        external
        returns (bytes32 messageId);

    function withdraw(address _beneficiary) external;

    function withdrawToken(address _beneficiary, address _token) external;

    event MessageReceived(bytes32 indexed messageId, uint64 indexed sourceChainSelector, address sender, string text);

    event MessageSent(
        bytes32 indexed messageId,
        uint64 indexed destinationChainSelector,
        address receiver,
        string text,
        address feeToken,
        uint256 fees
    );

    event OwnershipTransferRequested(address indexed from, address indexed to);
    event OwnershipTransferred(address indexed from, address indexed to);

    error DestinationChainNotAllowlisted(uint64 destinationChainSelector);
    error FailedToWithdrawEth(address owner, address target, uint256 value);
    error InvalidRouter(address router);
    error NotEnoughBalance(uint256 currentBalance, uint256 calculatedFees);
    error NothingToWithdraw();
    error SenderNotAllowlisted(address sender);
    error SourceChainNotAllowlisted(uint64 sourceChainSelector);
}
