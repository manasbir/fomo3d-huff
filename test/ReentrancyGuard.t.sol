// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract ReentrancyGuardTest is Test {
    /// @dev Address of the SimpleStore contract.  
    ReentrancyGuard public reentrancyGuard;

    /// @dev Setup the testing environment.
    function setUp() public {
        reentrancyGuard = ReentrancyGuard(HuffDeployer.deploy("ReentrancyGuard"));
    }

    /// @dev Ensure that you can set and get the value.
    function testReentrancy() public {
        assertEq(5, reentrancyGuard.nonReentrant());
        
        vm.expectRevert();

        reentrancyGuard.nonReentrant();
    }

    function testReentrancy2() public {
        assertEq(5, reentrancyGuard.nonReentrant2());
        
        vm.expectRevert();

        reentrancyGuard.nonReentrant2();
    }
}

interface ReentrancyGuard {
    function nonReentrant() external returns (uint256);
    function nonReentrant2() external returns (uint256);
}
