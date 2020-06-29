
# Business Use Cases

## Background

Remember, blockchain's value is in that it is trustless.  So good use cases will be those in which I am using the "system" to maintain trust.  There is an economic incentive for all actors, both good and bad, to not risk their reputations.  

The courts and legal system (in the US at least) have not make any notable decisions regarding whether blockchain contracts are legally binding.  

Contract concepts:  

* a stock has value because a court can enforce it.  The shareholder has purchased a share of the company.  The court can send men with guns and come and do bad things to you if there are violations.   
* Contract law is predicated on "evidence of an agreement".  Sitting behind any contract is threat of enforcement.  This is not true (currently) withe blockchain.  
* crypto has no ownership as such.  There is no "database" ownership claim that can be made by anyone.  A blockchain is not a security.  
* Legally, there is nothing underpinning a blockchain or a smart contract. This means that even if a court rules a certain way that would require the rewriting of a block in the chain, there is no way they could ever enforce it.  The entire chain is run on distributed servers (in the case of public blockchains) running on consensus protocols.  

## Various:  Food for Thought

* When a crypto currency becomes successful it becomes unusable.  Example:  bitcoin.  Bitcoin can only support a handful of transactions/sec.  It is unusable for day-to-day financial transactions.  You wouldn't put a receipt for your pack of bubble gum on a blockchain.  Blockchain inherently doesn't scale. This needs to be thought through carefully.  
* A **nakamoto scheme** is like a ponzi scheme.  but it is headless and has no real assets to go after.  It's worthwhile to read some stories on this.  
* There's no really good tools for key mgmt in the blockchain world.  

## Business Use Cases - Food for Thought

* GiveTrack
  * holds charities accountable for how they use their donations by tracking the flow of funds.  
* Diamond chains
  * Reduce ins fraud
  * Needs to be distributed for political reasons
  * But how do we associate individual diamonds with digital tokens on a blockchain?  
  	* The diamonds aren't engraved.  
  * This use case may only be good as a local solution to spot patterns of fraud vs ownership chains.  
* Bond transaction bible (in vernacular)
  * Recording bond transactions between particpating orgs.  
  * Banks send notices
  * Recording sales
  * Rating agencies, etc 
  * It's just digitizing the chain of evidence.  
* Businesses and business plans built around *reputation* 
  * Tattoo and piercing shops that want to prove their work and get real feedback from customers. 
* Shareholder meetings
  * these tend to be poorly documented.  You can put the text on a public blockchain with any supporting information stored off-chain
* music royalties
  * Musicians rarely get their royalties.  
  * It's also difficult for streaming services to know where to send the royalties.  A blockchain can help to automate much of this.  
* temporal tokenization use cases
  * If you hold a token for a period of time something good will happen.  
  * Example:  instead of DRM we could give access to music for a fixed set of time via a blockchain smart contract.  
* Lotteries 
  * an excellent use case for Ethereum. Like pyramids, lotteries were among the first contracts on the Ethereum blockchain. Also a good way to learn is to build a lottery.  
  * Results are provably fair, enabling the lottery to be run without a central authority taking a cut of the winnings, and without anchoring its operation in any single legal jurisdiction.
  * roadblock to running a good lottery: random-number generation
    * your primary options for a source of entropy are the blockhash and external oracles.
	* After a round has ended, there is a five-block waiting period before a winner can be drawn. Five blocks is far enough out in the future that no one can know the blockhash ahead of time. Minimally, two would be enough because the latest available blockhash is from the previous block
* Supply chain provenance
  * nestle/gerber putting baby food on a blockchain.  Improved food recalls.  Why not just a db?  They want it to be industry-wide otherwise consumers wouldn't be trusting.   
  * customer trust
* health information exchanges
  * requests for patient data, clinical data, consent
  * data provenance…pharma needs to know where clinical data is coming from and the level of quality.  The openness of the data leads to better clinical trials with better "confidence" in the outputs

## Possibly Bad Use cases 

* Real estate transactions
  * A lawyer will tell you blockchain is a cargo cult that looks all cool legally but has no real legal backing.  looks good, feels right, but there's no legal backing.  
* MERS
  * Mortgage Electronic Reg System
* Voting
  * What's really being solved by putting voting on a blockchain?  Vote selling becomes even more of a problem.  What about people with no access to electronic voting?  
  * This is kinda already done locally anyway where scans of the paper ballot are taken, then certified, then uploaded.  Blockchain could help with some of this, but it doesn't help with fraud or fair elections, at all.  
* [Other Bad Use Cases](https://blog.smartdec.net/you-do-not-need-blockchain-eight-popular-use-cases-and-why-they-do-not-work-f2ecc6cc2129)

## You have a good business idea, where do you start? 

* How to run or build a private blockchain
  * There are no really good reference documents right now.  
  * Start by understanding your business really well
  * Understand it backwards/forwards to understand how distributed ledger could help your business.  


## Stories about "trust"

When Trump pulled from the nuclear accord with Iran, Iranians got scared. The wealthy non-religious population of Iran lost trust in their currency. So what currency did they run to? The only choice: Bitcoin. 
Shortly thereafter, according to discussions I had with the brokers of these transactions, OVER $2.5 BILLION of Iranian Dinars fled the country and went into bitcoin.

A real-world example powered by Azure blockchain technology is GE Aviation’s next-generation blockchain solution that tracks the genealogy of engine parts to improve productivity and safety for airlines. 

Microsoft has taken blockchain from an art and transformed it into a science by fundamentally improving each aspect of the software stack. We’ve benefited from the innovation of no-code logic apps for data ingestion, off-chain storage with Azure SQL Database and Azure Cosmos DB, and analytics visualization via Power BI. The rich integration of these Azure services with Azure Blockchain Service and Azure Blockchain Workbench have enabled us to get our solutions into the hands of our customers much faster with a lot less complexity.  It is important to note that Microsoft cannot snoop in blockchain solutions you build in Azure.  We provide the services for you to handle your own solution.  This is different from other vendors that implement blockchain for you and could violate trust.  