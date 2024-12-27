//SPDX-License-Identifier: GPL-3.0
pragma soldidity >-0.7.0 <0.9.0;

contract Constructor{

// constructor farklı özel bir isim almaz 
// sadece başlangıçta çalışan fonksiyondur, değişmesini istemediğimiz değerleri tanımlarız burada
    
    string public tokenName;
    uint public totalSupply;
    constructor (string memory name,uint number){
        tokenName = name;
        totalSupply= number;
    }

// selfdestruct parametre alabiliyor,sözleşmeyi fesheden fonksiyondur dolayısıyla 1 kez çağrılabilir
   // selfdestruct(address);

    function set(uint number) public {
        totalSupply = number;
    }
// constructor ı çağıramayız ancak orada tanımlatılan değerleri set function ile değiştirebiliriz.

//constant,immutable
    uint public constant number = 10;
/*constant da değerini hemen atamak gerekiyorken immutable da öyle bir zorunluluk yoktur.
    uint public immutable numberr;

    constructor(uint num){
        number= num;
    }

    function set(uint number2)public{
        num=number2;
        }

*/

}