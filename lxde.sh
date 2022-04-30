#!/bin/bash

#Data Repository
export repo_user="michaaels"
export repo_name="termux-ubuntu-17-04-22"
#

#Get the necessar components
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
[ ! -f /root/.parrot ] && sudo apt update || echo "Parrot detected, not updating apt cache since that will break the whole distro"
sudo apt install keyboard-configuration -y
sudo apt install xfe lxde-common lxde-core lxde-icon-theme lxappearance lxlock lxmenu-data \
  lxpanel lxpanel-data lxrandr lxsession lxsession-data lxsession-default-apps lxsession-logout \
  lxtask lxterminal lxhotkey-core lxhotkey-data lxshortcut obconf gtk2-engines \
  dbus-x11 libsecret-1-0 --no-install-recommends -y
sudo apt install curl wget unzip vim net-tools tigervnc-standalone-server tigervnc-xorg-extension -y

#Get Additional apps
sudo add-apt-repository ppa:mozillateam/ppa && sudo apt install -t 'o=LP-PPA-mozillateam' firefox -y
#sudo apt install openjdk-17-jdk nodejs npm -y

#curl -fL https://github.com/coursier/launchers/raw/master/cs-aarch64-pc-linux.gz | gzip -d >cs && chmod +x cs && ./cs setup
#curl -s https://raw.githubusercontent.com/michaaels/termux-ubuntu-17-04-22/master/vscode.sh | bash

sudo apt clean
mv /usr/bin/lxpolkit /usr/bin/lxpolkit.bak

#Setup the necessary files
mkdir -p ~/.vnc

echo '#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY
LANG=en_US.UTF-8
export LANG
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session startlxde &' > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo " "

#echo "Running browser patch"
#wget https://raw.githubusercontent.com/${repo_user}/${repo_name}/master/ubchromiumfix.sh && chmod +x ubchromiumfix.sh
#sudo ./ubchromiumfix.sh && rm -rf ubchromiumfix.sh

echo "You can now start vncserver by running startvnc"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Running startvnc"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run stopvnc"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
wget -q https://raw.githubusercontent.com/${repo_user}/${repo_name}/master/.profile -O $HOME/.profile.1 > /dev/null
cat $HOME/.profile.1 >> $HOME/.profile && rm -rf $HOME/.profile.1
source ~/.profile
