// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Wallet {
    address public owner;
    uint256 public _balance;

    // Modifier to restrict access to the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
    //Events
    event ContractCreated(address indexed owner, uint256 timestamp);
    event DepositMade(address indexed sender, uint256 amount, uint256 timestamp);
    event WithdrawMade(address indexed owner, uint256 amount, uint256 timestamp);

    constructor (address _owner) {
        require(_owner != address(0), "Owner cannot be the zero address");
        owner = _owner;
        emit ContractCreated(owner, block.timestamp);
    }

    // Funtion to deposit funds into the contract
    // Anyone can deposit funds into the contract
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than 0");

        _balance += msg.value;

        emit DepositMade(msg.sender, msg.value, block.timestamp);
    }

    // Function to withdraw funds from the contract
    // Only the owner can withdraw funds
    function withdraw(uint256 amount) external onlyOwner {
        require(amount > 0, "Withdraw must be greater than 0");
        require(address(this).balance >= amount, "Insufficient balance");

        _balance -= amount;
        payable(owner).transfer(amount);

        emit WithdrawMade(owner, amount, block.timestamp);
    }
}