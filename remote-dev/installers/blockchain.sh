#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# blockchain workshop requirements
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash
apt-get install -y nodejs

#chmod -R 0777 /usr/lib/node_modules 
#mkdir ~/.npm-global
#npm config set prefix '~/.npm-global'
#touch ~/.profile
#echo "" >> ~/.profile
#echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile
#echo "" >> ~/.profile
#source ~/.profile
#NPM_CONFIG_PREFIX=~/.npm-global

npm install node-gyp 
npm install scrypt
npm install truffle
npm install ganache-cli

#npm install -g node-gyp 
#npm install -g scrypt
#npm install -g truffle
#npm install -g ganache-cli