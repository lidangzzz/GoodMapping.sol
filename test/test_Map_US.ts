import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";


describe("Map_US test", function () {
  it("Should pass test", async function () {
    const Contract = await ethers.getContractFactory("Test_Map_US");
    const test_item = await Contract.deploy();
    test_item.deployed();

    test_item.set_test();
    test_item.get_value_test();
    test_item.contains_test();
    test_item.remove_test();
    test_item.keys_test();
    expect(true);
  });

});