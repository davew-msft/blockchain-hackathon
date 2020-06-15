Ethereum is both a protocol and a platform, but not a framework.

* proof of work algo is called Ethash.  Input is block header which is a randomly generated number called the nonce.  Output is 32 byte hex number.  
* For the network to accept a mined block, the Ethash output for the block header must be less than the network difficulty, another 32-byte hex number that acts as a target to be beaten. Any miner who broadcasts a block that beats the target difficulty receives a block reward. The block reward is awarded by including a coinbase transaction in the block. The coinbase transaction is usually the first transaction in the block and sends the block reward to the miner. The current block reward since the Byzantium hard fork is 3 ether
* A transaction sends ether, deploys a smart contract, or executes a function on an existing smart contract.
* Transactions consume `gas`, an Ethereum measurement unit that determines the complexity and network cost of a code operation. The gas cost of a transaction is used to calculate the transaction fee. 
* Geth is the official Go implementation of the Ethereum protocol. It is the most up-to-date Ethereum client (as of 2018) and serves as the reference client for all Ethereum updates. 
* Ethereum main network (mainnet) and the Rinkeby test network (testnet). 
* The modular unit of Solidity code is the contract. A contract works similarly to a class in classical programming. Contracts can inherit from one another, and modifiers can be used to mix in functionality
* unspent transaction outputs (UTXOs)
  * The Ethereum accounts, unlike Bitcoins, are not in the form of unspent transaction outputs (UTXOs). 
  * Bitcoins are actually present in the form of transactions that have an owner (owner’s public key, 20-byte address) and a value. The owner can spend the transaction if they have the valid private key for the transaction they are trying to spend. Bitcoin therefore is a state transition system where “state” refers to the collection of all UTXOs. Every time a block is mined, a state change happens because each block contains a bunch of transactions where each transaction consumes UTXO(s) and produces UTXO(s). Note here that the state is not encoded inside the blocks. So, there is no notion of an account balance as such in Bitcoin’s design. 
  * Ethereum on the other hand is stateful, and its basic unit is the account. Each account has a state associated with it and also has a 20-byte (160 bits) address through which it gets identified and referenced. The purpose of blockchain in Ethereum is to keep track of the state changes. 
* In Ethereum, there are two more Merkle roots, so there are three Merkle roots.  

## Problems with ethereum:

Can it cope with scale?  Crypto kiddies have caused the network to congest when it shouldn't have.  
