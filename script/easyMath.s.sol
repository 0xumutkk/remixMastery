// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {easyMath} from "../src/easyMath.sol";

contract easyMathScript is Script {
    easyMath public easy;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        easy = new easyMath();

        vm.stopBroadcast();
    }
}
