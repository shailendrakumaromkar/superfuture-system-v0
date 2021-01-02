# superfuture-system

## Assignment1

1. Create the architecture of a smart contract based system that has the following
properties:  
a. Lenders can deposit ETH and USDC into Bank A  
b. Borrowers can deposit ETH as collateral and borrow  
c. Bank A can find out the credit score C of any Borrower B  
d. Borrower B can borrow from Bank A an amount up to a function of the credit score = f(A)  
e. The borrow interest rate is decided by the credit score = I(A), the collateral ratio and the supply of the borrowed asset. If the borrower has deposited more
collateral, then the interest rate is lower. If the supply of the borrowed asset is low and the demand is high, the interest rate is higher.  
f. The collateral ratio is at least 120%. Liquidation happens at 100%.  
g. Borrower receives collateral - interest_paid back when the borrowed amount is returned.  
h. Bank A deposits any unused ETH and USDC into compound and aave to collect interest  

You do not need to deploy these contracts on the testnet/mainnet. Please do the following:  
- Draw Out the Architecture diagram - Show how smart contracts are structured and interact with each other.  
- Write the functions that need to be created in order for the above smart contracts to work with each other. Example: function transfer ( address dst , uint256 amount ){}  
NOTE:  
- What is the point of the above task?  
- We will be building a similar system above and want to understand how you think about the various parameters and organization of code in a clean way  


### Solution
Create Architecture Diagram with below smart contract function details:

#### State variable


#### Struct


#### Events


#### Enums


#### Mappings


#### Modifiers
a. onlyDepositor() {}
b. 



#### Functions
a. function deposit(string type, address asset, uint256 amount, address depositor) public returns (bool) {}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
|`type`|string| Type of cryptocurrency to deposit "ETH" , "USDC"|
| `asset`  | address  | Address of asset - "ETH" , "USDC" |
| `amount`  | uint256  | Amount to deposit|
|`depositor`|address| Address of depositor, external person can also deposit to same account on behalf of depositor|

b. function withdraw(string type, address asset, uint256 amount, address receiver) onlyDepositor public returns  (bool){}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
|`type`|string|Type of cryptocurrency to deposit "ETH" , "USDC"|
| `asset`  | address  | Address of asset - "ETH" & "USDC"|
| `amount`  | uint256  | Amount to withdraw|
|`receiver`|address| Who will recieve the amount back to his account|

c. function borrow(string type, address asset, uint256 borrowingAmount, uint256 interestRate, address borrower) public returns  (bool){}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
|`type`|string|Type of cryptocurrency to borrow "ETH" , "USDC"|
| `asset`  | address  | Address of asset - "ETH" & "USDC" |
| `borrowingAmount`  | uint256  |Amount to borrow |
|`interestRate`|uint256|Interest rate to be levied based on f(A)|
|`receiver`|address|Borrower address|

d. function repay(string type,address asset, uint256 repayAmount, uint256 interestRate, address repayer) public returns  (bool){}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
|`type`|string|Type of cryptocurrency to repay "ETH" , "USDC"|
| `asset`  | address  |Address of asset - "ETH" & "USDC" |
| `repayAmount`  | uint256  |Amounnt to be repay = collateral + interest|
|`repayer`|address| Address of repayer, external person can also repay amount on bhalf of borrower |

e. function creditScore(address borrower) public returns (uint8) {}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
| `borrower`  | Address|Address of borrower whose Credit Score to be fetched |



f. function allowedBorrowingAmount (uint8 creditScore, address borrowerAddress) public returns (uint256){}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
| `creditScore`  | uint8  | Credit score of a  borrower:  <br> 1.  creditScore >300 & creditScore <579  <br> allowedBorrowingAmount = 20% <br>  <br> 2.  creditScore >580 & creditScore <669  <br> allowedBorrowingAmount = 50% <br>  <br> 3.  creditScore >670 & creditScore <739  <br> allowedBorrowingAmount = 60% <br>  <br> 4.  creditScore >740 & creditScore <799  <br> allowedBorrowingAmount = 70% <br>  <br> 5.  creditScore >800 & creditScore <850  <br> allowedBorrowingAmount = 80% <br> |
| `borrowerAddress`  | address  | Address of borrower|


g. function borrowerInterest(uint8 creditStore,uint8 collateralRatio, uint256 assetSupply ){}  

| Parameter Name | Type |Description |
| ------------- | ------------- | ------------- |
| `creditStore`  | uint8  |Credit score of borrower |
| `collateralRatio`  | uint8  | Collateral Ratio  atleast 120% |
|`assetSupply`|uint256|Supply of asset available in pool |


| Credit Score| Collatoral Ratio% |Utilisation |
| ------------- | ------------- | ------------- |
| `creditStore`  | uint8  |Credit score of borrower |
| `collateralRatio`  | uint8  | Collateral Ratio  atleast 120% |
|`assetSupply`|uint256|Supply of asset available in pool |


| Credit Score | Collatoral Ratio% | Utilisation Rate% | Interest Rate% |
| ------------ | ------------- | ------------- |
| 850 | 400 | 100 | 10 |
| 800 | 350 | 90 | 20 |
| 700 | 300 | 75 | 30 |
| 600 | 250 | 50 | 40 |
| 500 | 200 | 25 | 50 | 
| 400 | 150 | 10 | 60 |
| 300 | 120 | 0 | 70 |


||||
|---|---|---|

## Assignment2
2. Create and deploy (to testnet) a very simple smart contract system that does the
following:  
a.  Allows 3 users to bet amount X.  
b.  Take 1% fees from amount 3X into owner’s account. Amount left now should be 2.97X  
c.  Generate random number. Based on the random number, sends 2.97*X*2/3 to one user, returns 2.97*X/3 to another user and 0 to the last user. (zero-sum game)  
You do not need a complex front-end, just needs to work.
After the above is done, create a small script that pulls all addresses that have interacted with
the above lottery system (using web3 calls or however else), as well as the volume of bets per
user.

### Solution
Written Smart Contract base on below requirement specs above mentioned-

Betting.sol  
web3.JS
