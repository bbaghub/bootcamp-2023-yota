// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Voting {
    
    address public owner;

    enum Candidate { Gideon, Michael }

    mapping(address => uint256) public votes;
    mapping(Candidate => uint256) public votingResults;
    mapping(address => bool) public hasVoted;

    bool public isElectionStarted;
    bool public isElectionClosed;

    // event VoteCast(address voter, Candidate candidate);
    // event EventStarted();
    // event EventClosed();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier onlyBeforeElectionStart() {
        require(!isElectionStarted, "Election has already started");
        _;
    }

    modifier onlyDuringElection() {
        require(isElectionStarted && !isElectionClosed, "Election is not active");
        _;
    }

    function vote(Candidate _candidate) public {
        require(!hasVoted[msg.sender], "You are only allowed to vote once");
        require(_candidate == Candidate.Gideon || _candidate == Candidate.Michael, "Invalid proposal");

        hasVoted[msg.sender] = true;
        votes[msg.sender]++;
        votingResults[_candidate]++;
        // emit VoteCast(msg.sender, _candidate);
    }

    function startElection() external onlyAdmin onlyBeforeElectionStart {
        isElectionStarted = true;
        // emit isElectionStarted;
    }

    function closeElection() external onlyAdmin onlyDuringElection {
        isElectionClosed = true;
        // emit isElectionClosed;
    }

    function displayResults() public view returns (uint256 gideon, uint256 michael) {
        require(hasVoted[msg.sender], "You can only vote to view");
        gideon = votingResults[Candidate.Gideon];
        michael = votingResults[Candidate.Michael];
    }

}