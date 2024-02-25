// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IPopeToken {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract Vault {
    struct Grant {
        address donor;
        uint256 amount;
        uint256 releaseTime;
        bool claimed;
    }

    mapping(address => Grant[]) public grants;
    IPopeToken public tokenContract;

    event GrantCreated(address indexed donor, address indexed beneficiary, uint256 amount, uint256 releaseTime);
    event GrantClaimed(address indexed beneficiary, uint256 amount);

    constructor(address _tokenContract) {
        require(_tokenContract != address(0), "Invalid token contract address");
        tokenContract = IPopeToken(_tokenContract);
    }

    function createGrant(address _beneficiary, uint256 _amount, uint256 _releaseTime) external {
        require(_beneficiary != address(0), "Invalid beneficiary address");
        require(_amount > 0, "Invalid amount");
        require(tokenContract.balanceOf(msg.sender) >= _amount, "Insufficient balance");

        require(tokenContract.transferFrom(msg.sender, address(this), _amount), "Transfer failed");

        grants[_beneficiary].push(Grant({
            donor: msg.sender,
            amount: _amount,
            releaseTime: _releaseTime,
            claimed: false
        }));

        emit GrantCreated(msg.sender, _beneficiary, _amount, _releaseTime);
    }

    function claimGrant(uint256 _index) external {
        address beneficiary = msg.sender;
        require(_index < grants[beneficiary].length, "Invalid index");

        Grant storage grant = grants[beneficiary][_index];
        
        require(block.timestamp >= grant.releaseTime, "Grant release time not reached");
        require(!grant.claimed, "Grant already claimed");

        grant.claimed = true;
        require(tokenContract.transfer(beneficiary, grant.amount), "Transfer failed");

        emit GrantClaimed(beneficiary, grant.amount);
    }
}