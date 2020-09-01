#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "----------------------------add dave user-------------------------------"

useradd --create-home --shell /bin/bash --groups sudo --uid 999 -p "$(openssl passwd -1 vscode)" vscode

