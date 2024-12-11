// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    // State variables
    address public projectOwner;
    uint public fundingGoal;
    uint public deadline;
    uint public fundsRaised;

    // Constructor to initialize project details
    constructor(uint _fundingGoal, uint _durationInDays) {
        projectOwner = msg.sender; // Assign deployer as project owner
        fundingGoal = _fundingGoal;
        deadline = block.timestamp + (_durationInDays * 1 days);
    }

    // Function to contribute to the project
    function contribute() public payable {
        require(block.timestamp < deadline, "Funding period has ended");
        fundsRaised += msg.value;
    }

    // Function to check if the funding goal is met
    function isGoalReached() public view returns (bool) {
        return fundsRaised >= fundingGoal;
    }

    // Function to withdraw funds (only by the project owner)
    function withdrawFunds() public {
        require(msg.sender == projectOwner, "Only project owner can withdraw");
        require(block.timestamp >= deadline, "Cannot withdraw before deadline");
        require(fundsRaised >= fundingGoal, "Funding goal not reached");

        payable(projectOwner).transfer(fundsRaised);
    }
}
