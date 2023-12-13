// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "./Token.sol"; // Import the Token contract

contract Voting {
    Token public tokenContract;
    address public owner;

    enum Candidate {
        Bawumia,
        Mahama
    }

    mapping(address => uint256) public votes;
    mapping(Candidate => uint256) public votingResults;

    event VoteCast(address voter, Candidate candidate);

    constructor(address _tokenAddress) {
        tokenContract = Token(_tokenAddress);
        owner = msg.sender;
    }

    function vote(Candidate _candidate) public {
        require(
            tokenContract.balanceOf(msg.sender) > 0,
            "You have no tokens to vote"
        );
        require(
            _candidate == Candidate.Bawumia || _candidate == Candidate.Mahama,
            "Invalid proposal"
        );

        votes[msg.sender]++;
        votingResults[_candidate]++;
        emit VoteCast(msg.sender, _candidate);
    }

    function displayResults()
        public
        view
        returns (uint256 bawumia, uint256 mahama)
    {
        bawumia = votingResults[Candidate.Bawumia];
        mahama = votingResults[Candidate.Mahama];
    }
}
