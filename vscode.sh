#!/bin/bash
sudo apt install software-properties-common apt-transport-https wget
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
archurl=$(dpkg --print-architecture)
#sudo add-apt-repository "deb [arch=${archurl}] https://packages.microsoft.com/repos/vscode stable main"
#sudo apt install code -y
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-${archurl}
sudo dpkg -i code_*_${archurl}.deb
