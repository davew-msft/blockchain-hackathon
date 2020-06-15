Kerckhoff’s principle states that a cryptosystem should be secured even if everything about the system is publicly known, except the key.


## Byzantine Generals Problem

As an analogy with distributed systems, generals can be considered as nodes, traitors can be considered Byzantine (malicious) nodes, and the messenger can be thought of as a channel of communication between the generals. This problem was solved in 1999 by Castro and Liskov who presented the Practical Byzantine Fault Tolerance (PBFT) algorithm. Later on in 2009, the first practical implementation was made with the invention of bitcoin where the Proof of Work (PoW) algorithm was developed as a mechanism to achieve consensus.

## Front Running

Front running is the process of viewing a transaction and taking advantage of its contents to send a transaction of your own. You need to design around this.  

## DAO Attacks 

The DAO attack is the most infamous of all the Ethereum hacks and resulted in a loss of 3.5 million ether before a hard fork rolled back the hack. The attack was so large that the Ethereum Foundation decided to hard-fork to roll back the transaction that created the hack and return the DAO funds to investors. This highly contentious fork eventually led to the split between Ethereum Classic, which did not fork, and the main Ethereum chain, which did fork. The DAO attack was a complex re-entrancy attack.

Currently, the majority of successful blockchains are secured by hashpower: the computing power behind proof-of-work (PoW) mining. Other blockchains have begun experimenting with proof-of-stake (PoS) and proof-of-authority (PoA), two methods for creating security in the system. Ethereum’s researchers have stated that the network will soon be switching to proof-of-stake.  

proof-of-authority blockchain is similar to a permissioned blockchain. Only nodes with authorized keys can publish blocks, so it is not actually a decentralized system. Proof-of-authority blockchains can produce blocks at a much faster rate than decentralized networks because there is no need for the network to come to consensus or mine blocks.
