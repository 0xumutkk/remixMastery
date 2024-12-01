//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract visibility {
//public - her şekilde erişilebilir
//private - sadece tanımlandığı contratta erişilebilir
//internal - sadece tanımlandığı contract ve bu contract ı miras alan child contratlar tarafından erişilebilir
// external - contract dışından erişilebilir

uint public numberPublic= 10;
uint private numberPrivate = 15;
uint numberInternal=20;


function getNumber() public view returns(uint){
    return numberPublic;
}
function getNumberPrivate()private pure returns(uint){
    return 5;
}
function getNumberInternal() internal pure returns(uint){
    return 10;
}
function getNumberExternal() external pure returns(uint){
 return 15;
}

function main() public view{
    getNumber();
    getNumberPrivate();
    getNumberInternal();
    // getNumberExternal() - hata verecektir contract içinde çağırılamaz

    }
}
contract  ChildVisibility is visibility{
    // bu contract ana contractı miras alan bir childcontract dır
    // yani içindeki bütün değişikliklere erişebilir
function anotherMain() public view{
    getNumber();
   // getNumberPrivate() sadece tanımlandığı kontratta erişilebilen bir değerdir.
    getNumberInternal();
    }
}
 
contract anotherContract{
    visibility contractVisibility;
    function main() public view {
        contractVisibility.getNumber();
        contractVisibility.getNumberExternal;// dışardan bi kontrat pıblic ve external a erişebilir


    }



}






