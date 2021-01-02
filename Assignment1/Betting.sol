pragma solidity 0.7.0;

contract Betting {
    
    address payable[] public  players; // dynamic array with players addresses
    address payable public manager; // contract manager
    uint256 public totalAmount;
    bool public isBetActive=false;
    
    // contract constructor, runs once at contract deployment
    constructor()  {
        // the manager is account address that deploys the contract
        manager = msg.sender; 
    }

    // this fallback payable function will be automatically called when somebody
    //sends ether to our contract address
    function betAmount() payable public {
        require(msg.value >= 0.01 ether);
        players.push(msg.sender); // add the address of the account that                                     
                                  // sends ether to players array
                                  
        totalAmount = totalAmount + msg.value;
    } 

    function get_balance()  payable public returns(uint) {
        require(msg.sender == manager);
        return address(this).balance; // return contract balance
    }

    // returns a very big pseodo-random integer no.
    function random() public view returns(uint256) {
        return uint8(uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length))))%100;
    }
    
    function fees() public {
        totalAmount = totalAmount-totalAmount/100;
    }

    function selectWinner() public  returns(address) {
        require(msg.sender == manager);
        uint r = random();
        

        // transfer contract balance to the winner address
        
        if (r % 2 == 0) {
            players[0].transfer(totalAmount*2/3);
            players[1].transfer(totalAmount*1/3);
          } 
        else {
            players[1].transfer(totalAmount*2/3);
            players[0].transfer(totalAmount*1/3);
        }

        isBetActive= false;
    }
 }
