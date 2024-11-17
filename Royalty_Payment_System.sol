// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RoyaltyPayment {
    // Struct to represent a contributor and their percentage share
    struct Contributor {
        address payable account;
        uint256 share; // Share percentage (e.g., 20 means 20%)
    }

    // Array of contributors
    Contributor[] public contributors;

    // Total percentage of all shares
    uint256 public totalSharePercentage;

    // Event to log payments
    event RoyaltyPaid(address indexed payer, uint256 amount);

    constructor(address payable[] memory accounts, uint256[] memory shares) {
        require(accounts.length == shares.length, "Accounts and shares length mismatch");
        uint256 _totalShare = 0;

        // Add contributors and calculate total share percentage
        for (uint256 i = 0; i < accounts.length; i++) {
            require(shares[i] > 0, "Share percentage must be greater than zero");
            contributors.push(Contributor({account: accounts[i], share: shares[i]}));
            _totalShare += shares[i];
        }

        require(_totalShare == 100, "Total share percentage must equal 100");
        totalSharePercentage = _totalShare;
    }

    // Fallback function to accept payments and distribute royalties
    receive() external payable {
        require(msg.value > 0, "Payment must be greater than zero");

        // Distribute payment among contributors
        for (uint256 i = 0; i < contributors.length; i++) {
            uint256 payment = (msg.value * contributors[i].share) / 100;
            contributors[i].account.transfer(payment);
        }

        emit RoyaltyPaid(msg.sender, msg.value);
    }

    // Function to view contributor details
    function getContributors() public view returns (Contributor[] memory) {
        return contributors;
    }
}
