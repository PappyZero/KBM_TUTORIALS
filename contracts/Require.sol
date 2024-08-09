// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

contract Require
{
    // Require can be used as a validation by checking if a condition is true, 
    // if false, it throws an error and reverts the transaction. 

    mapping (address => uint) public deposited_by_addr;

    // Defining a withdrawal function that allows addresses to withdraw the funds they deposited.
    function withdraw(uint amount) public check_funds(amount)
    {
        // Using require to prevent an address from withdrawing more than they deposited. 
        // require(deposited_by_addr[msg.sender] >= amount, "Insufficient Funds");

        payable (msg.sender).transfer(amount);
    } 

    // The modifier can be used if the require will be used mulptiple times in the contract. 
    modifier check_funds(uint amount)
    {
        require(deposited_by_addr[msg.sender] >= amount, "Insufficient Funds");
        _;

    }
}