//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
contract Modifier{
/* modifier [modifierName] ( [type] [parameterName] ){
    ***
    _;
    }
*/

    address ownerAddress = 0x4f6ae8d244D1bb9389C214eaDf8e2FDe51B5fc5B;
    uint number = 12;
    
    modifier isOwner(){
        require(msg.sender == ownerAddress,"User must be owner of this contract");
    _;
}
    function getNumber() public view isOwner returns(uint){
        return number;
    }

    function setNumber(uint _newNumber) public isOwner{
        number = _newNumber;
    }

}