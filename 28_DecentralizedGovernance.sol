// Build a system for voting on proposals. 
// You'll learn how to create a digital organization where members can vote, demonstrating decentralized governance. 
// It's like a digital democracy, showing how to create DAOs.

// # Concepts you will master
// 1. DAO structure
// 2. voting
// 3. token-based governance


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;

interface IERC20{
    function balanceOf(address account) external view returns(uint256);
}

contract DecentralizedGovernance{
    IERC20 public governanceToken;

    uint256 public nextProposalId;
    uint256 public votingPeriod = 7 days;

    constructor(address _governanceToken)
    {
        governanceToken = IERC20(_governanceToken);
    }

    struct Proposal{
        string title;
        string description;
        address creator;
        uint256 yesVotes;
        uint256 noVotes;
        uint256 deadline;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;

    mapping(uint256 => mapping(address => bool)) public voted;

    function createProposal(string calldata _title, string calldata _description) external{
        require(governanceToken.balanceOf(msg.sender) > 0,"NO GOVERNANCE TOKENS");

        proposals[nextProposalId]=Proposal(
            _title,
            _description,
            msg.sender,
            0,
            0,
            block.timestamp + votingPeriod,
            false
        );

        nextProposalId++;
    }

    function vote(uint256 proposalId, bool _vote) external{
        require(proposalId<nextProposalId , "INVALID PROPOSAL ID"); 
        Proposal storage proposal = proposals[proposalId];

        require(block.timestamp < proposal.deadline,"VOTING ENDED");
        require(!voted[proposalId][msg.sender],"ALREADY VOTED");

        uint256 votingPower = governanceToken.balanceOf(msg.sender);

        require(votingPower > 0,"NO VOTING POWER");

        voted[proposalId][msg.sender] = true;

        if(_vote){
            proposal.yesVotes += votingPower;
        }
        else{
            proposal.noVotes += votingPower;
        }
    }

    function executeProposal(uint256 proposalId) external {
        Proposal storage proposal = proposals[proposalId];

        require(block.timestamp >= proposal.deadline,"VOTING NOT OVER");
        require(!proposal.executed,"ALREADY EXECUTED");
        require(proposal.yesVotes > proposal.noVotes,"PROPOSAL REJECTED");

        proposal.executed = true;

        //proposal logic 
    }

    function getProposal(uint256 proposalId) external view returns(Proposal memory){
        return(proposals[proposalId]);
    }
}