#!/bin/bash
sudo apt install software-properties-common apt-transport-https -y
archurl=$(dpkg --print-architecture)
wget -O code_${archurl}.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-'${archurl}
sudo dpkg -i code_${archurl}.deb
