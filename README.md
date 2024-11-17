# Solidity Smart Contracts

A collection of Solidity smart contracts designed to interact with blockchain systems. This repository serves as a personal archive and resource for blockchain enthusiasts and developers.

⚠️ Disclaimer
Please thoroughly review and test any smart contract in this repository before deploying it on any network. These contracts are provided as-is, and I cannot be held responsible for any potential asset loss or unintended consequences.

## Transaction with Fee / [TransferFee.sol](https://github.com/cosmosresident/Smartcontracts/blob/main/TransferFee.sol)
When a user sends funds to another recipient via this contract, the contract will automatically deduct 5% and send it to the designated fee recipient.

### Explanation:
- feeRecipient: This address will receive the 5% fee.
- feePercent: The fee percentage, set to 5%.
- transferWithFee(): This function is used to handle transactions. It calculates the fee (5%), transfers the fee to the feeRecipient, and then sends the remaining amount to the recipient.
- receive(): The fallback function ensures the contract can accept Ether.
