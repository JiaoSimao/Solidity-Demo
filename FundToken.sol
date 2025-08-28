// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FundToken {
    //1.通证的名字
    //2.通证的简称
    //3.通证的发行数量
    //4.owner地址
    //5.balances address => uint256
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    address public owner;
    mapping(address => uint256) public balances;

    constructor(string memory _tokenName, string memory _tokenSymbol) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        owner = msg.sender;
    }

    //mint函数 获取通证
    function mint(uint256 _amout) public {
        balances[msg.sender] += _amout;
        totalSupply += _amout;
    }

    //transfer：transfer通证
    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "balance not enough");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
    //balanceof：查看某个地址的通证数量
    function balanceOf(address _address) public view returns(uint256) {
        return balances[_address];
    }
}