// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

import '../Map_US.sol';

contract Test_Map_US {
  Map_US map;

  constructor () { } // do nothing

  function equals(string memory _a, string memory _b) public pure returns (bool){
    return keccak256(bytes(_a)) == keccak256(bytes(_b));
  }

  function set_test() public {
    map = new Map_US();
    map.set(123, "123");
    map.set(456, "456");



    // check if the key exists
    require(map.contains(123), "The key should exist in the map");
    require(map.contains(456), "The key should exist in the map");


    // set a key that already exists
    map.set(123, "666");
    require (map.contains(123), "The key should exist in the map");

    (string memory result, bool bExist) = map.get(123);

    // check if the value is correct
    require(equals(result,"666"),"The value should be 666");
    require(bExist, "The key should exist in the map");
  }

  function get_value_test() public {
    map = new Map_US();
    map.set(123, "123");
    map.set(456, "456");

    // check if all the values are correct
    (string memory value, bool exists) = map.get(123);
    require(exists, "The key should exist in the map");
    require(equals(value, "123"), "The value should be 123");
    (value, exists) = map.get(456);
    require(exists, "The key should exist in the map");
    require(equals(value, "456"), "The value should be 456");
  }

  function contains_test() public {
    map = new Map_US();
    map.set(123, "123");
    map.set(456, "456");

    // check if all the keys exist
    require(map.contains(123), "The key should exist in the map");
    require(map.contains(456), "The key should exist in the map");

    require(map.contains(789) == false, "The key should not exist in the map");
  }

  function remove_test() public {
    map = new Map_US();
    map.set(123, "123");
    map.set(456, "456");

    map.remove(123);
    // check if all the keys exist except the removed one
    require(!map.contains(123), "The key should not exist in the map");
    require(map.contains(456), "The key should exist in the map");
  }

  function keys_test() public {
    map = new Map_US();
    map.set(123, "123");
    map.set(456, "456");

    // check if all the keys exist
    require(map.keys()[0] == 123, "The key should exist in the map");
    require(map.keys()[1] == 456, "The key should exist in the map");

  }
}