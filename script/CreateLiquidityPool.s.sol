// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {DEX} from "../src/DEX.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "forge-std/console.sol";


contract CreateLiquidityPool is Script {
    function run() external {
        // address dexAddress = 0xf924B30Df02e4139225DF419b7efeDF7D676132a; //dex address
        address dexAddress = 0xa88eaca445c68134e18944623629e7D5728D05D4; //2nd dex address
        address baoToken = vm.envAddress("BAO_TOKEN"); // TKNA
        address locToken = vm.envAddress("LOC_TOKEN"); // TKNB
        uint256 feePercentage = 30; // 0.3% fee
        uint256 maxSwapPercentage = 1000; // 10% max swap
        string memory name = "BAOLOCPool";
        string memory symbol = "BAOLOC";

        vm.startBroadcast();
        DEX dex = DEX(dexAddress);
        address liquidityPool = dex.createLiquidityPool(baoToken, locToken, feePercentage, maxSwapPercentage, name, symbol);
        console.log("Liquidity pool created at:", liquidityPool);
        vm.stopBroadcast();
    }
}