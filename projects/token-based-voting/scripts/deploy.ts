import { ethers } from "hardhat";

async function main() {
  const Token = await ethers.getContractFactory("Token");
  const Voting = await ethers.getContractFactory("Voting");

  // Deploy Token contract
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);

  // Deploy Voting contract
  const voting = await Voting.deploy(token.address);
  await voting.deployed();
  console.log("Voting deployed to:", voting.address);
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
