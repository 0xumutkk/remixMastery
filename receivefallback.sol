//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract receivefallback{

    event Received(address sender, uint amount);
    event FallbackCalled(address sender, uint amount, bytes data);

    // Ether gönderildiğinde çağrılır (veri yoksa)
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Veriyle birlikte çağrıldığında veya tanımlı fonksiyon yoksa çağrılır
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

/* receive payable olmak zorundadır. fallback payable olmak zorunda değildir ancak 
payable değilse ether alma işlemi başarısız olur*/




}