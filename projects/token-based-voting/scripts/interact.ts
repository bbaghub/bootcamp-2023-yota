import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  const Token = await ethers.getContractFactory("Token");
  const token = Token.attach("0xCC4851631a2CA87d79A325Cb4BF32B1333Dc27B5"); // put token contract address here

  const Voting = await ethers.getContractFactory("Voting");
  const voting = Voting.attach("0x4e3eE7bef0de9b8F2F0B057d1464535DE84317aA"); // put voting contract address here

  const mintTx = await token.connect(deployer).mint(deployer.address, ethers.parseEther("100"));
  await mintTx.wait();

  const proposal = 0; // Proposal index (0 or 1)
  const voteTx = await voting.connect(deployer).vote(proposal);
  await voteTx.wait();
  console.log(`Vote cast for Proposal ${proposal} by ${deployer.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
