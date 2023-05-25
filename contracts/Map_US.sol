// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

/**
 * @title Mapping Uint256 to String
 * @author lidangzzz
 * @notice Null.
 */

contract Map_US{
  mapping (uint256=>string) map;
  uint256[] keyArray;

  constructor () {
  }

  /**
   * Compare two strings and return true if they are equal
   * @param _a string a
   * @param _b string b
   */
  function equals(string memory _a, string memory _b) public pure returns (bool){
    return keccak256(bytes(_a)) == keccak256(bytes(_b));
  }

  function initialize() public {

  }

  /**
   * Set a key value pair to the map
   * @param _key The key
   * @param _value The value
   */
  function set(uint256 _key, string memory _value) public {
    map[_key] = _value;
    if (!contains(_key)) {
      keyArray.push(_key);
    }
  }

  /**
   * Get the value of a key
   * @param _key The key
   * @return The value of the key, and a bool indicating if the key exists
   */
  function get(uint256 _key) public view returns (string memory, bool) {
    if (!contains(_key)) {
      return ("", false);
    }
    return (map[_key], true);
  }

  /**
   * Check if the key exists in the map
   * @param _key The key to check
   */
  function contains(uint256 _key) public view returns (bool) {
    // if the value is not empty string, then the key exists
    if (!equals(map[_key], "")) {return true;}

    // else, let's check if the key exists in the keyArray array
    for (uint256 i = 0; i < keyArray.length; i++) {
      if (keyArray[i] == _key) {return true;}
    }

    // if we reach here, then the key doesn't exist
    return false;
  }

  /**
   * This function removes a key from the map. 
   * It returns true if the key was removed, and false if the key doesn't exist
   * @param _key The key to remove. 
   * @return true if the key was removed, false if the key doesn't exist
   * 
   */
  function remove(uint256 _key) public returns (bool) {
    if (!contains(_key)) {return false;}
    // create a new keyArray array, remove key from it, and set it as the new keyArray array
    uint256[] memory newkeyArray = new uint256[](keyArray.length - 1);
    uint256 j = 0;
    for (uint256 i = 0; i < keyArray.length; i++) {
      if (keyArray[i] != _key) {
        newkeyArray[j] = keyArray[i];
        j++;
      }
    }
    // set the new keyArray array
    keyArray = newkeyArray;

    // remove the key from the map
    delete map[_key];
    return true;
  }

  /**
   * Return the size of the map
   */
  function size() public view returns (uint256) {
    return keyArray.length;
  }

  function keys() public view returns (uint256[] memory) {
    return keyArray;
  }
}