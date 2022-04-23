pragma solidity ^0.4.0;

contract MappingExample {
    mapping (address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
