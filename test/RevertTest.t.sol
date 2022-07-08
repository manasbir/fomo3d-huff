// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "forge-std/Vm.sol";

contract RevertTestTest is Test { 
    RevertTest public revertTest;

    function setUp() public {
        revertTest = RevertTest(HuffDeployer.deploy("RevertTest"));
    }

    function testIfReverts() public {
        assertEq(revertTest.revertTest(3, 3), true);
        vm.expectRevert();
        revertTest.revertTest(3, 4);
    }
}

interface RevertTest {
    function revertTest(uint256,uint256) pure external returns(bool);
}
