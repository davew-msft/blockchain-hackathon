# Dapp = Distributed App

To implement good use cases for blockchain, we create applications that work on top of blockchains. In general, applications that interact with blockchains are referred to as “decentralized applications” or, in short, just DApps or dApps.

These applications do not rely on a centralized database but on a blockchain-based decentralized data store. There is no single point of failure or control for these applications.

Generally, we are used to concepts like objects, classes, functions, etc. when we develop conventional software applications. However, when it comes to blockchain applications, we need to understand a few more concepts like transactions,accounts and addresses, tokens and wallets, inputs, and outputs and balances.

Building a dapp isn’t that much more difficult than building a regular app. The added complexity comes from having to think in a decentralized way and not having as many mature libraries at your disposal as a regular app developer does.

You don’t want to have to deal with the pain and annoyance of bootstrapping a blockchain just so you can have your own appcoin. It’s not worth it when the Bitcoin blockchain already exists. 

New DAPPs are popping up every day. You can explore and discover new ones built on Ethereum by going to https://dappradar.com. DappRadar updates a list of all the latest Ethereum Dapps and gives you a preview of what they do.

The crypto space is an ever-growing uncharted territory. There’s no definitive stack of tools, like LAMP or MEAN in web development, to build decentralized apps.  

## Javascript vs Go

Although JavaScript is great, it has its weaknesses. 

Concurrency is nontrivial to implement and it has confusing value constructors. 

Go makes up for these and is built for more distributed-type systems. I have to admit that I’ve found Go to be the most efficient for building dapps. Google created Go because it needed a language that could handle the Google-scale concurrent computation of large datasets as fast and efficiently as possible. Go was the answer to that problem, and its use internally at Google has increased significantly since its first release.

The fact that IPFS was built using Go is also a plus because you can integrate distributed file storage into your app without compatibility barriers. 

Go isn’t exactly an object-oriented programming (OOP) language in the traditional sense like most other languages. It follows a model similar to OOP, but it is different. Structs are Go's version of Objects. Structs have fields and methods and they feel like objects. But in regular OOP, we use the class keyword to define objects. This helps with inheritance, but Go is designed without inheritance. Although this might seem like a bad feature at first, it's actually a pretty good thing. Inheritance can get messy when you have lots of classes and different interfaces and implementations extending each other down a hierarchy. Instead Go uses subtyping (is-a) and object composition (has-a) to define relationships between structs and interfaces.

