// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";
import "../src/Ballot.sol";
import "./common/Governor.sol";
import "./common/User.sol";

contract BallotTest is Test {
    bytes32[] public proposalNames;
    address public ballotContract;
    address public tokenContract;
    uint proposalIndex = 1;
    uint256 snap;
    uint256 end;

    Governor internal governor;
    User internal user2;
    User internal user3;
    User internal user4;

    function setUp() public {
        string[3] memory proposals = [
            "ProposalZero",
            "ProposalOne",
            "ProposalTwo"
        ];
        for (uint i = 0; i < proposals.length; i++) {
            proposalNames.push(stringToBytes32(proposals[i]));
        }

        snap = block.number;
        end = block.number + 100;

        governor = new Governor(proposalNames);
        tokenContract = governor.deployMyERC20Votes();
        ballotContract = governor.deployBallot(tokenContract, snap, end);

        createUsers(ballotContract, tokenContract);

        governor.mint(address(user2), 100);
        governor.mint(address(user3), 100);
        governor.mint(address(governor), 100);
    }

    function stringToBytes32(
        string memory source
    ) internal pure returns (bytes32 result) {
        require(
            bytes(source).length <= 32,
            "String length should not exceed 32 bytes."
        );

        assembly {
            result := mload(add(source, 32))
        }
    }

    function createUsers(
        address _ballotContract,
        address _tokenAddress
    ) public {
        user2 = new User(_ballotContract, _tokenAddress);
        user3 = new User(_ballotContract, _tokenAddress);
        user4 = new User(_ballotContract, _tokenAddress);
    }

    function testDelegateToSelf() public {
        governor.delegate(address(governor));
        vm.roll(block.number + 1);
        assertEq(governor.getPastVotes(address(governor), snap), 100);
    }

    function testDelegateToOthers() public {
        user2.delegate(address(user4));
        vm.roll(block.number + 1);
        assertEq(governor.getPastVotes(address(user4), snap), 100);
        assertEq(governor.getPastVotes(address(user2), snap), 0);
    }

    function testTransferResultsInZeroForDelegatee() public {
        user2.delegate(address(user4));
        user2.transfer(address(user3), 100);
        vm.roll(block.number + 1);
        assertEq(governor.getPastVotes(address(user4), snap), 0);
        assertEq(governor.getPastVotes(address(user3), snap), 0);
        assertEq(governor.getPastVotes(address(user2), snap), 0);
    }

    function testTransferResultsInRemainderForDelegatee() public {
        user2.delegate(address(user4));
        user2.transfer(address(user3), 50);
        vm.roll(block.number + 1);
        assertEq(governor.getPastVotes(address(user4), snap), 50);
        assertEq(governor.getPastVotes(address(user3), snap), 0);
        assertEq(governor.getPastVotes(address(user2), snap), 0);
    }

    function testVote() public {
        governor.delegate(address(governor));
        vm.roll(block.number + 1);
        governor.vote(proposalIndex, 100);
        vm.roll(block.number + 100);
        governor.setWinningProposal();
        assertEq(governor.winnerName(), stringToBytes32("ProposalOne"));
    }

    function testVoteByDelegated() public {
        governor.delegate(address(user4));
        vm.roll(block.number + 1);
        user4.vote(proposalIndex, 100);
        vm.roll(block.number + 100);
        governor.setWinningProposal();
        assertEq(governor.winnerName(), stringToBytes32("ProposalOne"));
    }

    function testVoteByDelegatedSplit() public {
        governor.delegate(address(user4));
        vm.roll(block.number + 1);
        user4.vote(0, 75);
        user4.vote(1, 25);
        vm.roll(block.number + 100);
        governor.setWinningProposal();
        assertEq(governor.winnerName(), stringToBytes32("ProposalZero"));
    }

    function testVoteButNotDelegated_Revert() public {
        vm.roll(block.number + 1);
        vm.expectRevert("Not enough voting power");
        governor.vote(proposalIndex, 100);
    }

    function testVoteAbovePower_Revert() public {
        governor.delegate(address(user4));
        vm.roll(block.number + 1);
        user4.vote(0, 75);
        vm.expectRevert("Not enough voting power");
        user4.vote(1, 125);
    }

    function testSetWinningProposalWhileInProgress_Revert() public {
        governor.delegate(address(user4));
        vm.roll(block.number + 1);
        user4.vote(0, 100);
        vm.expectRevert("Voting is still in progress");
        governor.setWinningProposal();
    }

    function testWinnerNameWhileInProgress_Revert() public {
        governor.delegate(address(user4));
        vm.roll(block.number + 1);
        user4.vote(0, 100);
        vm.expectRevert("Voting is still in progress");
        governor.winnerName();
    }
}
