// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {easyMath} from "../src/easyMath.sol";

contract easyMathTest is Test {
    easyMath public easy;

    function setUp() public{
        easy = new easyMath();
    }

    function testEasy() public {
            uint x = easy.mulMulMul(3,3,3);
            assertEq(x, 3*3*3);
    }
// If test is fail and you want more detail about that, you can write terminal "forge test -vvvv"

    function testFailEasy() public{
        uint x = easy.mulMulMul(3,3,3);
        assertEq(x,3*3*4);
    }
//if name of test case is start Fail, we expect test be fail and case passed


}
