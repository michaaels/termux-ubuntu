#!/bin/bash
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

case $(dpkg --print-architecture) in
aarch64)
    archurl="arm64"
    ;;
arm)
    archurl="armhf"
    ;;
amd64)
    archurl="amd64"
    ;;
x86_64)
    archurl="amd64"
    ;;
*)
    echo "unknown architecture"
    exit 1
    ;;
esac

sudo add-apt-repository "deb [arch=${archurl}] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y
