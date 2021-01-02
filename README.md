# superfuture-system

## Assignment1

1. Create the architecture of a smart contract based system that has the following
properties:
a. Lenders can deposit ETH and USDC into Bank A
b. Borrowers can deposit ETH as collateral and borrow
c. Bank A can find out the credit score C of any Borrower B
d. Borrower B can borrow from Bank A an amount up to a function of the credit
score = f(A)
e. The borrow interest rate is decided by the credit score = I(A), the collateral ratio
and the supply of the borrowed asset. If the borrower has deposited more
collateral, then the interest rate is lower. If the supply of the borrowed asset is low
and the demand is high, the interest rate is higher.
f. The collateral ratio is at least 120%. Liquidation happens at 100%.
g. Borrower receives collateral - interest_paid back when the borrowed amount is
returned.
h. Bank A deposits any unused ETH and USDC into compound and aave to collect
interest
You do not need to deploy these contracts on the testnet/mainnet. Please do the following:
- Draw Out the Architecture diagram - Show how smart contracts are structured and
interact with each other.
- Write the functions that need to be created in order for the above smart contracts to work
with each other. Example: function transfer ( address dst , uint256 amount ){}
NOTE:
- What is the point of the above task?
- We will be building a similar system above and want to understand how you think
about the various parameters and organization of code in a clean way



## Assignment2
Written Smart Contract base on below requirement specs-

2. Create and deploy (to testnet) a very simple smart contract system that does the
following:
a.  Allows 3 users to bet amount X.
b.  Take 1% fees from amount 3X into owner’s account. Amount left now should be
2.97X
c.  Generate random number. Based on the random number, sends 2.97*X*2/3 to
one user, returns 2.97*X/3 to another user and 0 to the last user. (zero-sum
game)
You do not need a complex front-end, just needs to work.
After the above is done, create a small script that pulls all addresses that have interacted with
the above lottery system (using web3 calls or however else), as well as the volume of bets per
user.


