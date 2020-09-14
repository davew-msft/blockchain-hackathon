#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "########################### in blockchain.sh ###########################"

# blockchain workshop requirements
APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

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

npm install node-gyp --loglevel=error
npm install scrypt --loglevel=error
npm install truffle --loglevel=error
npm install ganache-cli --loglevel=error

#npm install -g node-gyp 
#npm install -g scrypt
#npm install -g truffle
#npm install -g ganache-cli