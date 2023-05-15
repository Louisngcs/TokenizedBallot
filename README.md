# TokenizedBallot
Only completed test cases to test out both contracts. Did not complete deployment scripts this time round.

```
Traces:
  [105803] BallotTest::testDelegateToOthers() 
    ├─ [79178] User::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [4523] Governor::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   └─ ← 100
    │   └─ ← 100
    ├─ [3719] Governor::getPastVotes(User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], 1) [staticcall]
    │   ├─ [2809] MyERC20Votes::getPastVotes(User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], 1) [staticcall]
    │   │   └─ ← 0
    │   └─ ← 0
    └─ ← ()

[PASS] testDelegateToSelf() (gas: 92651)
Traces:
  [92651] BallotTest::testDelegateToSelf() 
    ├─ [79245] Governor::delegate(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) 
    │   ├─ [73893] MyERC20Votes::delegate(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ emit DelegateVotesChanged(delegate: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [2523] Governor::getPastVotes(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1) [staticcall]
    │   ├─ [1613] MyERC20Votes::getPastVotes(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1) [staticcall]
    │   │   └─ ← 100
    │   └─ ← 100
    └─ ← ()

[PASS] testSetWinningProposalWhileInProgress_Revert() (gas: 157265)
Traces:
  [157265] BallotTest::testSetWinningProposalWhileInProgress_Revert() 
    ├─ [79245] Governor::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [58807] User::vote(0, 100) 
    │   ├─ [53494] Ballot::vote(0, 100) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::expectRevert(Voting is still in progress) 
    │   └─ ← ()
    ├─ [5056] Governor::setWinningProposal() 
    │   ├─ [2407] Ballot::setWinningProposal() 
    │   │   └─ ← "Voting is still in progress"
    │   └─ ← "Voting is still in progress"
    └─ ← ()

[PASS] testTransferResultsInRemainderForDelegatee() (gas: 130361)
Traces:
  [130361] BallotTest::testTransferResultsInRemainderForDelegatee() 
    ├─ [79178] User::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [17374] User::transfer(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 50) 
    │   ├─ [16485] MyERC20Votes::transfer(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 50) 
    │   │   ├─ emit Transfer(from: User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], to: User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], value: 50)
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 100, newBalance: 50)
    │   │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000001
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [4523] Governor::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   └─ ← 50
    │   └─ ← 50
    ├─ [3719] Governor::getPastVotes(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1) [staticcall]
    │   ├─ [2809] MyERC20Votes::getPastVotes(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1) [staticcall]
    │   │   └─ ← 0
    │   └─ ← 0
    ├─ [3719] Governor::getPastVotes(User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], 1) [staticcall]
    │   ├─ [2809] MyERC20Votes::getPastVotes(User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], 1) [staticcall]
    │   │   └─ ← 0
    │   └─ ← 0
    └─ ← ()

[PASS] testTransferResultsInZeroForDelegatee() (gas: 125540)
Traces:
  [125540] BallotTest::testTransferResultsInZeroForDelegatee() 
    ├─ [79178] User::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [13900] User::transfer(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 100) 
    │   ├─ [13188] MyERC20Votes::transfer(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 100) 
    │   │   ├─ emit Transfer(from: User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], to: User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], value: 100)
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 100, newBalance: 0)
    │   │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000001
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [4523] Governor::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   └─ ← 0
    │   └─ ← 0
    ├─ [3719] Governor::getPastVotes(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1) [staticcall]
    │   ├─ [2809] MyERC20Votes::getPastVotes(User: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1) [staticcall]
    │   │   └─ ← 0
    │   └─ ← 0
    ├─ [3719] Governor::getPastVotes(User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], 1) [staticcall]
    │   ├─ [2809] MyERC20Votes::getPastVotes(User: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], 1) [staticcall]
    │   │   └─ ← 0
    │   └─ ← 0
    └─ ← ()

[PASS] testVote() (gas: 187365)
Traces:
  [187365] BallotTest::testVote() 
    ├─ [79245] Governor::delegate(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) 
    │   ├─ [73893] MyERC20Votes::delegate(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ emit DelegateVotesChanged(delegate: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [58775] Governor::vote(1, 100) 
    │   ├─ [53494] Ballot::vote(1, 100) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(102) 
    │   └─ ← ()
    ├─ [33435] Governor::setWinningProposal() 
    │   ├─ [32796] Ballot::setWinningProposal() 
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [3552] Governor::winnerName() [staticcall]
    │   ├─ [2779] Ballot::winnerName() [staticcall]
    │   │   └─ ← 0x50726f706f73616c4f6e65000000000000000000000000000000000000000000
    │   └─ ← 0x50726f706f73616c4f6e65000000000000000000000000000000000000000000
    └─ ← ()

[PASS] testVoteAbovePower_Revert() (gas: 156013)
Traces:
  [156013] BallotTest::testVoteAbovePower_Revert() 
    ├─ [79245] Governor::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [58807] User::vote(0, 75) 
    │   ├─ [53494] Ballot::vote(0, 75) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::expectRevert(Not enough voting power) 
    │   └─ ← ()
    ├─ [3737] User::vote(1, 125) 
    │   ├─ [2918] Ballot::vote(1, 125) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← "Not enough voting power"
    │   └─ ← "Not enough voting power"
    └─ ← ()

[PASS] testVoteButNotDelegated_Revert() (gas: 28670)
Traces:
  [28670] BallotTest::testVoteButNotDelegated_Revert() 
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [0] VM::expectRevert(Not enough voting power) 
    │   └─ ← ()
    ├─ [17901] Governor::vote(1, 100) 
    │   ├─ [12614] Ballot::vote(1, 100) 
    │   │   ├─ [2809] MyERC20Votes::getPastVotes(Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1) [staticcall]
    │   │   │   └─ ← 0
    │   │   └─ ← "Not enough voting power"
    │   └─ ← "Not enough voting power"
    └─ ← ()

[PASS] testVoteByDelegated() (gas: 194069)
Traces:
  [194069] BallotTest::testVoteByDelegated() 
    ├─ [79245] Governor::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [58807] User::vote(1, 100) 
    │   ├─ [53494] Ballot::vote(1, 100) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(102) 
    │   └─ ← ()
    ├─ [35435] Governor::setWinningProposal() 
    │   ├─ [32796] Ballot::setWinningProposal() 
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [3552] Governor::winnerName() [staticcall]
    │   ├─ [2779] Ballot::winnerName() [staticcall]
    │   │   └─ ← 0x50726f706f73616c4f6e65000000000000000000000000000000000000000000
    │   └─ ← 0x50726f706f73616c4f6e65000000000000000000000000000000000000000000
    └─ ← ()

[PASS] testVoteByDelegatedSplit() (gas: 216823)
Traces:
  [216823] BallotTest::testVoteByDelegatedSplit() 
    ├─ [79245] Governor::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [58807] User::vote(0, 75) 
    │   ├─ [53494] Ballot::vote(0, 75) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [26407] User::vote(1, 25) 
    │   ├─ [25594] Ballot::vote(1, 25) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(102) 
    │   └─ ← ()
    ├─ [33435] Governor::setWinningProposal() 
    │   ├─ [30796] Ballot::setWinningProposal() 
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [3552] Governor::winnerName() [staticcall]
    │   ├─ [2779] Ballot::winnerName() [staticcall]
    │   │   └─ ← 0x50726f706f73616c5a65726f0000000000000000000000000000000000000000
    │   └─ ← 0x50726f706f73616c5a65726f0000000000000000000000000000000000000000
    └─ ← ()

[PASS] testWinnerNameWhileInProgress_Revert() (gas: 157220)
Traces:
  [157220] BallotTest::testWinnerNameWhileInProgress_Revert() 
    ├─ [79245] Governor::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   ├─ [73893] MyERC20Votes::delegate(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9]) 
    │   │   ├─ emit DelegateChanged(delegator: Governor: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], fromDelegate: 0x0000000000000000000000000000000000000000, toDelegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9])
    │   │   ├─ emit DelegateVotesChanged(delegate: User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], previousBalance: 0, newBalance: 100)
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::roll(2) 
    │   └─ ← ()
    ├─ [58807] User::vote(0, 100) 
    │   ├─ [53494] Ballot::vote(0, 100) 
    │   │   ├─ [1613] MyERC20Votes::getPastVotes(User: [0x5991A2dF15A8F6A256D3Ec51E99254Cd3fb576A9], 1) [staticcall]
    │   │   │   └─ ← 100
    │   │   └─ ← ()
    │   └─ ← ()
    ├─ [0] VM::expectRevert(Voting is still in progress) 
    │   └─ ← ()
    ├─ [5033] Governor::winnerName() [staticcall]
    │   ├─ [2442] Ballot::winnerName() [staticcall]
    │   │   └─ ← "Voting is still in progress"
    │   └─ ← "Voting is still in progress"
    └─ ← ()

    ```