import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";


describe("Map_UA test", function () {
  it("Should pass test", async function () {
    const Test_Map_UA = await ethers.getContractFactory("Test_Map_UA");
    const test_item = await Test_Map_UA.deploy();
    test_item.deployed();

    test_item.set_test();
    test_item.get_value_test();
    test_item.contains_test();
    test_item.remove_test();
    test_item.keys_test();
    expect(true);
  });

});