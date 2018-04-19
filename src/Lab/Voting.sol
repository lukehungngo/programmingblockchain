pragma solidity ^0.4.11;
/// @title Voting with delegation.
contract Ballot {
    event Voting(address voter, uint proposal);
    event WhoIsWinner(address checker, int winner);
    // This is a type for a single proposal.

    struct Proposal {
        uint name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    Proposal[] public proposals;
    uint public deadline;
    bool endBallot = false;
    int public winnerName = -1;
    /// Create a new ballot to choose one of ‘proposalNames‘.

    function Ballot(uint[] proposalNames, uint durationInMinutes) {
       for (uint i = 0; i < proposalNames.length; i++) {
           // ‘Proposal({...})‘ creates a temporary
           // Proposal object and ‘proposals.push(...)‘
           // appends it to the end of ‘proposals‘.
           proposals.push(Proposal({
               name: proposalNames[i],
               voteCount: 0
           }));
         }
       deadline = now + durationInMinutes * 1 minutes;
    }

    function vote(uint proposal) {
       require(!endBallot);
       proposals[proposal].voteCount += 1;
       Voting(msg.sender,proposal);
    }

    modifier afterDeadline() { if (now >= deadline) _; }
    /* checks if the goal or time limit has been reached and ends the campaign */

    function whoIsWinner() afterDeadline {
        endBallot = true;
        winnerName = int(proposals[winningProposal()].name);
        WhoIsWinner(msg.sender,winnerName);
    }

    /// @dev Computes the winning proposal taking all
    /// previous votes into account.

    function winningProposal() private constant returns (uint winningProposal){
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
        if (proposals[p].voteCount > winningVoteCount) {
          winningVoteCount = proposals[p].voteCount;
          winningProposal = p;
        }
      }
    }
  }