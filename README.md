# Simple Wallet

This project implements a simple wallet smart contract in Solidity. It includes functionality for depositing and withdrawing Ether, as well as managing ownership. The project is accompanied by unit tests to ensure correctness.

## Features

- **Deposit Ether**: Users can deposit Ether into the wallet.
- **Withdraw Ether**: Only the owner can withdraw Ether from the wallet.
- **Ownership Management**: The wallet is owned by a specific address, which is set during deployment.

## Project Structure

- **`src/Wallet.sol`**: The main smart contract implementing the wallet functionality.
- **`test/Wallet.t.sol`**: Unit tests for the wallet contract using Foundry's Forge framework.

## Prerequisites

- [Foundry](https://book.getfoundry.sh/) installed for testing and development.
- Node.js and npm for managing dependencies if needed.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/simpleWallet.git
   cd simpleWallet
````

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
