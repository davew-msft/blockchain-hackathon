#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

# blockchain workshop requirements
sudo apt-get install -y git curl
sudo apt-get install -y build-essential

# vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

#code --install-extension ms-python.python
#code --install-extension azblockchain.azure-blockchain