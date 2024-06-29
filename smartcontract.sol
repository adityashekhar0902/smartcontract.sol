// SPDX-License-Identifier:MIT
pragma solidity 0.8.18;
contract MyToken {
    constructor() {
        owner = msg.sender;
    }

    // public variables here
    string public name = "Metacraft";
    string public symbol = "MTC";
    uint public totalsupply = 0;
    address public owner;

    // emits Events
    event Mint(address indexed to, uint amount);
    event Burn(address indexed from, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    // errors
    error InsufficientBalance(uint balance, uint withdrawAmount);

    // mapping variable here
    mapping(address => uint) public balances;

    //modifiers
    modifier onlyOwner{
    assert(msg.sender == owner);
    _;
    }

    // mint function
    function mint(address _address, uint _value) public onlyOwner{
    totalsupply += _value;
    balances [ _address] += _value;
    emit Mint( _address, _value);
    }

// burn function

    function burn (address _address, uint _value) public onlyOwner{
        if(balances[_address] < _value){
            revert InsufficientBalance({balance: balances[_address], withdrawAmount :_value}) ;
        }else{
            totalsupply-=_value;
            balances [_address] -= _value;
            emit Burn(_address, _value);
        }
    }
    function transfer(address _reciver,uint _value ) public{
        require(balances[msg.sender]>=_value, "Account balance must be greater then transfered value! " ) ;
        balances [msg. sender]-=_value;
        balances [_reciver] += _value;
        emit Transfer(msg.sender, _reciver, _value);
    }

}
    
