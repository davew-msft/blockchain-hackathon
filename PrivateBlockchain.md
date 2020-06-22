# Building a Private Blockchain with Docker and Ethereum
TODO

*This is an optional exercise.*

Private blockchains are great for developers because they allow them to test ideas without using cryptocurrency. The developer ideas can remain a secret as well, because the data has not been published publicly.


## Setup

* Ensure you have already setup your environment using the instructions found at TODO
* Install Docker Desktop
https://github.com/Capgemini-AIE/ethereum-docker

docker-compose -f docker-compose-standalone.yml up -d

This one line of code will have created the following:

One Ethereum bootstrapped container
One Ethereum container that connects to the bootstrapped container
One Netstats container with a web UI to view activity in the cluster
Take a look at your new blockchain by opening a web browser and going to http://$(docker-machine ip default):3000.