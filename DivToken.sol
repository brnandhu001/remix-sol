pragma solidity ^0.7.0;

contract DevToken{
   //name
   string public name='DevToken';
   //symbols or ticker
   string public symbols='Dev';
   //decimal
   uint256 public decimal =18;
   //total supply
   uint256 public totalSupply;
   
   event TransferEvent(address sender,address to,uint256 amount);
   mapping (address => uint256) public balanceOf;
   
   constructor(uint256 _totalsuppy){
       totalSupply = _totalsuppy;
       balanceOf[msg.sender]= _totalsuppy;
       //msg.sender
   }
   
   //transfer function
   function transfer(address _to,uint256 _amount)public{
       //the user that is transfer must have suffiecent balance
        require(balanceOf [msg.sender] >= _amount,'you have not enough balance');
        //subtract amount from sender
        balanceOf[msg.sender] -=_amount;
        //add amont to the user transfered
        balanceOf[_to] +=_amount;
        emit TransferEvent(msg.sender,_to,_amount);
           
       }
