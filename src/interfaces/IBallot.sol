// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IBallot {
    function vote(uint proposal, uint256 amount) external;
}
