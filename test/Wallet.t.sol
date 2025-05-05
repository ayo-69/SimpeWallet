// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Wallet.sol";


contract WalletTest is Test {
    Wallet public wallet;
    address public owner = address(0x123);
    address public user = address(0x456);


    function setUp() public {
        wallet = new Wallet(owner);
    }

    function testOwner() public view {
        assertEq(wallet.owner(), owner, "Owner should be set correctly");
    }

    function testDeposit() public {
        uint256 initialBalance = wallet._balance();
        wallet.deposit{value: 1 ether}();
        assertEq(address(wallet).balance, initialBalance + 1 ether, "Deposit should increase balance");
    }

    function testWithdraw() public {
        // Give the testing ether
        vm.deal(owner, 10 ether);
        vm.startPrank(owner);
        // Deposit amount to wallet
        wallet.deposit{ value: 10 ether }();

        // Makes sure the money was received
        assertEq(wallet._balance(), 10 ether, "Invalid wallet balance during deposit");
        assertEq(user.balance, 0);

        // Make withdraw
        wallet.withdraw(10);
        vm.stopPrank();
        assertEq(owner.balance, 10, "Invalid owner balance after withdraw");
    }
}