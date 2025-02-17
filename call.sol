//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {
    uint256 public total = 0;
    uint256 public fallbackCalled = 0;
    string public incrementer;

    fallback() external payable {
        fallbackCalled += 1;
    }

    function inc(uint256 _amount, string memory _incrementer) external returns(uint256) {
        total += _amount;
        incrementer = _incrementer;

        return total;
    } 
}

contract Caller {
    
    function testCall(address _contract, uint256 _amount, string memory _incrementer) external returns (bool, uint256) {
       (bool err, bytes memory res) = _contract.call(abi.encodeWithSignature("inc(uint256, string)", _amount, _incrementer));
      //yanlış function çağrıları yine fallback i tetikler (call edilen functio yanlış yazılırsa vs )
        uint256 _total = abi.decode(res, (uint256));
        // call daki ham veriyi eşitlediğimiz res i decode edip uint256 tipinde bir çıktı vermesini represent ediyor
        return (err, _total);
    }

    /* call yapısı direk değil de dolaylı bir şekilde çağıracağı fonksiyona ulaşırsa daha güvenli olur.
    contract Caller {
    function callTransfer(address _contract, address _to, uint256 _amount) external {
        bytes4 selector = bytes4(keccak256("transfer(address,uint256)"));
        (bool success, ) = _contract.call(abi.encodeWithSelector(selector, _to, _amount));
        require(success, "Call failed");
    }
}
*/

    function payToFallback(address _contract) external payable {
        (bool err,) = _contract.call{value: msg.value}("");
        if(!err) revert();
    }


}