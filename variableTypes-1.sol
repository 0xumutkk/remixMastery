//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract variables {
    //boolean
bool isAvailable = true;
bool isWorking = false; // same time is default value= false
    //string
string username = "umutkiziltoprak";
    //intger-uint- natural 
int numberInt = 15; // can takes -2^256 to 2^256
int8 number2Int = 127; // can takes 0 to 2^7
uint numberUint = 150;// 0 to 2^256 default value = 0
    //address
address userAdress= 0x4f6ae8d244D1bb9389C214eaDf8e2FDe51B5fc5B;
    //struct
struct User{
    uint id;
    string username;
    address userAddress;
    bool isDeleted;
}
    User person1 = User(1,"umutkiziltoprak",0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db,false);
    User person2 = User({
        id:2,
        username: "umut2",
        userAddress: 0x4f6ae8d244D1bb9389C214eaDf8e2FDe51B5fc5B,
        isDeleted: false
    });
        //usage
    //person1.username;
    //person2.isDeleted;

    mapping(address => User) userList;

    function createUser(uint _id,string memory _username,address _userAddress,bool _isDeleted) public{
        User memory tempuser = User({
            id: _id,
            username: _username,
            userAddress: _userAddress,
            isDeleted: _isDeleted
        });
        userList[_userAddress] = tempuser;
    }

    function getUser(address _userAddress) public view returns (User memory){
        return userList[_userAddress];
    }

    constructor(){
        userList[person2.userAddress] = person2;
    }








}