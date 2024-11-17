
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransferWithFee {
    address public feeRecipient;  // Address to receive the 5% fee
    uint256 public feePercent = 5; // The fee percentage

    constructor(address _feeRecipient) {
        feeRecipient = _feeRecipient;
    }

    // Function to send transaction and deduct 5% fee
    function transferWithFee(address payable recipient) public payable {
        require(msg.value > 0, "Transaction value must be greater than zero");

        // Calculate the fee (5% of the value)
        uint256 fee = (msg.value * feePercent) / 100;

        // Calculate the remaining amount after the fee
        uint256 remainingAmount = msg.value - fee;

        // Send the fee to the fee recipient address
        payable(feeRecipient).transfer(fee);

        // Send the remaining amount to the recipient address
        recipient.transfer(remainingAmount);
    }

    // Fallback function to accept Ether
    receive() external payable {}
}
