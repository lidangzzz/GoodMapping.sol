# GoodMapping.sol

A simple, easy, out-of-the-box mapping with keys in Solidity programming language.

Import it effortlessly into your projects whenever the need arises.

Please note that certain operations may have a high time complexity and results in a high gas cost.

## Installation

If you are using Truffle or Hardhat, you can install it via npm.

```bash
npm install goodmapping
```

## Usage

Import the mapping you need into your Solidity project, and initialize the contract Map_UA (uint256 => address) in your contract.

```solidity
import "goodmapping/contracts/Map_UA.sol";

Contract MyContract {
  Map_UA private map;
}
```

All the map contracts are named as ```Map_[KeyType][ValueType]```, in which `U` represents `uint256`, `A` represents `address`, `S` represents `string`, `B` represents `bytes`. Here is a list of the available types in below table.

(Since solidity does not support generic, we only provide some possible combinations of key-value pairs)

| Contract Name | Key Type | Value Type | Status     |
| ------------- | -------- | ---------- | ---------- |
| Map_UA        | uint256  | address    | ✅ Ready to use|
| Map_UU        | uint256  | uint256    | 🚧 In progress |
| Map_AU        | address  | uint256    | ✅ Ready to use|
| Map_AA        | address  | address    | 🚧 In progress |
| Map_US        | uint256  | string     | 🚧 In progress |
| Map_SU        | string   | uint256    | ✅ Ready to use|
| Map_US        | uint256  | string     | ✅ Ready to use|
| Map_SS        | string   | string     | 🚧 In progress |
| Map_AS        | address  | string     | 🚧 In progress |
| Map_SA        | string   | address    | 🚧 In progress |
| Map_UB        | uint256  | bytes      | 🚧 In progress |
| Map_AB        | address  | bytes      | 🚧 In progress |
| Map_SB        | string   | bytes      | 🚧 In progress |
| Map_BB        | bytes    | bytes      | 🚧 In progress |

Here are some key functions you can use (for example, `Map_UA`)

### Set value with key-value pair

```solidity
map.set(
  0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65,
  100
)
```

### Get value with a key

```solidity
bool bExist = false;
uint256 value = 0;

(bExist, value) = map.get(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65);
```

### Remove a key-value pair

```solidity
bool bIsSuccess = map.remove(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65);
```

### Get all keys
  
```solidity
uint256[] memory keys = map.keys();
```

### Determine if a key exists

```solidity
bool bExist = map.contains(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65);
```

### Get the size of the mapping
```solidity
uint256 size = map.size();
```

## Test

Run the following command to compile and test the contracts via Hardhat.

```bash
npx hardhat test
```