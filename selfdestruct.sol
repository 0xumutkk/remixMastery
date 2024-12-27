// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfDestruct {
    address public owner;

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // Sadece owner selfdestruct çağırabilir
    function destroyContract() external {
        require(msg.sender == owner, "Only owner can destroy the contract");
        selfdestruct(payable(owner)); // Sözleşmeyi yok et ve Ether'i owner'a gönder
    }
}
