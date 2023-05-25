// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

import '../Map_UA.sol';

contract Test_Map_UA {
  Map_UA map;

  constructor () { } // do nothing

  function set_test() public {
    map = new Map_UA();
    map.set(123, address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    map.set(456, address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));
    map.set(789, address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC));
    map.set(101112, address(0x90F79bf6EB2c4f870365E785982E1f101E93b906));
    map.set(131415, address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65));


    // check if the key exists
    require(map.contains(123), "The key should exist in the map");
    require(map.contains(456), "The key should exist in the map");
    require(map.contains(789), "The key should exist in the map");
    require(map.contains(101112), "The key should exist in the map");
    require(map.contains(131415), "The key should exist in the map");

    // set a key that already exists
    map.set(123, address(0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199));
    require (map.contains(123), "The key should exist in the map");

    (address result, bool bExist) = map.get(123);

    // check if the value is correct
    require(result == 0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199, "The value should be 666");
    require(bExist, "The key should exist in the map");
  }

  function get_value_test() public {
    map = new Map_UA();
    map.set(123, address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    map.set(456, address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));
    map.set(789, address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC));
    map.set(101112, address(0x90F79bf6EB2c4f870365E785982E1f101E93b906));
    map.set(131415, address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65));

    // check if all the values are correct
    (address value, bool exists) = map.get(123);
    require(exists, "The key should exist in the map");
    require(value == 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, "The value should be 123");
    (value, exists) = map.get(456);
    require(exists, "The key should exist in the map");
    require(value == 0x70997970C51812dc3A010C7d01b50e0d17dc79C8, "The value should be 456");
    (value, exists) = map.get(789);
    require(exists, "The key should exist in the map");
    require(value == address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), "The value should be 789");
    (value, exists) = map.get(101112);
    require(exists, "The key should exist in the map");
    require(value == address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), "The value should be 101112");
    (value, exists) = map.get(131415);
    require(exists, "The key should exist in the map");
    require(value == 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65, "The value should be 131415");
  }

  function contains_test() public {
    map = new Map_UA();
    map.set(123, address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    map.set(456, address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));
    map.set(789, address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC));
    map.set(101112, address(0x90F79bf6EB2c4f870365E785982E1f101E93b906));
    map.set(131415, address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65));

    // check if all the keys exist
    require(map.contains(123), "The key should exist in the map");
    require(map.contains(456), "The key should exist in the map");
    require(map.contains(789), "The key should exist in the map");
    require(map.contains(101112), "The key should exist in the map");
    require(map.contains(131415), "The key should exist in the map");
    require(!map.contains(666), "The key should not exist in the map");
  }

  function remove_test() public {
    map = new Map_UA();
    map.set(123, address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    map.set(456, address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));

    map.remove(123);
    // check if all the keys exist except the removed one
    require(!map.contains(123), "The key should not exist in the map");
    require(map.contains(456), "The key should exist in the map");
  }

  function keys_test() public {
    map = new Map_UA();
    map.set(123, address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    map.set(456, address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));

    // check if all the keys exist
    require(map.keys()[0] == 123, "The key should exist in the map");
    require(map.keys()[1] == 456, "The key should exist in the map");

  }
}