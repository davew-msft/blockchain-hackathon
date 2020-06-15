#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# blockchain workshop requirements
sudo apt-get install -y git curl

# goofy node/truffle stuff
#sudo chmod -R 0777 /usr/lib/node_modules 
#sudo chmod -R 0777 /usr/bin
#mkdir ~/.npm-global
#npm config set prefix '~/.npm-global'
#touch ~/.profile
#echo "" >> ~/.profile
#echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile
#echo "" >> ~/.profile
#source ~/.profile
#NPM_CONFIG_PREFIX=~/.npm-global

# node 10
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash
sudo apt-get install -y nodejs



sudo npm install --unsafe-perm -g truffle
# this throws errors the first time, just run it again
sudo npm install -g ganache-cli
sudo npm install -g ganache-cli

#sudo apt install python-minimal

# vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

code --install-extension ms-python.python
code --install-extension azblockchain.azure-blockchain