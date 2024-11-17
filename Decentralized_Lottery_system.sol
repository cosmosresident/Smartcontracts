// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedLottery {
    address public manager;
    address[] public players;
    address public recentWinner;

    event LotteryEntered(address indexed player);
    event WinnerSelected(address indexed winner, uint256 prizeAmount);

    constructor() {
        manager = msg.sender; // The manager of the lottery
    }

    // Function to enter the lottery
    function enter() public payable {
        require(msg.value == 0.1 ether, "Entry fee is 0.1 Ether");
        players.push(msg.sender);
        emit LotteryEntered(msg.sender);
    }

    // Helper function to get the balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Helper function to get the list of players
    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    // Function to select a winner (only callable by the manager)
    function pickWinner() public onlyManager {
        require(players.length > 0, "No players in the lottery");

        // Generate a random index (simple pseudo-randomness for demo purposes)
        uint256 randomIndex = random() % players.length;
        address winner = players[randomIndex];

        // Transfer the entire balance to the winner
        uint256 prizeAmount = address(this).balance;
        payable(winner).transfer(prizeAmount);

        // Record the winner and reset the lottery
        recentWinner = winner;
        players = new address       emit WinnerSelected(winner, prizeAmount);
    }

    // Internal function to generate a pseudo-random number
    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    // Modifier to restrict access to the manager
    modifier onlyManager() {
        require(msg.sender == manager, "Only the manager can call this function");
        _;
    }
}
