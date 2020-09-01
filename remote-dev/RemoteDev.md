### "Remote Development" using vscode and a blockchain docker container

**All tools must install cleanly.  If there are any errors please ask us for help or consider searching google/bing.  Blockchain tooling is bleeding edge and we've found the tools installations to be a bit frustrating to get going the first time.**

* vscode
  * add the following extensions
    * Remote-Containers
    * Remote Development
* Docker Desktop

## Build the container from the Dockerfile

These instructions assume you are running from bash/WSL.  You can also run them with powershell with some slight modifications

```bash
cd remote-dev

# this will take awhile.  
docker build -t hacks/bc-dev-remote .  --label "version=0.1"

docker run --name bcdevremote \
    -d \
    -p 2022:22 \
    --privileged \
    hacks/bc-dev-remote

# the container should be running
docker ps

# to connect to ssh, if needed
#docker exec -it bcdevremote /bin/bash

# to stop, remove the container and remove the image
#docker stop bcdevremote
#docker rm bcdevremote
#docker image rm hacks/bc-dev-remote
```

## Using the container with vscode

* Start vscode.  

**Please note, the first time you sign in to Azure on the container Chrome will crash with an `aw snap` message.  Just restart vscode and chrome and login again and you will be fine.**

Please return to [EnvironmentSetup](../EnvironmentSetup.md) and run all of the verification steps.  


## Pushing the image to docker hub

This is not needed but see `git history` if it is needed one day.  

  



## Verification Steps

Please go to [EnvironmentSetup](EnvironmentSetup.md) to verify everything is working correctly and continue with the next steps.  

