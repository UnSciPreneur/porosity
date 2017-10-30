pragma solidity ^0.4.0;

contract SendBalance {
    mapping ( address => uint ) userBalances ;
    bool withdrawn = false ;

    function getBalance (address u) public constant returns ( uint ){
        return userBalances[u];
    }

    function addToBalance () public payable {
        userBalances[msg.sender] += msg.value ;
    }

    function withdrawBalance () public {
        if (!(msg.sender.call.gas(0x1111).value(
            userBalances[msg.sender])())) { revert(); }
        userBalances[msg.sender] = 0;
    }
}
