// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./interfaces/IMyERC20Votes.sol";

contract Ballot {
    IMyERC20Votes public token;
    uint256 public snapShot;
    uint256 public endBlock;
    bytes32 public winner;

    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    Proposal[] public proposals;

    mapping(address => uint256) public votingPowerSpent;

    constructor(
        bytes32[] memory proposalNames,
        address tokenAddress,
        uint256 snap,
        uint256 end
    ) {
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
        }
        snapShot = snap;
        endBlock = end;
        token = IMyERC20Votes(tokenAddress);
    }

    function vote(uint proposal, uint256 amount) external {
        uint256 remainingVotingPower = getRemainingVotingPower(msg.sender);
        require(remainingVotingPower >= amount, "Not enough voting power");
        proposals[proposal].voteCount += amount;
        votingPowerSpent[msg.sender] += amount;
    }

    function setWinningProposal() public {
        require(block.number > endBlock, "Voting is still in progress");
        winner = proposals[_winningProposal()].name;
    }

    function winnerName() external view returns (bytes32 winnerName_) {
        require(block.number > endBlock, "Voting is still in progress");
        winnerName_ = proposals[_winningProposal()].name;
    }

    function _winningProposal() internal view returns (uint winningProposal_) {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    function getRemainingVotingPower(
        address account
    ) internal view returns (uint256) {
        uint256 _votingPowerSpent = votingPowerSpent[account];
        uint256 totalVotingPower = token.getPastVotes(account, snapShot);
        return totalVotingPower - _votingPowerSpent;
    }
}
