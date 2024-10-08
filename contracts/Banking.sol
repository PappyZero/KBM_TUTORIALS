// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract bank {
    mapping(address => uint64) public record;

    // uint64 public MinDepAmt = 250000000000000 wei;
    // uint64 public MaxWithdAmt = 2 ether;



    modifier CheckMinDepAmt(uint64 amt) {
        // MinDepAmt
        require(amt >= 250000000000000, "Minimun Deposit amount is 0.25 Ether");
        _;
    }

    modifier CheckMaxWithdAmt(uint64 amt) {
        // MaxWithdAmt
        require(amt <= 2000000000000000000, "Max Withdrawal Amount is 2 Ether");
        _;
    }

    modifier VerifyAddr(address addr) {
        require(!ContractAddr(addr), "This is a contract address!");
        _;
    }

    // set a minimum amount for deposit
    function deposit(address DepAddr, uint64 DepAmt)
        public
        VerifyAddr(DepAddr) // ensure the caller is not a contract address
        CheckMinDepAmt(DepAmt)
    {
        record[DepAddr] += DepAmt;
    }

    // set a maximum amount for withdrawal (withdrawal limit)
    function withdraw(address WithdAddr, uint64 WithdAmt)
        public
        VerifyAddr(WithdAddr)
        CheckMaxWithdAmt(WithdAmt)
    {
        record[WithdAddr] -= WithdAmt;
    }

    // Helper function to check for contract address
    function ContractAddr(address _addr) internal view returns (bool) {
        return _addr.code.length > 0;
    }

    // Check user ballance
    function GetBalance(address UserAddr) public view returns (uint64) {
        return record[UserAddr];
    }
}