// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

contract Payable_Modifier
{
    // Logging how much ether has been received and from what wallet address
    
    // Defining a mapping that adds address to integers
    mapping(address => uint) public deposited_ether;

    function deposit() payable external 
    {
        // Incrementing the mapping values
        deposited_ether[msg.sender] += msg.value;
    }

}