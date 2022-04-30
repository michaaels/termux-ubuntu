#!/bin/bash

#Data Repository
export repo_user="michaaels"
export repo_name="termux-ubuntu-17-04-22"
#

sudo apt install libreoffice --no-install-recommends -y
rm -rf /usr/lib/libreoffice/program/oosplash
wget https://raw.githubusercontent.com/${repo_user}/${repo_name}/master/oosplash?raw=true -q -O /usr/lib/libreoffice/program/oosplash
chmod +x /usr/lib/libreoffice/program/oosplash
mkdir /prod && mkdir /prod/version
echo "Patch has been applied successfully"
