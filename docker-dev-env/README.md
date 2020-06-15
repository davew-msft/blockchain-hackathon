
This is a docker container that will allow you to run the workshop fully from the container without installing a bunch of software locally.  This builds a Ubuntu container with xfce4 and all of the tooling we will use.  You can then RDP into the container and it feels like you are doing remote development over RDP.  

You must install docker or Docker Desktop on your machine.  Then follow the instructions below.  The instructions are written in `bash` so you may need to translate them to PoSh/Windows or Macintosh.  (WSL works perfectly.)

Disclaimer:  This is not a foolproof process.  You may need to change some of the commands since software installation processes change over time.  

## One step container instructions

You can either download the container in one command or build the container manually using the steps in the next section.  

```bash
docker run --name bcdev \
    -d \
    -p 2022:22 \
    -p 3390:3389 \
    --privileged \
    hacks/bc-dev
```

Go to "Connecting to the container ..." to finish the installation.  

## Full instructions if you want to customize the container

```bash

cd docker-dev-env

# this will take awhile.  
docker build -t hacks/bc-dev .  --label "version=0.1"

docker run --name bcdev \
    -d \
    -p 2022:22 \
    -p 3390:3389 \
    --privileged \
    dwentzel/bc-devenv

#docker ps

# now connect with your rdp client
# 127.0.0.1:3390
# login is vscode/vscode

# to connect to ssh, if needed
#docker exec -it bcdev /bin/bash

# to stop, remove the container and remove the image
#docker stop bcdev
#docker rm bcdev
#docker image rm hacks/bc-dev

# push this image to docker hub
# docker login
#docker tag hacks/bc-dev dwentzel/bc-devenv:v1
#docker push dwentzel/bc-devenv:v1

```

## Connecting to the container ...

You can now connect with your rdp client to:

`127.0.0.1:3390`

login is vscode/vscode

You will need to run this manually from the terminal:

```
code --install-extension ms-python.python
code --install-extension azblockchain.azure-blockchain
```

**Please note, the first time you sign in to Azure on the container Chrome will crash with an `aw snap` message.  Just restart vscode and login again and you will be fine.**

Please return to [EnvironmentSetup](EnvironmentSetup.md) and run all of the verification steps.  
