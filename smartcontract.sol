// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    string public name = "Metacraft";
    string public symbol = "MTC";
    uint256 public totalSupply = 0;
    address public owner;

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    error InsufficientBalance(uint256 available, uint256 requested);

    mapping(address => uint256) public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function mint(address _account, uint256 _value) public onlyOwner {
        totalSupply += _value;
        balance[_account] += _value;
        emit Mint(_account, _value);
    }

    function burn(address _account, uint256 _value) public onlyOwner {
        require(balance[_account] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balance[_account] -= _value;
        emit Burn(_account, _value);
    }

    function transferTokens(address _receiver, uint256 _value) public {
        require(balance[msg.sender] >= _value, "Insufficient balance for transfer");
        balance[msg.sender] -= _value;
        balance[_receiver] += _value;
        emit Transfer(msg.sender, _receiver, _value);
    }
}
