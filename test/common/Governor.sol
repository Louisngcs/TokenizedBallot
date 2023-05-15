// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "../../src/Ballot.sol";
import "../../src/MyERC20Votes.sol";

contract Governor {
    Ballot public ballot;
    MyERC20Votes public token;
    bytes32[] public proposalNames;

    constructor(bytes32[] memory _proposalNames) {
        proposalNames = _proposalNames;
    }

    function deployMyERC20Votes() external returns (address) {
        token = new MyERC20Votes();
        return address(token);
    }

    function deployBallot(
        address tokenAddress,
        uint256 snap,
        uint256 end
    ) external returns (address) {
        ballot = new Ballot(proposalNames, tokenAddress, snap, end);
        return address(ballot);
    }

    function mint(address _to, uint256 _amount) external {
        token.mint(_to, _amount);
    }

    function delegate(address delegatee) external {
        token.delegate(delegatee);
    }

    function transfer(address _to, uint256 _amount) external {
        token.transfer(_to, _amount);
    }

    function getProposals() external view returns (bytes32[] memory) {
        return proposalNames;
    }

    function getContractAddress() external view returns (address) {
        return address(ballot);
    }

    function vote(uint proposal, uint256 amount) external {
        ballot.vote(proposal, amount);
    }

    function getPastVotes(
        address account,
        uint256 blockNumber
    ) external view returns (uint256) {
        return token.getPastVotes(account, blockNumber);
    }

    function setWinningProposal() external {
        ballot.setWinningProposal();
    }

    function winnerName() external view returns (bytes32 winnerName_) {
        winnerName_ = ballot.winnerName();
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
}
