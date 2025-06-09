// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {Script} from "forge-std/Script.sol";
import {DEX} from "../src/DEX.sol";
import {MintableERC20} from "../test/mock/MintableERC20.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        new DEX();

        vm.stopBroadcast();
    }
}