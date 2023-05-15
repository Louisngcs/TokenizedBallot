// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface IMyERC20Votes {
    function getPastVotes(
        address account,
        uint256 blockNumber
    ) external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function delegate(address delegatee) external;
}
