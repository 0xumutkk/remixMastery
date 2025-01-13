//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract InterfacesandAbstracts{

    //OOP'deki polymorphism konseptinin uygulanma biçimlerinden biridir.
    //solidity de sınıflar --> contracts
    /*      Araç
        Kamyon, Otomobil,Karavan
    fn tekerlekSayısıAl(Araç a)--> int tekerlek sayısı
            return a.tekerlekSayısı; */

    //Interfaces yalnızca fn ların declerationını içerir ve body lerini bulundurmazlar
    //Interface implemente edilliyorsa bütün fn ler bulunmalıdır ve deploy edilemez
    //ERC-20 ve ERC-721 standartalrında kullanılır
}
// Interface definition
interface IVehicle {
    function start() external;
    function stop() external;
}

// Implementing contract
contract Car is IVehicle {
    function start() external override {
        // Implementation of start
    }

    function stop() external override {
        // Implementation of stop
    }
}

       abstract contract Animal {
    function sound() public virtual returns (string memory); // Abstract function
    function eat() public pure returns (string memory) {
        return "Animal is eating.";

        //abstract functions içerebilir ve abstract function a sahip kontrat deploy edilemez
        //state variables ve constructor içerebilirken Interface içeremez
    
    }
}

// Concrete contract
contract Dog is Animal {
    function sound() public pure override returns (string memory) {
        return "Bark!";
    }
    
// Abstract Contract
/* abstract contract FeeCalculator {
    uint256 public constant feePercentage = 2;

    // Ortak fonksiyonun abstract tanımı (gövdesi olan)
    function calculateFee(uint256 amount) public pure virtual returns (uint256) {
        return (amount * feePercentage) / 100;
    }
}
*/
// İlk Sözleşme
contract Payment is FeeCalculator {
    function processPayment(uint256 amount) public pure returns (uint256) {
        uint256 fee = calculateFee(amount); // Abstract contract'taki fonksiyon kullanılıyor
        return amount - fee; // Ücret düşüldükten sonraki tutar
    }

    /*kod verimliliği açısından birden fazla kontratta kullanılan fonksiyonu abstract kontratta
        declera edip diğer kontratlarda  bu abstract kontratı inheritance alarak kullanabilirsin*/
}

// İkinci Sözleşme
contract Subscription is FeeCalculator {
    function subscribe(uint256 amount) public pure returns (uint256) {
        uint256 fee = calculateFee(amount); // Abstract contract'taki fonksiyon kullanılıyor
        return amount - fee; // Ücret düşüldükten sonraki abonelik bedeli
    }
}
















}