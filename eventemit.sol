//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract eventemit{
struct Order{
    address customer;
    string zipCode;
    uint256[] products;
}
    Order[] public orders;
    address public owner;
    uint256 public txCount;

    constructor(){
        owner = msg.sender;
    }

    event OrderCreated(uint256 _orderId, address indexed _consumer);
// indexed diye belirtirsem event içindeki değişkeni daha sonra bunu sorrgulayabilirim.

function CreateOrder(string memory _zipCode,uint[] memory _products) IncTx external returns(uint256) {
    Order memory order;
    order.customer = msg.sender;
    order.zipCode= _zipCode;
    order.products = _products;
    orders.push(order);

    emit OrderCreated(orders.length-1,msg.sender); 
    return orders.length -1;
}
modifier IncTx{
    _;
    txCount++;
}













}


