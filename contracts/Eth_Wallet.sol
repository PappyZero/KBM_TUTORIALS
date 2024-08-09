// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24; 


// Contract for receiving and sending Ether. 
contract Eth_Wallet
{
    // Defining a variable "owner", and giving it "payable" so that only the owner can send Ether out. 
    address payable public owner;

    // Initializing the state variable inside a constructor. 
    constructor() {
        owner = payable (msg.sender);
    }

    // Enabling the contract to be able to receive Ether.  
    receive() external payable { }

    // Defining the function "withdraw" to send Ether out of the contract. 
    function withdraw(uint _amount) external 
    {
        // Using "require" so only the owner will be able to call this function. 
        require(msg.sender == owner, "The caller is not the owner.");
        owner.transfer(_amount);

        // (bool sent,) = msg.sender.call{value: _amount}("");
        // require(sent, "Failed to send Ether");

    }

    // Defining a function "get_bal" that returns the amount of Ether stored in the contract. 
    function get_bal() external view returns (uint)
    {
        return address(this).balance;
    }
}
