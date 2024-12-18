# Solidity Smart Contracts

A collection of Solidity smart contracts designed to interact with blockchain systems. This repository serves as a personal archive and resource for blockchain enthusiasts and developers.

⚠️ Disclaimer
Please thoroughly review and test any smart contract in this repository before deploying it on any network. These contracts are provided as-is, and I cannot be held responsible for any potential asset loss or unintended consequences.

## Transaction Fee / [Transfer_Fee.sol](https://github.com/cosmosresident/Smartcontracts/blob/main/Transfer_Fee.sol)
When a user sends funds to another recipient via this contract, the contract will automatically deduct 5% and send it to the designated fee recipient.

#### Features:
- feeRecipient: This address will receive the 5% fee.
- feePercent: The fee percentage, is set to 5%.
- transferWithFee(): This function is used to handle transactions. It calculates the fee (5%), transfers the fee to the feeRecipient, and then sends the remaining amount to the recipient.
- receive(): The fallback function ensures the contract can accept Ether.

## Royalty Payment System / [Royalty_Payment_System.sol](https://github.com/cosmosresident/Smartcontracts/blob/main/Royalty_Payment_System.sol)
A system for distributing royalties to multiple contributors automatically.

#### Features:
- Royalties are split proportionally among contributors.
- Payments are triggered upon each sale or transaction involving the asset.
- Works for digital content like NFTs or music.
