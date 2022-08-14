//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// gave it stupid name because the tests dont look at the file type
contract Fomo3dsol {
    uint totalTickets;
    uint currPrice;
    address lastPurchaser;
    uint endTime;
    uint startTime;
    mapping (address => uint) ownerToTix;
    mapping (address => uint) amountOwed;

    // use variable where you can for ez stack management


    function buyTickets() public payable {
        if (endTime < block.timestamp) {
            if (startTime < block.timestamp) {
                // if startTime is in the past, then the tix havent been claimed yet
                payable(lastPurchaser).transfer(address(this).balance);
                startTime = block.timestamp + 1 hours;
                endTime = startTime + 24 hours; //could also be endTime = block.timestamp + 25 hours
            }
        } else {
            //seems excessive and inefficient 
            uint tixBought = msg.value / currPrice;
            ownerToTix[msg.sender] += tixBought;
            endTime += tixBought * 30 seconds;
            totalTickets += tixBought;
            updateAmountOwed();
            updateTixPrice();
            lastPurchaser = msg.sender;
        }
    }

    function updateTixPrice() internal {
        //just steal fomo2d's code for this :)
        // :(
    }

    function claim() public {
        amountOwed[msg.sender] = 0;
        payable(msg.sender).transfer(amountOwed[msg.sender]);
    }

    function updateAmountOwed() internal {
        // most complicated part of the contract
        // and hardest to optimize
    }
}
