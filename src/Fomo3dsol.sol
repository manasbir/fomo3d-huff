//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fomo3dsol {
    uint totalTickets;
    uint currPrice;
    address lastPurchaser;
    uint endTime;
    uint startTime;
    mapping (address => uint) ownerToTix;
    mapping (address => uint) amountOwed;

    event newEndTime (uint _endTime);


    function buyTickets() public payable {
        if (endTime < block.timestamp) {
            // will have to think about this
            payable(lastPurchaser).transfer(address(this).balance);
        } else {
            ownerToTix[msg.sender] += msg.value / currPrice;
        }
    }

    function updateTixPrice() internal {

    }

    function updateEndTime(uint _tixBought) internal {
        endTime += _tixBought * 30 seconds;
    }

    function claim() public {
        amountOwed[msg.sender] = 0;
        payable(msg.sender).transfer(amountOwed[msg.sender]);
    }

    function updateAmountOwed() internal {

    }
}
