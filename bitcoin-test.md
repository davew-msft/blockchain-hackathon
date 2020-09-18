
## Send a test transaction to the Bitcoin test network

This hack is still wip.


This is a "hello world" example to program a bitcoin dapp.  We use the test network b/c it's free but we could easily spin up a single node container using Docker.  

We use the `bitcoinjs` javascript library to prepare the transaction.  A bitcoin transaction is really just a peer-to-peer payment, there is no smart contract capability, so this is probably the simplest possible dapp.  

Perform the following steps in a new, empty folder.  This is written for bash/ubuntu/wsl, you may need to alter this code to run in Windows.  

```bash
mkdir -p bc-hello-world
cd bc-hello-world

npm init

let’s create an entry point for our application, index.js, and custom
JavaScript module to call the bitcoinjs library functions btc.js. Import btc.js
in the index.js.


npm install --save bitcoinjs-lib

273

Then, in our Bitcoin module btc.js, we will initialize the bitcoinjs
library using the require keyword:
var btc = require('bitcoinjs-lib');

The network to target : We are using the Bitcoin test
network.
var network = btc.networks.testnet;

The public node API endpoint to get and post
transactions : We are using the Block Explorer API for
Bitcoin test network. Note that you can replace this API
endpoint with your preferred one.
var blockExplorerTestnetApiEndpoint =
'https://testnet.blockexplorer.com/api/';

now we need to simulate SteveSender and RitaReceiver "user" accounts.  We create random keypairs for those users on the test network:

var getKeys = function () {
var aliceKeys = btc.ECPair.makeRandom({
network: network
});
var bobKeys = btc.ECPair.makeRandom({
network: network
});
var alicePublic = aliceKeys.getAddress();
var alicePrivate = aliceKeys.toWIF();
var bobPublic = bobKeys.getAddress();
var bobPrivate = bobKeys.toWIF();
console.log(alicePublic, alicePrivate, bobPublic,
bobPrivate);
};

first, SteveSender needs to own some bitcoins.  In the test network no real money is used, but we still need some bitcoin and wallets to store them in.  On the internet you can find many "Bitcoin testnet faucets", literally firehoses spraying out free bc, but only valid for testnet.  (You could also host your own testnet node and mine them yourself.)

 the value in
the bobPublic variable is Bob’s Bitcoin testnet address. When we ran this
snippet, it generated “msDkUzzd69idLLGCkDFDjVRz44jHcV3pW2” as Bob’s
Chapter 5 BloCkChain appliCation Development
276
address. It is also Bob’s base 58 encoded public key.

We will submit this
value in one of the testnet faucet web forms and in return we will receive
a transaction ID. If we look up that transaction ID on any of the Bitcoin
testnet explorers, we will see that some other address has sent some test
Bitcoins to Bob’s address we submitted in the form

ow that we know that we have some test Bitcoins in Bob’s wallet, we can
spend them and give them to Alice through a Bitcoin transaction. 

You can spend your unspent outputs by adding them as inputs
to the transactions where you want to spend them. To do that, first you
need to query the network about the sender’s unspent outputs. Here’s how
we will do that for Bob’s Bitcoin testnet address using the block explorer
API. To get the unspent outputs, we will send an HTTP request to the UTXO
endpoint with Bob’s address "msDkUzzd69idLLGCkDFDjVRz44jHcV3pW2".

var getOutputs = function () {
var url = blockExplorerTestnetApiEndpoint + 'addr/' +
msDkUzzd69idLLGCkDFDjVRz44jHcV3pW2 + '/utxo';
return new Promise(function (resolve, reject) {
request.get(url, function (err, res, body) {
if (err) {
reject(err);
}
resolve(body);
});
});
};


The response body returned by the call is a JSON array with two
objects. Each of these objects represents an unspent output for Bob. Each
output has txid, which is the transaction ID where this output is listed, the
amount associated with output, and the vout, which means the sequence
or index number of the output in that transaction. There is some other
information in the JSON objects too, but that will not be used in the
transaction preparation process.

Now we want to send some of this to RitaReceiver.  We will prepare the transaction which is simply defining the inputs, outputs, and amount.

We need to parse the response we received from the previous command.  You will likely need to change your code based on your unique outputs:

var utxo = JSON.parse(body.toString());
var transaction = new btc.TransactionBuilder(network);
transaction.addInput(utxo[0].txid, utxo[0].vout);

Basically, we are defining what we want to spend and where we got it
from.

Next, we add the transaction outputs. This is where we say how we
want to spend what we added in the input.  Again, you will need to change your code probably

transaction.addOutput(alicePublic, 99990000);
While we have used only one input and one output in this example
transaction, a transaction can have multiple inputs and outputs. An
important thing to note is that the total amount in inputs should not be
less than the total amount in outputs. Most of the time, the amount in
inputs is slightly more than the amount in outputs, and the difference is
the transaction fee offered to the miners to include this transaction when
they mine the next block.

In this transaction, we have 2,000 satoshis as the transaction fee,
which is the difference between input amount (99992000) and the output
amount (99990000). Note that we don’t have to create any outputs for the
transaction fee; the difference between the input and output total amounts
is automatically taken as the transaction fee.

Also, note that we cannot spend partial unspent outputs. If an unspent
output has x amount of Bitcoins associated with it then we must spend
all of the x Bitcoins when adding this unspent output as an input in a
transaction. So, in case Bob doesn’t want to give all the 99,990,000 satoshis
associated with his unspent output to Alice, then we need to give it back to
Bob by adding another output to the transaction with an amount equal to
the difference of total unspent amount and the amount Bob wants to give
to Alice.  Think of it as "debits=credits".  Remember, there is no state or account balances in bitcoin.  

Now, that we have defined the inputs and outputs in the transaction, we
need to sign the inputs using Bob’s keys. 

transaction.sign(0, bobKeys);


Now we will create a hex string from the transaction object.
var transactionHex = transaction.build().toHex();
The output of this line of code is the following string, which represents
our prepared transaction; this step is needed because the send transaction
API accepts the raw transaction as a string.

Finally, we use the hex string value we generated in the last step and send
it to the block explorer public testnet node using the API,
var txPushUrl = blockExplorerTestnetApiEndpoint + 'tx/send';
request.post({
url: txPushUrl,
json: {
rawtx: transactionHex
}
}, function (err, res, body) {
if (err) console.log(err);
console.log(res);
console.log(body);
});

If the transaction is accepted by the block explorer public node, we will
receive a transaction ID as the response of this API call,

Now that we have the transaction ID of our transaction, we can look it
up on any of the online testnet explorers to see if and when it gets mined
and how many confirmations it has.


var createTransaction = function (aliceKeys, bobKeys) {
getOutputs(bobKeys.getAddress()).then(function (res) {
var utxo = JSON.parse(res.toString());
var transaction = new btc.TransactionBuilder(network);
transaction.addInput(utxo[0].txid, utxo[0].vout);
transaction.addOutput(alicekeys.getAddress(),
99990000);
transaction.sign(0, bobKeys);
var transactionHex = transaction.build().toHex();
var txPushUrl = blockExplorerTestnetApiEndpoint +
'tx/send';
request.post({
url: txPushUrl,
json: {
rawtx: transactionHex
}
}, function (err, res, body) {
if (err) console.log(err);
console.log(res);
console.log(body);
});
});
};

```