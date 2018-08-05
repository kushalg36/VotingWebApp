pragma solidity ^0.4.24;

contract Election {
  /* Model a Candidate */
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }
  /* Store accounts */
  mapping(address => bool)public voters;
  /* Store a Candidate*/
  mapping(uint => Candidate) public candidates;
  /* Storing the number of candidates */
  uint public candidatesCount;
  /* Defining Events */
  event votedEvent(
    uint indexed _candidateId
    );

  /* Constructor */
  function Election() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate (string _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    /* Condition for only vote by address */
    require(!voters[msg.sender]);
    /* Condition to check id lies between 0 and number of candidates */
    require(_candidateId > 0 && _candidateId <= candidatesCount);
    /* record that voter has voted */
    voters[msg.sender] = true;
    /* update candidate vote count */
    candidates[_candidateId].voteCount ++;

    /* trigger event */
    votedEvent(_candidateId);
  }
}
