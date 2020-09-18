## Refrigerated Transport Sample Smart Contract Application

### Overview

We've discussed this use case already as part of the hackathon.  This is a typical "provenance" scenario where I want to use IoT to monitor if my product has been stored and transported within tolerances and has not spoiled.  If the measurements fall out of comnpliance then we want to note that contract state on the blockchain.  

### Personas/Application Roles

| Name                   | Description                                       |
|------------------------|---------------------------------------------------|
| InitiatingCounterParty | The first participant in the supply chain. This party defines the humidity and temp range the measurement must fall within to be compliant.  Otherwise we are `OutofCompliance`.         |
| Counterparty           | Any party that has responsibility for the product. The counterparties will have the ability to write to the blockchain. |
| Device                 | A device used to monitor the temperature and humidity of the environment 
| Owner                  | The organization that owns the product being transported. The manufacturer |
| Observer               | Any individual or organization monitoring the supply chain. Examples:  government agencies, consumers, other counterparties. |


All participants can view the state and details of the contract at any point in time. The counterparty doing the transportation will specify the next counterparty responsible, and the device will ingest temperature and humidity data, which gets written to the chain. This allows the Owner and Observer to pinpoint which counterparty did not fulfill the compliance regulations if at any point in the process either the temperature or humidity requirements were not met.   


### States 


| Name                   | Description                                       |
|------------------------|---------------------------------------------------|
|Created |Indicates that the contract has initiated and tracking has begun. |
|InTransit |Indicates that a Counterparty currently is in possession and responsible for goods being transported.|
|Completed |Indicates the product has reached it's intended destination. It may not necessarily still be in-compliance.| 
|OutOfCompliance|Indicates that the agreed upon terms for temperature and humidity conditions were not met at some point before the `Completed` state.|

### Workflow Details

There are many possible flows and various transition functions as we move from state to state.  Further, each user should only be allowed to take certain actions depending on their role, and a counterparty's role may change as the state of the system changes.  

We need to build a contract that demonstrates how to enforce contract specifics via monitoring (in this case via IoT telemetry, but that isn't always the case).  

Let's determine the remaining the requirements as we begin coding the solution

## Create a new Solidity Project

* Create a New Solidity Project in vscode called `transport`.
  * if using the docker container be sure to:
```bash
cd /workspaces
mkdir transport
```
  * then <kbd>F1</kbd>, `Blockchain: New Solidity Project` and point it to `workspaces/transport`
* this will create the standard HelloBlockchain.sol file
* rename the file to `Transportation.sol`
* rename the contract to `Transportation` in the sol file `contract Transportation`

>> At this point the deployment will fail because we haven't yet given the instructions on how to deploy our solidity contract.  Look at the two files in the `migrations` folder.  Notice that there is an initial migration (deployment) file and a "deploy contracts" file.  This file needs to be changed wince our contract changed.  Consider changing it, for now, to this:

```javascript
var Transportation = artifacts.require("Transportation");
var Arg = "Hello world";
module.exports = deployer => {
    deployer.deploy(Transportation, Arg);
};
```
  * ensure you can build it, deploy it locally, and deploy to ABS
  * double check for any build errors
  * You can also verify that `build/contracts/Transportation.json` exists



We haven't actually changed any code yet.  We just want to ensure the tooling is working and we can deploy a shell contract called Transportation.  You will again likely need to change the `pragma` on Line 1. 

>>[Here is my finished sol file for reference](./Transportation.sol)

## Code the Contract

>>[Here is my finished sol file for reference](./Transportation.sol) in case you get lost.  

Using our HelloBlockchain code as a reference, let's make some changes to match our requirements.

* We need our states to match our requirements.  Please change the relevant code to:

```
    //Set of States
    enum StateType { Created, InTransit, Completed, OutOfCompliance}
    enum SensorType { None, Humidity, Temperature }
```

Here's the list of properties I think we'll need, make the necessary changes to the boilerplate:

```
    //List of properties
    StateType public  State;
    address public  Owner;
    address public  InitiatingCounterparty;
    address public  Counterparty;
    address public  PreviousCounterparty;
    address public  Device;
    address public  SupplyChainOwner;
    address public  SupplyChainObserver;
    int public  MinHumidity;
    int public  MaxHumidity;
    int public  MinTemperature;
    int public  MaxTemperature;
    SensorType public  ComplianceSensorType;
    int public  ComplianceSensorReading;
    bool public  ComplianceStatus;
    string public  ComplianceDetail;
    int public  LastSensorUpdateTimestamp;
```

>> `address` in this case is the ethereum blockchain address needed for counterparty hand-off

Let's modify the `constructor` which is the basis for all new contracts.  This should cover the base use case:

```
    constructor(address device, address supplyChainOwner, address supplyChainObserver, int minHumidity, int maxHumidity, int minTemperature, int maxTemperature) public
    {
        ComplianceStatus = true;
        ComplianceSensorReading = -1;
        InitiatingCounterparty = msg.sender;
        Owner = InitiatingCounterparty;
        Counterparty = InitiatingCounterparty;
        Device = device;
        SupplyChainOwner = supplyChainOwner;
        SupplyChainObserver = supplyChainObserver;
        MinHumidity = minHumidity;
        MaxHumidity = maxHumidity;
        MinTemperature = minTemperature;
        MaxTemperature = maxTemperature;
        State = StateType.Created;
        ComplianceDetail = "N/A";
    }
```

### Functions

We'll need at least 3 functions to accomplish an MVP for this smart contract:

* a function to ingest the telemetry onto the blockchain
* a function to transfer the responsibility of the item to the next counterparty on the chain
* a function to say the contract is complete, the product arrived at its destination and the contract was in compliance the entire time

Here are the functions that you can add to your smart contract:

```
    function IngestTelemetry(int humidity, int temperature, int timestamp) public
    {
        // Separately check for states and sender 
        // to avoid not checking for state when the sender is the device
        // because of the logical OR
        if ( State == StateType.Completed )
        {
            revert();
        }

        if ( State == StateType.OutOfCompliance )
        {
            revert();
        }

        if (Device != msg.sender)
        {
            revert();
        }

        LastSensorUpdateTimestamp = timestamp;

        if (humidity > MaxHumidity || humidity < MinHumidity)
        {
            ComplianceSensorType = SensorType.Humidity;
            ComplianceSensorReading = humidity;
            ComplianceDetail = "Humidity value out of range.";
            ComplianceStatus = false;
        }
        else if (temperature > MaxTemperature || temperature < MinTemperature)
        {
            ComplianceSensorType = SensorType.Temperature;
            ComplianceSensorReading = temperature;
            ComplianceDetail = "Temperature value out of range.";
            ComplianceStatus = false;
        }

        if (ComplianceStatus == false)
        {
            State = StateType.OutOfCompliance;
        }
    }

    function TransferResponsibility(address newCounterparty) public
    {
        // keep the state checking, message sender, and device checks separate
        // to not get cloberred by the order of evaluation for logical OR
        if ( State == StateType.Completed )
        {
            revert();
        }

        if ( State == StateType.OutOfCompliance )
        {
            revert();
        }

        if ( InitiatingCounterparty != msg.sender && Counterparty != msg.sender )
        {
            revert();
        }

        if ( newCounterparty == Device )
        {
            revert();
        }

        if (State == StateType.Created)
        {
            State = StateType.InTransit;
        }

        PreviousCounterparty = Counterparty;
        Counterparty = newCounterparty;
    }

    function Complete() public
    {
        // keep the state checking, message sender, and device checks separate
        // to not get cloberred by the order of evaluation for logical OR
        if ( State == StateType.Completed )
        {
            revert();
        }

        if ( State == StateType.OutOfCompliance )
        {
            revert();
        }

        if (Owner != msg.sender && SupplyChainOwner != msg.sender)
        {
            revert();
        }

        State = StateType.Completed;
        PreviousCounterparty = Counterparty;
        Counterparty = 0x0000000000000000000000000000000000000000;
    }

```

Place the above functions at the correct place in the sol file.  

We still can't compile and deploy yet because we haven't told truffle how to deploy the contract.  Open `2_deploy_contracts.js`.  Remember, we modified this earlier.  We need to modify it again because we changed the signature of the constructor.  Consider changing it to something like this:

```javascript
var Transportation = artifacts.require("Transportation");
// the address below are just something random for now
var device = "0xfe548cC67E405211C7eC1D3824cE32304b03748A";
var supplyChainOwner = "0xfe548cC67E405211C7eC1D3824cE32304b03748A";
var supplyChainObserver = "0xfe548cC67E405211C7eC1D3824cE32304b03748A";
var minHumidity = 0;
var maxHumidity = 100;
var minTemperature = 0;
var maxTemperature  = 100;
module.exports = deployer => {
    deployer.deploy(Transportation, device,supplyChainOwner,supplyChainObserver,minHumidity,maxHumidity,minTemperature,maxTemperature);
};


```

* Compile your contracts
* Deploy your contracts locally
* Deploy your contracts to ABS
* You can now interact with your Smart Contract from vscode, Logic Apps, Power Apps, or the truffle CLI.  

