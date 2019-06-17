pragma solidity ^0.5.8;

contract Conference {

 	address public organizer;
 	mapping (address => uint) public registrantsPaid;
 	uint public numRegistrants;
 	uint public quota;

  	event Deposit(address _from, uint _amount);
 	event Refund(address _to, uint _amount);

 	 constructor() public {

 		organizer = msg.sender;
 		quota = 100;
 		numRegistrants = 0;
 	}

 	function buyTicket() public payable{
 		require(numRegistrants >= quota, "Number of registrants is lower than quota");
 		registrantsPaid[msg.sender] = msg.value;
 		numRegistrants++;
 		emit Deposit(msg.sender, msg.value);
 	}

}
