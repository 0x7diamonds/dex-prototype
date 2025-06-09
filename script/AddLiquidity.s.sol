// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {DEX} from "../src/DEX.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "forge-std/console.sol";

contract AddLiquidity is Script {
    function run() external {
        address dexAddress = 0x1665384BaF499EB4Aa6A3490b5d63aD5D61BdA46;
        address baoToken = vm.envAddress("BAO_TOKEN"); // TKNA
        address locToken = vm.envAddress("LOC_TOKEN"); // TKNB
        uint256 maxAmountIn1 = 1000 ether; // 1000 TKNA
        uint256 maxAmountIn2 = 1000 ether; // 1000 TKNB
        uint256 minAmountToReceive = 0; // Minimum liquidity tokens to receive

        vm.startBroadcast();
        DEX dex = DEX(dexAddress);
        IERC20(baoToken).approve(dexAddress, maxAmountIn1); // Approve DEX to spend 1000 TKNA
        IERC20(locToken).approve(dexAddress, maxAmountIn2); // Approve DEX to spend 1000 TKNB
        dex.addLiquidity(baoToken, locToken, maxAmountIn1, maxAmountIn2, minAmountToReceive);
        console.log("Added %s TKNA and %s TKNB to the pool", maxAmountIn1 / 1e18, maxAmountIn2 / 1e18);
        vm.stopBroadcast();
    }
}