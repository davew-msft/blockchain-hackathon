# Creating Smart Contracts

## Background

For this hack we are going to build a `Hello World` -style application so you understand the basic workflow to build a _very_ simplistic smart contract dapp.  

We use the Truffle Suite under-the-covers in vscode to develop smart contracts in Ethereum with Azure. 

Remember: Before choosing the implementation language, one has to design the flow and develop conditions. You should have a basic understanding of this from our ideation session.  

## Getting Started

This is a good lab to ensure your environment is working.  

Make sure you have followed the steps in [EnvironmentSetup.md](EnvironmentSetup.md)

Whenever you create a new blockchain project:  

* Open vscode 
  * If using the remote container for development, ensure you are working from within that spawned vscode instance which denotes in the lower left that you are running against the container

![](../../img/vscode8.png)

* ctl + shft + P:  `Blockchain:  show welcome page` 
  * this will start all of the extensions and ensure all software is in a working state
* ctl + shft + P:  `Terminal: Create New Integrated Terminal`
  * `mkdir solidity-contract`
* Ctl+Shft+P:  `Blockchain: New Solidity Contract`
* `Create basic project`
* when it asks for the folder choose the folder and path you created above (likely:  `/workspaces/blockchain-hackathon/solidity-contract/`)
* the project will take a few mins to create
>> If you want to see what this is doing just select `Output` at the bottom of vscode and `Azure blockchain`. :

![](../../img/vscode6.png)

  

* when completed you should see something like this in your explorer pane:  

![](../../img/sc.png)

This is our smart contract code template with all of the supporting files.  Take a minute to familiarize yourself with the contents of the folder.  

Find your Solidity template contract.  It's likely called `HelloBlockchain.sol`.  Open that file in your editor. 

>> All new solidity projects start with this HelloBlockchain solidity file.  In later labs we will modify the name of the smart contract so it reflects its purpose

Take a few minutes to get familiar with what this solidity contract does.  
* This does a simple request/response workflow.  

### Deploy HelloBlockchain locally

We want to test that minimally our devenv is working and we can do local development.  

* Right click the sol file and choose `Build contracts`.  Make sure there are no problems (errors) in the output.  
* Right click the sol file and choose Deploy.  There should be an entry for `development`
* If you want to see what this is doing just `Ctl+~` (ctl + backtick(above TAB on most kbds)) and select `Output` and `Azure blockchain`.  You should see the commands and the success message.  
  * Take a minute to get familiar with what a deploy is doing by reading the output messages.  
* At this point we can send test transactions to our local truffle network.  Right click the sol file again and `Show Smart Contract Interaction Page.`

>> As of the writing of this workshop the Smart Contract Interaction Page only works on Windows (not the Ubuntu container).  That's ok, we will deploy it to Azure next to test it.  

## Deploy the Smart Contract to ABS

Let's deploy our HelloBlockchain to ABS.  

Right click `Deploy Contracts`.  This time choose your Azure Blockchain Service.  

* Choose Generate Mnemonic if asked (this is similar to a password or token)

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


Let's test the contract using the GUI.  
* Right click the contract and choose `Show Smart Contract Interaction Page. 
* You should see something that looks like this:  

![](../../img/vscode7.png)

Take a minute a familiarize yourself with what is going on.  **Make sure you scroll to see the metadata at the bottom. If it crashes don't worry, we have other ways to test our smart contracts.** 

### What is vscode doing?

vscode is just a wrapper around truffle and ganache calls.  You can run these calls yourself by ensuring the OUTPUT window is open and you have `Azure Blockchain` selected.  Here are examples of the calls being made that you might want to experiment with:

```

npx truffle migrate --reset -network <your network name>

truffle console --network <your network name>

```

## Let's make some basic changes to our contract and deploy again

Let's add 2 add'l functions to our solidity file:

```
    function getRequestMessage() public view returns (string memory) {
        return RequestMessage;
    }
    function getResponseMessage() public view returns (string memory) {
        return ResponseMessage;
    }
```

**Paste those lines BEFORE the closing } of the `contract`**

* Right click the sol file and click `Build Contracts`
* This should create a `build/contracts` folder.  Familiarize yourself a bit with the resulting build files.  
* Right click the sol file and click `Deploy`
  * You should have at least 2 options for the target:  `development` and `Azure Blockchain`.  Choose `development`
  * Then choose ABS and test the deployment there

### Let's interact with our contract from the command line

Go to your terminal in vscode and paste:

```
truffle console --network <your abs network name from truffle-config.js>
```

You should see a truffle prompt.  

Now try the following:

```
HelloBlockchain.deployed().then(i => {i.SendRequest("my request")})

# you'll likely see "undefined" as the response since we aren't ACK'ing the message.  We can fix that later.  

HelloBlockchain.deployed().then(i => { return i.RequestMessage.call(); })
# this should return whatever you LAST sent

```

Run `.exit` to exit the truffle console.  

Run `git add .` and `git commit -am"init commit"` to save our Hello World example.  We can use this as a base for the next hacks.  

**Congratulations! You have successfully interacted with a blockchain using the standard ethereum tooling**

