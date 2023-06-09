// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

import '../Map_AU.sol';

contract Test_Map_AU {
  Map_AU map;

  constructor () { } // do nothing

  function set_test() public {
    map = new Map_AU();
    map.set(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 123);
    map.set(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 456);
    map.set(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), 789);
    map.set(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), 101112);
    map.set(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65), 131415);


    // check if the key exists
    require(map.contains(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266)), "The key should exist in the map");
    require(map.contains(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8)), "The key should exist in the map");
    require(map.contains(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC)), "The key should exist in the map");
    require(map.contains(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906)), "The key should exist in the map");
    require(map.contains(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65)), "The key should exist in the map");

    // set a key that already exists
    map.set(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 666);
    require (map.contains(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266)), "The key should exist in the map");

    (uint256 result, bool bExist) = map.get(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));

    // check if the value is correct
    require(result == 666, "The value should be 666");
    require(bExist, "The key should exist in the map");
  }

  function get_value_test() public {
    map = new Map_AU();
    map.set(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 123);
    map.set(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 456);
    map.set(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), 789);
    map.set(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), 101112);
    map.set(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65), 131415);

    // check if all the values are correct
    (uint256 value, bool exists) = map.get(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    require(exists, "The key should exist in the map");
    require(value == 123, "The value should be 123");
    (value, exists) = map.get(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));
    require(exists, "The key should exist in the map");
    require(value == 456, "The value should be 456");
    (value, exists) = map.get(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC));
    require(exists, "The key should exist in the map");
    require(value == 789, "The value should be 789");
    (value, exists) = map.get(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906));
    require(exists, "The key should exist in the map");
    require(value == 101112, "The value should be 101112");
    (value, exists) = map.get(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65));
    require(exists, "The key should exist in the map");
    require(value == 131415, "The value should be 131415");
  }

  function contains_test() public {
    map = new Map_AU();
    map.set(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 123);
    map.set(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 456);
    map.set(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), 789);
    map.set(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), 101112);
    map.set(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65), 131415);

    // check if all the keys exist
    require(map.contains(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266)), "The key should exist in the map");
    require(map.contains(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8)), "The key should exist in the map");
    require(map.contains(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC)), "The key should exist in the map");
    require(map.contains(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906)), "The key should exist in the map");
    require(map.contains(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65)), "The key should exist in the map");

    require(!map.contains(address(0xd03ea8624C8C5987235048901fB614fDcA89b117)), "The key should not exist in the map");
  }

  function remove_test() public {
    map = new Map_AU();
    map.set(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 123);
    map.set(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 456);
    map.set(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), 789);
    map.set(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), 101112);
    map.set(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65), 131415);

    bool result = map.remove(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    require(result, "The remove should be successful");
    // check if all the keys exist except the removed one
    require(!map.contains(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266)), "The key should not exist in the map");
    require(map.contains(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8)), "The key should exist in the map");
    require(map.contains(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC)), "The key should exist in the map");
    require(map.contains(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906)), "The key should exist in the map");
    require(map.contains(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65)), "The key should exist in the map");

    result = map.remove(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
    require(!result, "The remove should not be successful");
  }

  function keys_test() public {
    map = new Map_AU();
    map.set(address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 123);
    map.set(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), 456);
    map.set(address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), 789);
    map.set(address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), 101112);
    map.set(address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65), 131415);

    // check if all the keys exist
    require(map.keys()[0] == address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), "The key should exist in the map");
    require(map.keys()[1] == address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8), "The key should exist in the map");
    require(map.keys()[2] == address(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC), "The key should exist in the map");
    require(map.keys()[3] == address(0x90F79bf6EB2c4f870365E785982E1f101E93b906), "The key should exist in the map");
    require(map.keys()[4] == address(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65), "The key should exist in the map");

  }
}