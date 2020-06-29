# Creating Smart Contracts

## Background

We use the Truffle Suite under-the-covers in vscode to develop smart contracts in Ethereum with Azure. Remember: Before choosing the implementation language, one has to design the flow and develop conditions. You should have a basic understanding of this from our ideation session.  

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

### Deploy HelloBlockchain locally

We want to test that minimally our devenv is working and we can do local development.  

* Right click the sol file and choose Deploy.  There should be an entry for `development`
* If you want to see what this is doing just `Ctl+`` (ctl + backtick) and select `Output` and `Azure blockchain`.  You should see the commands and the success message.  
* At this point we can send test transactions to our local truffle network.  Right click the sol file again and `Show Smart Contract Interaction Page.`

## Deploy the Smart Contract to ABS

Let's deploy our HelloBlockchain to ABS.  

Right click `Deploy Contracts`.  This time choose your Azure Blockchain Service.  

If you see an error like this...

![](../../img/err1.png)


```
[Execute command] Error:  *** Deployment Failed ***

"Migrations" -- method handler crashed.
```

...then we have an older version of truffle and ganache.  

>>FIX:  Open your truffle-config.js and remove the line that reads:
>>```gas: 0,```   
>> then redeploy.  

![](../../img/err2.png)

Let's add 2 add'l functions to our solidity file:

```
    function getRequestMessage() public view returns (string memory) {
        return RequestMessage;
    }
    function getResponseMessage() public view returns (string memory) {
        return ResponseMessage;
    }
```

**Paste those lines BEFORE the closing } of the contract**

* Right click the sol file and click `Build Contracts`
* This should create a `build/contracts` folder.  Familiarize yourself a bit with the resulting build files.  
* Right click the sol file and click `Deploy`
  * You should have at least 2 options for the target:  `development` and `Azure Blockchain`.  Choose `development`

>> There is a bug with truffle where this may fail with 

npx truffle migrate --reset -network abs_davewconsortium_davewentzel_davewentzel

truffle console --network abs_davewconsortium_davewentzel_davewentzel