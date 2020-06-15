 blockchain is a data structure that makes it possible to create a digital ledger of data and share it among a network of independent parties. There are many different types of blockchains.

* Public blockchains: Public blockchains, such as Bitcoin, are large distributed networks that are run through a native cryptocurrency. A cryptocurrency is a unique bit of data that that can be traded between two parties. Public blockchains are open for anyone to participate at any level and have open-source code that their community maintains.
* Permissioned blockchains: Permissioned blockchains, such as Ripple, control roles that individuals can play within the network. They’re still large and distributed systems that use a native token. Their core code may or may not be open source.
* Private blockchains: Private blockchains also known as distributed ledger technology (DLT) tend to be smaller and do not utilize a token or cryptocurrency. Their membership is closely controlled. These types of blockchains are favored by consortiums that have trusted members and trade confidential information.  
  * Example:  Hijro.  
  * Private blockchains are great for developers because they allow them to test ideas without using cryptocurrency. The developers’ ideas can remain a secret as well, because the data has not been published publicly. 
  * Large institutions can capitalize on the security and permanence of blockchain technology without their transactions being public the way they are in traditional blockchains.

They all use cryptography to allow each participant on any given network to manage the ledger in a secure way without the need for a central authority to enforce the rules. The removal of central authority from the data structure is one of the most important and powerful aspects of blockchains.

## Trust

Blockchains establish trust in novel ways. **Proof-of-work (POW)** blockchains require miners to have a full and accurate history of their transactions to participate on the network. **Proof-of-stake (POS)** blockchains create trust by requiring nodes that are processing transactions to “stake” some cryptocurrency that may be forfeited if they’re caught defrauding the network. Private blockchains build confidence by distributing data across a network of connected but independent participants that are known by each other and can be held accountable.  


Blockchains that utilize a cryptocurrency can sometimes be called “trustless” systems because the code is enforced by the network (as opposed to a business contract, which is enforced by a court system).

## Consensus

Consensus is the backbone of a blockchain and provides decentralization of control as a result through an optional process known as mining. The choice of consensus algorithm is also governed by the type of blockchain in use. Not all consensus mechanisms are suitable for all types of blockchains. For example, in public permission-less blockchains it would make sense to use PoW instead of some basic agreement mechanism that perhaps is based on proof of authority. Therefore it is essential to choose a consensus algorithm appropriately for a blockchain project.

* Proof of work:  This type of consensus mechanism relies on proof that enough computational resources have been spent before proposing a value for acceptance by the network. This is used in bitcoin and other cryptocurrencies. Currently, this is the only algorithm that has proven astonishingly successful against Sybil attacks.
* Proof of Stake This algorithm works on the idea that a node or user has enough stake in the system; for example the user has invested enough in the system so that any malicious attempt would outweigh the benefits of performing an attack on the system. This idea was first introduced by Peercoin and is going to be used in the Ethereum blockchain. Another important concept in Proof of Stake (PoS) is coin age, which is a derived from the amount of time and the number of coins that have not been spent. In this model, the chances of proposing and signing the next block increase with the coin age.

The incentive mechanism is based on a protocol known as Filecoin that pays incentives to nodes that store data using the BitSwap mechanism. The BitSwap mechanism allows nodes to keep a simple ledger of bytes sent or bytes received under a one-to-one relationship. Also, a Git-based version control mechanism is used in IPFS to provide structure and control over the versioning of data. There are other alternatives, such as Ethereum swarm, s

BitTorrent turns out to be the most scalable and fast network, but the issue is that there is no incentive for users to keep the files indefinitely. Users do not usually keep files permanently, and if nodes leave the network that has data required by someone, there is no way to retrieve it except having the required nodes rejoin the network again so that the files become available once more. Two main requirements here are high availability and link stability,

Data can be stored directly in a blockchain, and with this, it does achieve decentralization, but a major disadvantage of this approach is that blockchain is not suitable for storing large amounts of data by design. It can store simple transactions and some arbitrary data but is certainly not suitable for storing images or large blobs of data, as is the case in traditional database systems. A better alternative is to use distributed hash tables (DHTs). DHTs were originally used in peer-to-peer file sharing software, such as BitTorrent.  


## Sidechains

One such example sidechain is the Lightning Network for Bitcoins that should help in faster execution of transactions with minimal fee; that will support micropayments as well. Another example of a sidechain for Bitcoins is “Zerocash,” whose primary objective is not really scalability, but privacy. If you are using Zerocash for Bitcoin transactions, you cannot be tracked and your privacy is preserved.

For Bitcoin, the Lightning Network was designed for off-chain computation and to make the payments transaction faster. Similarly, the Raiden Network was designed for Ethereum blockchain. 


