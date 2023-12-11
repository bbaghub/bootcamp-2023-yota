// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public owner;

    constructor() ERC20("VotingToken", "VOTE") {
        owner = msg.sender;
    }

    function mint(address recipient, uint256 amount) external {
        require(msg.sender == owner, "Only the owner can mint tokens");
        _mint(recipient, amount);
    }
}

contract Voting {
    Token public tokenContract;
    address public owner;
    uint256 public winner;

    enum Proposal { ProposalA, ProposalB }
    Proposal[] public proposals;

    mapping(address => uint256) public votes;

    event VoteCast(address indexed voter, Proposal proposal);

    constructor(address _tokenAddress) {
        tokenContract = Token(_tokenAddress);
        owner = msg.sender;
        proposals.push(Proposal.ProposalA);
        proposals.push(Proposal.ProposalB);
    }

    function vote(Proposal _proposal) external {
        require(tokenContract.balanceOf(msg.sender) > 0, "You have no tokens to vote");
        require(_proposal == Proposal.ProposalA || _proposal == Proposal.ProposalB, "Invalid proposal");

        votes[msg.sender] = uint256(_proposal);
        emit VoteCast(msg.sender, _proposal);
    }

    function tallyVotes() external view returns (uint256 votesProposalA, uint256 votesProposalB) {
        for (uint256 i = 0; i < proposals.length; i++) {
            Proposal proposal = proposals[i];
            if (proposal == Proposal.ProposalA) {
                votesProposalA += votes[msg.sender];
            } else if (proposal == Proposal.ProposalB) {
                votesProposalB += votes[msg.sender];
            }
        }
    }
}
