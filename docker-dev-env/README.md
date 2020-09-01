
This is a docker container that will allow you to run the workshop fully from the container without installing a bunch of software locally.  This builds a Ubuntu container with xfce4 and all of the tooling we will use.  You can then RDP into the container and it feels like you are doing remote development over RDP.  

You must install docker or Docker Desktop on your machine.  Then follow the instructions below.  The instructions are written in `bash` so you may need to translate them to PoSh/Windows or Macintosh.  (WSL works perfectly.)

## Build the container from the Dockerfile

```bash
cd docker-dev-env

# this will take awhile.  
docker build -t hacks/bc-dev .  --label "version=0.1"

docker run --name bcdev \
    -d \
    -p 2022:22 \
    -p 3390:3389 \
    --privileged \
    hacks/bc-dev

#docker ps

# to connect to ssh, if needed
#docker exec -it bcdev /bin/bash

# to stop, remove the container and remove the image
#docker stop bcdev
#docker rm bcdev
#docker image rm hacks/bc-dev
```

## Connecting to the container ...

You can now connect with your rdp client to:

`127.0.0.1:3390`

login is vscode/vscode  

You will need to run this manually from the terminal:

```
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash
sudo apt-get install -y nodejs

sudo chmod -R 0777 /usr/lib/node_modules 
#sudo chmod -R 0777 /usr/bin
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
touch ~/.profile
echo "" >> ~/.profile
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile
echo "" >> ~/.profile
source ~/.profile
NPM_CONFIG_PREFIX=~/.npm-global

npm install -g node-gyp 
npm install -g scrypt
npm install -g truffle
npm install -g ganache-cli

code --install-extension azblockchain.azure-blockchain

```

* Start vscode.  It may ask to update, please do that.  
* Sign in to Azure with chrome.  

**Please note, the first time you sign in to Azure on the container Chrome will crash with an `aw snap` message.  Just restart vscode and chrome and login again and you will be fine.**

Please return to [EnvironmentSetup](../EnvironmentSetup.md) and run all of the verification steps.  


## Pushing the image to docker hub

This is not needed but see `git history` if it is needed one day.  