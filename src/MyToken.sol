// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyToken {
  mapping(address => uint256) private balances;
  // 存储 Token 的总发行量
  uint256 public totalSupply;
  // 存储 Token 的发行者
  address private owner;

  constructor() {
    owner = msg.sender;
  }

  // 用于铸造 Token 的函数
  function mint(address recipient, uint256 amount) public {
    require(msg.sender == owner, "Only the owner can perform this action");
    balances[recipient] += amount;
    totalSupply += amount;
  }

  // 用于查询某个地址对应的 Token 余额
  function balanceOf(address account) public view returns (uint256) {
    return balances[account];
  }

  // 转账
  function transfer(address recipient, uint256 amount) public returns (bool) {
    require(amount <= balances[msg.sender], "Not enough balance.");
    balances[msg.sender] -= amount;
    balances[recipient] += amount;
    return true;
  }
}