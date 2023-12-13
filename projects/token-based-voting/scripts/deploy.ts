import { ethers } from "hardhat";

async function main() {
  const token = await ethers.deployContract("Token");
  await token.waitForDeployment();
  console.log(`Token deployment successful at address: ${await token.getAddress()}`);

  const voting = await ethers.deployContract("Voting", [token.getAddress()]);
  await voting.waitForDeployment();
  console.log(`Voting deployment successful at address: ${await voting.getAddress()}`);
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
