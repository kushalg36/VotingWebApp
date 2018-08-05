pragma solidity ^0.4.24;

contract Election {
  string public candidate;
  /* Constructor class for storing and reading candidate name */
  function Election() public {
    candidate = "Candidate 1";
  }
}
