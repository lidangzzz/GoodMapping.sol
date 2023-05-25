# GoodMapping.sol

Nothing fancy. Just a simple, easy, out-of-the-box mapping with keys in Solidity programming language.

Import it effortlessly into your projects whenever the need arises.

Please note that certain operations may have a high time complexity, so use it wisely.

Good luck.

## Installation

```bash
npm install goodmapping
```

## Usage

Import the mapping you need into your Solidity project.

```solidity
import "goodmapping/contracts/Map_UA.sol";
```

Initialize the contract Map_UA (uint256 => address) in your contract.

```solidity
Map_UA map; 
```

Here are some key functions you can use.

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