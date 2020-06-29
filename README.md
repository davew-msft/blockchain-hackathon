# Blockchain Hackathon

## Abstract

Companies in every industry are building blockchain applications and asking their business partners to integrate with them.  Are you ready to build a blockchain application when your CEO comes asking?  Blockchain is transforming forward-thinking companies.  Now is the time to understand the technology and build a strategy. 

This is a full day session geared to both business leaders and technologists.  We begin by briefly discussing what blockchain is and what are good and bad use cases.  We will split into teams to discuss a business use case applicable to any industry.  The remainder of the day will be hacking and coding our solution, geared to developers and data professionals.  

**This is a hands-on hackathon.  You will need a computer with the ability to install software (linux, mac, windows is acceptable).  You do not need to have previous blockchain or coding experience.  You will also need access to an Azure subscription to spin up the blockchain solution.**

(If you would like a general introduction to blockchain please see [our Blockchain wiki](./wiki/README.md) which contains our notes).  You can refer to this if you questions about some of the topics during the hackathon.  

## Hackathon Objectives

We hope at the end of the day you'll learn the following:

* Understand the basics of blockchain (the technology is changing so fast that few people are experts)
* Understand good and bad use cases for blockchain by ideating as small team over some problems you may be facing today.  
* build a devenv for Smart Contract development 
* Understand the technologies underlying the Azure Blockchain portfolio
* Build a little blockchain app, using common patterns, that attempts to solve the problems you ideated over.  

## **Getting Your Environment Setup**

**Please follow the instructions on [EnvironmentSetup.md](EnvironmentSetup.md).  You may want to start doing this immediately.  Installing software can take valuable time away from hacking.**

## Agenda TODO

* [Presentation:  "What is blockchain"](./01-what-is-blockchain.pptx)
* [Presentation:  "What is Azure Blockchain"](./02-azure-blockchain.pptx)
* [Ideation Workshop](./03-Blockchain-Ideation.pptx)
* [Setup Your Hacking Environment](EnvironmentSetup.md)
  * Hopefully the setup is done by now, if not you need to complete the devenv setup before continuing.
* [Hack:  Creating Smart Contracts](./labs/SmartContractIdeation/SmartContracts.md)
  * In this hack we will build a smart contract solution using Azure Blockchain and supporting services that meets the business requirements you determined during the Ideation phase of this workshop.  
  * If you get stuck or need assistance, let us know.  
  * If you want some practice before diving in and building a smart contract from scratch, consider the Optional Hacks.  

## Optional Hacks
These are optional hacks you can do to get a deeper understanding of some of the core concepts we discussed today. If you are getting overwhelmed designing your Smart Contract from scratch, try some of these challenges first.  

* [Optional Hack 00: Hello Blockchain](./labs/00-hello-blockchain/README.md) 
  * This is a "Hello World" application for Azure blockchain.  It doesn't get more basic than this.  
* [Optional Hack 01: Send Transactions to the Bitcoin Network](bitcoin-test.md)
  * This "challenge" is optional.  We learn how to send transactions to the bitcoin network.
  * The bitcoin network is very different from Ethereum or other blockchains, specifically in how UTXOs are handled.  The lab is meant to help you understand the differences in implementation.  
* [Optional Hack 02: Building a Private Blockchain with Docker and Ethereum](PrivateBlockchain.md)
  * Building a private blockchain from scratch is a great way for a developer to understand more deeply the inner workings of some of these core concepts.  
  * This hack is geared to attendees that do not have access to Azure Blockchain.  
* [Optional Hack 03: Hyperledger Smart Contract Serverless Development using Hyperledger Composer](03-hyperledger-composer.md)
  * Build a smart auction using Hyperledger Composer in a web brower.  
  * This is a great way to understand, declaratively, how to build a smart contract with the associated transactions and parties, without getting mired in implementation details.  
* [Optional Hack 04: Interact with the Ropsten Ethereum Test Network by building a Smart Contract](04-ethereum-test.md)

## Resources

* [Our Blockchain Wiki](./wiki/README.md)
* [Azure Blockchain documentation](https://aka.ms/absdocs)
* BlockTalk episodes for developers
  * https://aka.ms/BTdeploybc
  * https://aka.ms/BTdevexp
  * https://aka.ms/btinbound
  * https://aka.ms/btoutbound
* [Azure Blockchain blog](https://azure.microsoft.com/en-us/blog/topics/blockchain/)
* [Azure Blockchain samples](https://aka.ms/bcsampleapps)
* [Logic Apps Integration](https://aka.ms/bclogicappshome)
* [DevOps for Blockchain](https://aka.ms/bcdevops)
* [Azure Blockchain Developer Kit](https://aka.ms/abdevkit)
* [Using Hyperledger Fabric on AKS](https://azure.microsoft.com/en-us/blog/hyperledger-fabric-on-azure-kubernetes-service-marketplace-template/)
* [MTC Blockchain-in-a-Day Workshop](https://github.com/microsoft/MTC_BlockchainAppinaDay)
* [Azure Blockchain Samples](https://github.com/Azure-Samples/blockchain)