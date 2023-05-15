// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "../../src/interfaces/IBallot.sol";
import "../../src/interfaces/IMyERC20Votes.sol";

contract User {
    IBallot public ballot;
    IMyERC20Votes public token;

    constructor(address _ballotAddress, address _tokenAddress) {
        ballot = IBallot(_ballotAddress);
        token = IMyERC20Votes(_tokenAddress);
    }

    function transfer(address _to, uint256 _amount) external {
        token.transfer(_to, _amount);
    }

    function vote(uint proposal, uint256 amount) external {
        ballot.vote(proposal, amount);
    }

    function delegate(address delegatee) external {
        token.delegate(delegatee);
    }

    function getPastVotes(
        address account,
        uint256 blockNumber
    ) external view returns (uint256) {
        return token.getPastVotes(account, blockNumber);
    }
}
