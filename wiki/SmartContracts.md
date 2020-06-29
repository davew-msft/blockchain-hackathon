
## Best Practices

* Smart contracts are immutable.  Sometimes it's impossible to upgrade contracts that are already live. Buggy smart contract code can cause you financial losses. 
* You have to take a different software development mentality than what you would normally do as a web developer.  *Move fast and break things* does not apply.  
* You need to invest upfront to write bug-free code
  * You need to be familiar with Solidity security vulnerabilities (there are some)
  * Understand Solidity design patterns like pull vs push payments and `Checks-Effects-Interactions` patterns.  There are many more
  * Use defensive programming techniques like static analysis and unit tests.
    * Consider using git hooks to automate some of this in the style of "shift left" development.  
    * use linters
* CI is mandatory so tests are executed after every push
* Use testing frameworks
  * for truffle there is the Mocha testing framework and Chai for assertions.  
* **Insist on only using audited, open source contracts**.  
  * Secure your code from Day 1 by using battle-tested open-source code that has already passed security audits. Using audited code reduces the surface area you need to audit later on.
  * [OpeZeppelin Contracts](https://github.com/openzeppelin/openzeppelin-contracts) is a framework of modular, reusable smart contracts written in Solidity. It includes implementations of popular ERC standards. It comes with the following out of the box:
    * ACLs
    * Open source implementations of popular token standards, along with optional modules.
    * Gas Stations Network: Abstracts away gas from your users.
	* other utility contracts.
>> OpenZeppelin Contracts are excellent learning materials for new developers. [Start here](https://docs.openzeppelin.com/contracts/3.x/).  If you are thinking of writing a Smart Contract that is not already available in OpenZeppelin or another OSS Solidity project, you might want to re-think your use case.  





	
