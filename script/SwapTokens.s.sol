// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {DEX} from "../src/DEX.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "forge-std/console.sol";

contract SwapTokens is Script {
    function run() external {
        address dexAddress = 0xf924B30Df02e4139225DF419b7efeDF7D676132a;
        address tokenIn = vm.envAddress("BAO_TOKEN"); // TKNA
        address tokenOut = vm.envAddress("LOC_TOKEN"); // TKNB
        uint256 amountIn = 100 ether; // Swap 100 TKNA

        vm.startBroadcast();
        DEX dex = DEX(dexAddress);
        IERC20(tokenIn).approve(dexAddress, amountIn); // Approve DEX to spend 100 TKNA
        dex.swapExactInput(tokenIn, tokenOut, amountIn, 0); // Min amount out = 0
        vm.stopBroadcast();
    }
}