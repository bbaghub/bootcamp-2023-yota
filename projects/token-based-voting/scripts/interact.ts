import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  const Voting = await ethers.getContractFactory("Voting");
  const voting = Voting.attach("VOTING_CONTRACT_ADDRESS");

  // Replace "VOTING_CONTRACT_ADDRESS" with the actual contract address

  const proposal = 0; // Proposal index (0 or 1)
  const tx = await voting.vote(proposal);
  await tx.wait();
  console.log(`Vote cast for Proposal ${proposal} by ${deployer.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
