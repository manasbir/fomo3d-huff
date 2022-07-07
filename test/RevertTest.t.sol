// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "forge-std/Vm.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.  
    RevertTest public revertTest;

    /// @dev Setup the testing environment.
    function setUp() public {
        revertTest = RevertTest(HuffDeployer.deploy("RevertTest"));
    }

    /// @dev Ensure that you can set and get the value.
    function testIfReverts() public {
        assertEq(revertTest.revertTest(3, 3), true);
        vm.expectRevert();
        revertTest.revertTest(3, 4);
    }
}

interface RevertTest {
    function revertTest(uint256,uint256) pure external returns(bool);
}
