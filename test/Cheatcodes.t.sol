// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Cheatcodes.sol";

contract CheatcodesTest is Test {

    Cheatcodes public cheats;

    function setUp() public {
        cheats = new Cheatcodes();
    }

    //we can run a test that that to ask if something will fail(like inverse idk) w/ function testFail..(){}
    /// this test will fail because our contracts requires us to wait 2 minutes, but the block.timestamp
    /// is initiated when the test is called. e.g. our block.timestamp will start at 0 when this function is called
    function testFailSetNumber() public {
        cheats.setNumber(5);
    }

    //cheatcode #1 time 
    function setNumber() public {
        //foundry cheatcode --increase block.timestamp by x
        vm.warp(150); 

        cheats.setNumber(5);
    }
}