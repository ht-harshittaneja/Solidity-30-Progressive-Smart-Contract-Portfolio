# Solidity 30: Progressive Smart Contract Portfolio

A collection of 30 small Solidity projects that I am building to practise smart contract development, starting with basic state variables and functions and moving towards concepts used in tokens, NFTs, and DeFi applications.

The main idea behind this repository is to learn Solidity by writing contracts rather than only reading about the language. Each numbered file focuses on a particular problem or concept. The projects are independent examples, not one application that needs to be deployed as a whole.

> **Learning project:** These contracts are written for practice and experimentation. They have not been presented as audited or production-ready smart contracts. Some examples intentionally simplify real-world systems, and the security and design limitations should be reviewed before using them with real assets.

## Table of Contents

- [What is in this repository?](#what-is-in-this-repository)
- [Projects](#projects)
- [Concepts covered](#concepts-covered)
- [Technology and tools](#technology-and-tools)
- [How the repository is organised](#how-the-repository-is-organised)
- [Getting started](#getting-started)
- [Compiling and trying a contract](#compiling-and-trying-a-contract)
- [How the contracts work](#how-the-contracts-work)
- [License](#license)

## What is in this repository?

This repository contains 30 numbered Solidity source files. The projects gradually explore:

- Solidity basics such as state variables, functions, visibility, and data types.
- Arrays, mappings, structs, modifiers, events, and inheritance.
- Ether transfers, deposits, withdrawals, and access control.
- Contract-to-contract calls and interface-based design.
- Token balances, NFT ownership, and marketplace flows.
- DeFi-inspired examples such as lending, escrow, liquidity pools, staking, governance, and a collateral-backed token.

The numbering gives the projects a rough learning progression. It does not mean that every contract depends on the previous one. In most cases, each file can be opened and studied separately.

## Projects

| # | Source file | Main contract(s) | What it demonstrates |
|---:|---|---|---|
| 01 | `01_ClickCounter.sol` | `ClickCounter` | State variables and incrementing a counter. |
| 02 | `02_SaveMyName.sol` | `SaveMyName` | Storing and updating strings and a profile status. |
| 03 | `03_PollStation.sol` | `PollStation` | Fixed-size arrays, address mappings, and one-vote-per-address logic. |
| 04 | `04_AuctionHouse.sol` | `AuctionHouse` | Bids, minimum bid increases, deadlines, and winner lookup. |
| 05 | `05_AdminOnly.sol` | `AdminOnly` | Owner-only functions, modifiers, eligibility, and withdrawal tracking. |
| 06 | `06_EtherPiggyBank.sol` | `EtherPiggyBank` | Payable deposits, per-user Ether balances, and withdrawals. |
| 07 | `07_SimpleIOU.sol` | `SimpleIOU` | Nested mappings for debts and payable lending/repayment flows. |
| 08 | `08_TipJar.sol` | `TipJar` | Ether tips, simulated USD/EUR accounting, and owner-set conversion values. |
| 09 | `09_SmartCalculator.sol` | `Calculator`, `SmartCalculator` | Arithmetic functions and calling another deployed contract. |
| 10 | `10_ActivityTracker.sol` | `ActivityTracker` | Event emission and basic per-user activity counters. |
| 11 | `11_MasterKey.sol` | `Ownable`, `VaultMaster` | Inheritance and reusable owner-based access control. |
| 12 | `12_MyFirstToken.sol` | `MyFirstToken` | Basic token balances, transfers, and a transfer event. |
| 13 | `13_PreorderTokens.sol` | `PreorderTokens` | Selling a simple token balance for Ether at a configurable rate. |
| 14 | `14_SafeDepositBox.sol` | `IDepositBox`, `BaseBox`, `BasicBox`, `PremiumBox`, `TimeLockedBox`, `VaultManager` | Interfaces, abstract contracts, inheritance, ownership transfer, and time-based withdrawal restrictions. |
| 15 | `15_GasSaver.sol` | `PollStation` | Proposal creation and voting using structs, arrays, and mappings. |
| 16 | `16_PluginStore.sol` | `Achievements`, `Inventory`, `BattleStats`, `PluginStore` | Struct-based user profiles and combining several profile-related features. |
| 17 | `17_UpgradeHub.sol` | `SubscriptionProxy`, `SubscriptionLogicV1` | A basic proxy/implementation idea and subscription state. |
| 18 | `18_WeatherOracle.sol` | `IWeatherOracle`, `CropInsurance` | An external oracle interface and rainfall-based crop insurance logic. |
| 19 | `19_SignThis.sol` | `SignThis` | Hashing, signature splitting, and signature verification. |
| 20 | `20_FortKnox.sol` | `FortKnox` | Ether deposits/withdrawals, conversion-rate accounting, and a reentrancy guard pattern. |
| 21 | `21_SimpleNFT.sol` | `SimpleNFT` | A minimal NFT-like ownership, approval, transfer, and burn flow. |
| 22 | `22_ DecentralizedLottery.sol` | `DecentralizedLottery` | Ticket purchases, a lottery deadline, and a simplified randomness-provider interface. |
| 23 | `23_LendingPool.sol` | `LendingPool` | Ether deposits, simple interest calculations, collateral, borrowing, and repayment. |
| 24 | `24_DecentralizedEscrow.sol` | `DecentralizedEscrow` | Conditional fund release and arbiter-based dispute resolution. |
| 25 | `25_AutomatedMarketMaker.sol` | `AutomatedMarketMaker` | ETH/token liquidity and swaps using a constant-product-style calculation. |
| 26 | `26_NFTMarketplace.sol` | `NFTMarketplace` | NFT listings, purchases, seller payments, and a creator royalty calculation. |
| 27 | `27_YieldFarming.sol` | `YieldFarming` | Token staking and time-based reward calculations. |
| 28 | `28_DecentralizedGovernance.sol` | `DecentralizedGovernance` | Token-weighted proposal voting and proposal execution state. |
| 29 | `29_Stablecoin.sol` | `StableCoin` | A simplified collateral-backed token with mint, burn, redeem, and collateral checks. |
| 30 | `30_MiniDex.sol` | `MiniDEX` | A two-token liquidity pool with reserve-based swap calculations. |

**Note:** The source file for project 22 contains a space after `22_`. Its path is shown exactly as it exists in the repository.

## Concepts covered

The projects provide hands-on examples of the following Solidity and smart contract concepts:

| Area | Concepts |
|---|---|
| Solidity fundamentals | `pragma`, contracts, constructors, state variables, data types, function visibility, `view`, `pure`, and `payable` |
| Data handling | Arrays, fixed-size arrays, mappings, nested mappings, structs, and strings |
| Control and validation | `require`, conditional statements, modifiers, and access restrictions |
| Contract design | Interfaces, abstract contracts, inheritance, and contract-to-contract calls |
| Blockchain interaction | `msg.sender`, `msg.value`, `address(this).balance`, and `block.timestamp` |
| Ether and tokens | Deposits, withdrawals, transfers, token balances, and allowances as a concept |
| Events and signatures | Indexed event parameters, event logs, hashing, and signature recovery |
| Application patterns | Auctions, voting, vaults, subscriptions, oracles, lotteries, escrow, lending, AMMs, NFTs, staking, and governance |

## Technology and tools

| Category | Used in the repository |
|---|---|
| Programming language | Solidity |
| Compiler version constraint | `^0.8.34` in the source files |
| Development environment | Solidity-compatible IDE or compiler (for example, Remix IDE) |
| External libraries | No external Solidity package imports are present in the source files. |
| Build framework | No Foundry, Hardhat, or Truffle configuration is included. |
| Tests | No automated test files or test framework configuration are included. |

The repository is intentionally lightweight: it currently consists of Solidity source files and this README. It does not include a frontend, deployment scripts, a package manager configuration, or a configured local blockchain environment.

## How the repository is organised

```text
Solidity-30-Progressive-Smart-Contract-Portfolio/
├── 01_ClickCounter.sol
├── 02_SaveMyName.sol
├── 03_PollStation.sol
├── 04_AuctionHouse.sol
├── 05_AdminOnly.sol
├── 06_EtherPiggyBank.sol
├── 07_SimpleIOU.sol
├── 08_TipJar.sol
├── 09_SmartCalculator.sol
├── 10_ActivityTracker.sol
├── 11_MasterKey.sol
├── 12_MyFirstToken.sol
├── 13_PreorderTokens.sol
├── 14_SafeDepositBox.sol
├── 15_GasSaver.sol
├── 16_PluginStore.sol
├── 17_UpgradeHub.sol
├── 18_WeatherOracle.sol
├── 19_SignThis.sol
├── 20_FortKnox.sol
├── 21_SimpleNFT.sol
├── 22_ DecentralizedLottery.sol
├── 23_LendingPool.sol
├── 24_DecentralizedEscrow.sol
├── 25_AutomatedMarketMaker.sol
├── 26_NFTMarketplace.sol
├── 27_YieldFarming.sol
├── 28_DecentralizedGovernance.sol
├── 29_Stablecoin.sol
├── 30_MiniDex.sol
└── README.md
```

Each `.sol` file contains one or more related contracts. Some files also define interfaces or abstract/base contracts that are used by other contracts in the same file.

## Getting started

### Prerequisites

- A Solidity-compatible development environment.
- A compiler version that satisfies `pragma solidity ^0.8.34` (Solidity 0.8.34 or a compatible later 0.8.x release).
- Basic familiarity with Ethereum addresses, transactions, and Ether is helpful for the later examples.

There are no project-level dependencies to install at the moment.

### Get the source code

Clone the repository:

```bash
git clone <repository-url>
cd Solidity-30-Progressive-Smart-Contract-Portfolio
```

Replace `<repository-url>` with the HTTPS or SSH URL of your GitHub repository.

### Option 1: Use Remix IDE

Remix is the simplest way to explore these examples because the repository does not currently include a local build setup.

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create or open a workspace.
3. Upload the `.sol` files you want to study, or copy one source file into a new Solidity file.
4. Open the **Solidity Compiler** tab.
5. Select compiler version `0.8.34` or another version compatible with `^0.8.34`.
6. Compile the selected file.
7. Open **Deploy & Run Transactions** to deploy and interact with the contract.

Some source files define multiple contracts. In those cases, choose the contract you want from Remix's contract selector after compilation. For example, `09_SmartCalculator.sol` defines both `Calculator` and `SmartCalculator`.

### Option 2: Use a local Solidity compiler

If you already have the Solidity compiler (`solc`) installed, compile an individual source file from the repository root:

```bash
solc --version
solc --bin 01_ClickCounter.sol
```

The compiler version must satisfy the pragma in the file. The command above compiles one example; it does not deploy it to a blockchain.

No commands for installing Foundry, Hardhat, or other frameworks are included here because this repository does not currently define a configuration for those tools.

## Compiling and trying a contract

A simple first example is `01_ClickCounter.sol`.

The contract stores a counter and exposes a public `click()` function:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

contract ClickCounter {
    uint256 public count = 0;

    function click() public {
        count += 1;
    }
}
```

After deploying the contract in Remix:

1. Call `count()` to read the current value. It starts at `0`.
2. Call `click()` to send a transaction that increments the counter.
3. Call `count()` again to read the updated value.

The exact transaction details depend on the selected Remix environment. A state-changing function call requires a transaction; a public state-variable getter can be read without sending a state-changing transaction.

For contracts that accept Ether, use Remix's **Value** field and select the appropriate unit before calling a `payable` function. For example, `EtherPiggyBank.deposit()` requires a positive `msg.value`.

## How the contracts work

The projects are separate examples, but a few recurring implementation patterns connect them.

### State and mappings

Contracts such as `ClickCounter`, `SaveMyName`, and `PollStation` store data in state variables. Mapping-based examples associate data with an Ethereum address. For example, `EtherPiggyBank` uses a mapping to keep a separate recorded balance for each depositor.

### Access control

`AdminOnly`, `MasterKey`, and other projects use the caller address (`msg.sender`) to restrict functions. Modifiers such as `onlyOwner` place a reusable condition before the protected function body.

### Ether transfers

`EtherPiggyBank`, `SimpleIOU`, `VaultMaster`, and other contracts demonstrate payable functions and low-level Ether transfers using `.call{value: amount}("")`. The examples check the returned success flag and revert if the transfer fails.

### Interfaces and contract interaction

`SmartCalculator` calls a separately deployed `Calculator` contract. `SafeDepositBox` defines an interface and several implementations, while `VaultManager` interacts with a deposit-box contract through that interface. The oracle, ERC20-like, and ERC721-like interfaces in later examples show how a contract can call another contract without importing its full implementation.

### Token and NFT examples

`MyFirstToken` and `PreorderTokens` maintain token-like balances. `SimpleNFT` tracks token IDs and owners, and `NFTMarketplace` interacts with an external NFT contract through a small interface. These are learning implementations and should not be treated as complete standards-compliant replacements for established token standards.

### DeFi-inspired examples

The later contracts model selected parts of common decentralised-finance applications:

- `LendingPool` calculates simple interest and tracks collateral and loans.
- `AutomatedMarketMaker` uses a constant-product-style reserve calculation for ETH/token swaps.
- `MiniDEX` calculates swaps using the current reserve ratio.
- `YieldFarming` calculates rewards based on stake amount, elapsed time, and a configurable rate.
- `StableCoin` tracks ETH collateral and applies a configurable collateral ratio.
- `DecentralizedGovernance` uses token balances as voting weight.

These contracts are intentionally simplified so the core logic is easier to study. They do not implement all the mechanisms, safeguards, or economic assumptions of production protocols.

## License

Every Solidity source file currently includes the SPDX identifier `MIT`. However, the repository does not contain a separate `LICENSE` file. Add the appropriate MIT license text and confirm the intended copyright and author details before treating the repository as fully licensed for reuse.

## Author

This repository is maintained as a personal Solidity learning portfolio. The source files do not currently provide a separate author contact or public contact address.
