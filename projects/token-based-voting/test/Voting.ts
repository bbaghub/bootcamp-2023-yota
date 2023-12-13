import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";
import { ContractTransactionResponse } from "ethers";

// Initialize variables
let Token, Voting, token: any, voting: any;
let owner, user1: any, user2: any;
const proposalA = 0;
const proposalB = 1;

// Test setup
before(async () => {
  // Get Ethereum account signers
  [owner, user1, user2] = await ethers.getSigners();

  // Deploy Token contract
  Token = await ethers.getContractFactory("Token");
  token = await Token.deploy();

  // Deploy Voting contract with Token contract address
  Voting = await ethers.getContractFactory("Voting"); // Use the correct contract name
  voting = await Voting.deploy(token.target);

  // Mint tokens to user1 and user2 for testing
  await token.connect(owner).mint(user1.address, ethers.parseEther("100"));
  await token.connect(owner).mint(user2.address, ethers.parseEther("50"));
});

describe("Token-Based Voting", function () {
  before(async () => {
    [owner, user1, user2] = await ethers.getSigners();
    Token = await ethers.getContractFactory("Token"); // Use the correct contract name
    token = await Token.deploy();

    Voting = await ethers.getContractFactory("Voting"); // Use the correct contract name
    await Voting.deploy(token.target);
  
    // Mint tokens to user1 and user2 for testing
    await token.connect(owner).mint(user1.address, ethers.parseEther("100"));
    await token.connect(owner).mint(user2.address, ethers.parseEther("50"));
  });

  it("Should allow users to cast votes", async function () {
    await voting.connect(user1).vote(proposalA);
    await voting.connect(user2).vote(proposalB);

    // Check if the votes are recorded correctly
    const user1Vote = await voting.votes(user1.address);
    const user2Vote = await voting.votes(user2.address);

    expect(user1Vote).to.eq(1);
    expect(user2Vote).to.eq(1);
  });

  it("Should tally votes correctly", async function () {
    const [votesProposalA, votesProposalB] = await voting.displayResults();

    expect(votesProposalA).to.eq(1); // User1's vote
    expect(votesProposalB).to.eq(1); // User2's vote
  });
});
