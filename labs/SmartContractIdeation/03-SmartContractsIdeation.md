# Solving Our Business Problem with Smart Contracts

## Background

During our Ideation Session you should have a basic use case that we can try to solve with Blockchain.  We can't give you exact instructions on how to solve your use case, but we'll give you some pointers to get you started.  

## General Pointers

* Save and `git commit` your work often.  Simple things like compile errors due to missing braces is not always easy to debug.  With git you can always rollback to a known good state.  
* Try looking at [OpenZeppelin Smart Contracts](https://openzeppelin.com/contracts/) for inspiration and help.  It's best, IMO, to start contract coding by looking at what is available in the open source marketplace.  OpenZeppelin provides contracts that have been tested and audited.  [Here is a list](https://docs.openzeppelin.com/contracts/3.x/)  
* If you haven't already done so, consider looking at our previous lab, [Hack02: Build a Smart Contract using a Defined Use Case](./labs/SmartContractIdeation/02-SmartContractsDefinedUseCase.md), which builds a smart contract using a contrived use case.  This should show you the patterns to get started.  

## Getting Started

Make sure you have followed the steps in [EnvironmentSetup.md](EnvironmentSetup.md)

* Ctl+Shft+P:  `Blockchain: New Solidity Contract`
* `Create basic project`
* give it a path.  Make sure it is in a folder that is NOT part of an existing git repo.  I'm using `solidity-contract`
* the project will take a few mins to create
* You should see something like this in your explorer pane:
![](../../img/sc.png)

This is our smart contract code template with all of the supporting files.  Take a minute to familiarize yourself with the contents of the folder.  

Find your Solidity template contract.  It's likely called `HelloBlockchain.sol`.  Open that file in your editor. 

## Let's make changes to solve our business problem -- Things to Consider

We will modify HelloBlockchain.sol  

We need to think about the following:

* States
* Actors
* Functions
* Events

### States

* Either add a new `enum` or modify the existing 
* what properties will you need?
* Note the Solidity types that you can use for these props

### Actors

* these are the entities that can interact with your blockchain
* Who are the actors that you need?  

### Functions

* Look at the existing functions and how they interact.  What functions will you need?  
* Start with the basics.  Simple `echo` style workflows and functions are the best way to start

### Events

* Is the existing event acceptable for the initial deployment?  

## Build, Deploy, Test

Make sure you build, deploy, and test using the methods you learned so far during the workshop!!