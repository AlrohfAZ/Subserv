//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Subserv {
    // The address of the owner of this contract
    address public contractOwner;

    // The address of the subscriber
    address public subscriber;

    // The start date of the subscription
    uint256 public startDate;

    // The end date of the subscription
    uint256 public endDate;

    // The amount of money charged for the subscription
    uint256 public price;

    // The status of the subscription
    enum Status {
        Active,
        Inactive
    }

    // The status of the subscription
    Status public status;

    constructor() {
        contractOwner = msg.sender;
        status = Status.Inactive;
    }

    //onlyOwner modifier to check the owners address
    modifier onlyOwner() {
        require(msg.sender == contractOwner);
        _;
    }

    // Function to subscribe to the service for a month
    function oneSub() public payable onlyOwner {
        // Check if the subscription is already active
        require(status == Status.Inactive);

        // Set the start date of the subscription
        startDate = block.timestamp;

        // Set the end date of the subscription
        endDate = startDate + 30 days;

        // Set the status of the subscription to active
        status = Status.Active;

        // Transfer the money from the subscriber to the owner
        payable(contractOwner).transfer(msg.value);
    }

    // Function to subscribe to the service for a month
    function sixSub() public payable onlyOwner {
        // Check if the subscription is already active
        require(status == Status.Inactive);

        // Set the start date of the subscription
        startDate = block.timestamp;

        // Set the end date of the subscription
        endDate = startDate + 180 days;

        // Set the status of the subscription to active
        status = Status.Active;

        // Transfer the money from the subscriber to the owner
        payable(contractOwner).transfer(msg.value);
    }

    // Function to subscribe to the service for a month
    function yearSub() public payable onlyOwner {
        // Check if the subscription is already active
        require(status == Status.Inactive);

        // Set the start date of the subscription
        startDate = block.timestamp;

        // Set the end date of the subscription
        endDate = startDate + 365 days;

        // Set the status of the subscription to active
        status = Status.Active;

        // Transfer the money from the subscriber to the owner
        payable(contractOwner).transfer(msg.value);
    }

    // Function to unsubscribe from the service
    function unsubscribe() public onlyOwner {
        // Check if the subscription is active
        require(status == Status.Active);

        // Set the status of the subscription to inactive
        status = Status.Inactive;
    }

    // Function to get the status of the subscription
    function getStatus() public view returns (Status) {
        return status;
    }
}
