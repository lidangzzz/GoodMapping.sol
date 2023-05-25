import { ethers } from "hardhat";

async function main() {
// not sure if this is needed
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
