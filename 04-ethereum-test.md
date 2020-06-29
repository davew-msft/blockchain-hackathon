TODO, not complete


In this section we will learn how to
programmatically interact with the Ethereum blockchain using JavaScript

we will be using the Ropsten test network for
Ethereum blockchain.
For simplicity, we will again use a public-hosted test network node for
Ethereum so that we don’t have to host a local node while running these
code snippets. However, all snippets should work with a locally hosted
node as well. We are using the Ethereum APIs provided by the Infura
service. Infura is a service that provides public-hosted Ethereum nodes so
that developers can easily test their Ethereum apps. There is a small and
free registration step needed before we can use the Infura API, so we will
go to https://infura.io and do a registration. We will get an API key after
registration. Using this API key, we can now call the Infura API

npm install web3@1.0.0-beta.28

var Web3 = require('web3');

var web3 = new Web3(new Web3.providers.HttpProvider('https://
ropsten.infura.io/<your Infura API key>'));

thereum does not use the UTXO
model but it uses an account and balances model.
Basically, the Ethereum blockchain manages state and assets in terms
of accounts and balances just like banks do. There are no inputs and
outputs here. You can simply send Ether from one account to another and
Ethereum will make sure that the states are updated for these accounts on
all nodes.

We need 2 Ethereum accounts, SallySender and RitaReceiver
var createAccounts = function () {
var aliceKeys = web3.eth.accounts.create();
console.log(aliceKeys);
var bobKeys = web3.eth.accounts.create();
console.log(bobKeys);
};

For this example, we submitted Alice’s address that we generated in the
previous code snippet to an Ethereum Ropsten test network faucet and we
received three ethers on that address.


After receiving Ether on Alice’s address, let’s check the balance of this
address to confirm if we really have the Ether or not. Though we can check
the balance of this address using any of the Ethereum explorers online,
let’s do it using code. The following code snippet calls the getBalance
function passing Alice’s address as input parameter.
var getBalance = function () {
web3.eth.getBalance('0xAff9d328E8181aE831Bc426347949
EB7946A88DA').then(console.log);
};

Recall that there are no
inputs and outputs and UTXO queries to be done in the case of Ethereum
because it uses an account and balances-based system. So, all that we
need to do in the transaction is to specify the “from” address (the sender’s
address), the “to” address (the recipient address), and the amount of Ether
to be sent, among a few other things.

Also, recall that in the case of a Bitcoin transaction we did not have
to specify the transaction fee; however, in the case of an Ethereum
transaction we need to specify two related fields. One is gas limit and the
other is gas Price

{
from: "0xAff9d328E8181aE831Bc426347949EB7946A88DA",
gasPrice: "20000000000",
gas: "42000",
to: '0x22013fff98c2909bbFCcdABb411D3715fDB341eA',
value: "1000000000000000000",
data: ""
}

we will use Alice’s
private key to sign the transaction. This is to cryptographically prove that it
is actually Alice who is spending the Ether in her account.

var signTransaction = function () {
var tx = {
from: "0xAff9d328E8181aE831Bc426347949EB7946A88DA",
gasPrice: "20000000000",
gas: "42000",
to: '0x22013fff98c2909bbFCcdABb411D3715fDB341eA',
value: "1000000000000000000",
data: ""
};
web3.eth.accounts.signTransaction(tx, '0x9fb71152b32cb
90982f95e2b1bf2a5b6b2a53855eacf59d132a2b7f043cfddf5')
.then(function(signedTx){
console.log(signedTx.rawTransaction);
});
};

In the output of the signTransaction function we receive a
JSON object with a few properties. The important value for us is the
rawTransaction value. This is the hex string representation of the signed
transaction.

The final step is to just send this signed raw transaction to the public-
hosted Ethereum test network node

web3.eth.sendSignedTransaction(signedTx.rawTransaction).
then(console.log);

The output has a lot of information, as we can see. The most important
part is the transactionHash, which is the ID of the transaction on the
network. It also gives us the blockHash, which is the ID of the block
in which this transaction was included. 

 If the gas used is less than the maximum gas we specified
during transaction creation, the remaining gas is sent back to the sender’s
address.


In this section, we will continue our Ethereum programming exercise, and
we will create a simple smart contract on the Ethereum blockchain using
the same web3 JavaScript library and the Infura service API.
Because, no computer programming beginners’ tutorial is complete
without a “Hello World” program, the smart contract we are going to create
will be a simple smart contract returning the string “Hello World” when called.

Ethereum smart contracts are written in
Solidity programming language. While the web3 JavaScript library will
help us deploy our contract on the Ethereum blockchain, we will still have
to write and compile our smart contract in Solidity before we send it to the
Ethereum network using web3.

There is also a web-based Solidity editor called Remix. It’s
available for free to use at https://remix.ethereum.org/. Remix provides
a very simple interface to code and compile smart contracts within your
browser. 

pragma solidity ^0.4.0;
contract HelloWorld {
string message;
function HelloWorld(){
message = "Hello World!";
}
function Hello() constant returns (string) {
return message;
}
}

When we click the Create button,
this contract is created using the selected account in the JavaScript VM
environment.

At this point, we have a simple “Hello World” smart contract ready,
and now the next step is to deploy it programmatically to the Ethereum
blockchain.

Let’s first get some details about our smart contract from Remix, which will
be needed to deploy the contract to the Ethereum network using the web3
library. Click on the Compile tab in the right-side menu and then click the
Details button. This pops up a new child window with details of the smart
contract. What’s important for us are the ABI and the BYTECODE sections
on the details popup window.
Let’s copy the details in the ABI section using the copy value to
clipboard button available next to the ABI header. Following is the value of
the ABI data for our smart contract.

As we can see, the data in the BYTECODE section is a JSON object.
This is basically the output of the compilation of the smart contract. Remix
compiled our smart contract using the Solidity compiler and as a result
we got the solidity byte code. Now closely examine this JSON and look at
the “object” property and its value. This is a hex string that contains the
byte code for our smart contract, and we will be sending it in the contract
creation transaction in the data field—the same data field that we left blank
in the previous example Ethereum transaction between Alice and Bob.
Now we have all the details for our smart contract and we are ready to
send it to the Ethereum network.