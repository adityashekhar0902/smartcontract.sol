# Smartcontract
Introducing a fundamental Solidity smart contract with all the required functionality, such as token minting, burning, and transferring, that simulates a token.

## Description 

This program represents a contract written in the Solidity programming language, which is used to generate smart contracts on the Ethereum network. One program contains all of the material presented in the ETH Intermidiate Course under Solidity. A mapping from addresses to balances, a mint function that needs two inputs (an address and a value), a burn function and transfer function are a few examples of this. Public variables that store information about your coin are another.

## Getting Started and Code
You can use Remix, an online Solidity IDE, to run this application. Start using the Remix website by going to https://remix.ethereum.org/.

On the Remix website, click the "+" sign in the left sidebar to begin a new file. Save the file with the extension.sol, for instance, ETH!_Project.sol. After copying the code, paste it into the file:


```javascript
// SPDX-License-Identifier:MIT
pragma solidity 0.8.18;
```
It specifies that the code is written in Solidity language and is compatible with version 0.8.18

```javascript
contract MyToken {
    constructor() {
        owner = msg.sender;
    }

    // public variables here
    string public name = "Metacrafter";
    string public symbol = "MTC";
    uint public totalsupply = 0;
    address public owner;

```
constructor() Sets the owner variable to the address that deployed the contract (msg.sender).
It creates a new contract named MyToken. 'string public name = "Metacrafter"' and 'string public symbol = "MTC"' which represent the name and symbol of the token. 'uint public totalSupply' is a Public variable tracking the total supply of tokens. 'address public owner' is Public variable storing the address of the contract creator.

```javascript
// emits Events
    event Mint(address indexed to, uint amount);
    event Burn(address indexed from, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

```
These are Events emitted when tokens are minted, burned, or transferred, respectively.

```javascript
// errors
    error InsufficientBalance(uint balance, uint withdrawAmount);
```
It is a Custom error definition used in the burn function to revert transactions when the user tries to burn more tokens than they possess.

```javascript
// mapping variable here
    mapping(address => uint) public balances;
```
It declares a public state variable balance which is a mapping from addresses to integers. This represents the balance of tokens for each address.

```javascript
 //modifiers
    modifier onlyOwner{
    assert(msg.sender == owner);
    _;
    }
```
onlyOwner is the Modifier restricting access to functions only to the owner of the contract.

```javascript
 // mint function
    function mint(address _address, uint _value) public onlyOwner{
    totalsupply += _value;
    balances [ _address] += _value;
    emit Mint( _address, _value);
    }
```
It is a public function that allows to increase the supply of tokens. it increases the 'totalSupply' by '_value' and also increases the balance of '_account' by '_value'

```javascript
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
```
It is a public function that allows to decrease the supply of tokens. If '_account' has atleast '_value' tokens, it decrease the 'totalSupply' by '_value' and also decreases the balance of '_account' by '_value'.

```javascript
function transfer(address _reciver,uint _value ) public{
        require(balances[msg.sender]>=_value, "Account balance must be greater then transfered value! " ) ;
        balances [msg. sender]-=_value;
        balances [_reciver] += _value;
        emit Transfer(msg.sender, _reciver, _value);
    }

}
```
Transfer is a public function that transfer token from sender account to reciever account. If the balance of sender account is greater than the amount entered to transfer then only the money will be tranferred otherwise it will show a message
"Account balance must be greater then transfered value!." It will decrease the enter value from sender account and increase the balance of reciver

## Overview

The goal of this project is to give users a practical understanding of many of the subjects taught in the ETH_Intermidiate Course on Solidity. This software provides real-world examples and implementations to enhance learning and demonstrate how crucial Solidity concepts function.

## Author
adityashekhar

## License
This project is licensed under the MIT License - see the LICENSE file for details
