# Install Ubuntu22.04 on Termux Android

This installs Ubuntu with xfce4 desktop on Termux. All scripts are from Andronix, I just compose and edit them to make the installer easier and smoother. It includes:

- [x] Ubuntu 22.04
- [x] XFCE4 Desktop
- [ ] LXDE Desktop
- [x] TigerVNC Server
- [x] Non-root Account Creation
- [x] Audio Support
- [x] Chromium Browser

## Installation

Copy and paste this command to Termux:

### Ubuntu With XFCE4

```bash
curl -s https://raw.githubusercontent.com/michaaels/termux-ubuntu-17-04-22/master/ubuntu.sh | bash
```

### Ubuntu CLI Only

```bash
curl -s https://raw.githubusercontent.com/michaaels/termux-ubuntu-17-04-22/master/ubuntu.sh | bash -s nde
```

### Ubuntu With LXDE

```bash
curl -s https://raw.githubusercontent.com/michaaels/termux-ubuntu-17-04-22/master/ubuntu.sh | bash -s lxde
```

## Run

### Start Ubuntu

After installation, on Termux, you can execute this command to run ubuntu:

```bash
./start-ubuntu.sh
```

### Exit Ubuntu

To exit ubuntu you can simply run `exit` command. This will stop vncserver and some services.

```
exit
```

### Start VNC Server

- Problem with Auth reinstall sudo apt reinstall tigervnc-standalone-server tigervnc-xorg-extension -y
- problem with vncstart, change /home/${USER}/.vnc/xstartup
- #dbus-launch --exit-with-session startlxde &
- dbus-launch --sh-syntax --exit-with-session startlxde

On Ubuntu, run this command to start VNC Server:

```bash
startvnc
```

Then you can use VNC Client to connect to `127.0.0.1:1` or `127.0.0.1:5901`

### Stop VNC Server

On Ubuntu, run this command to stop VNC Server:

```bash
stopvnc
```

## VNC Client For Android

VNC Viewer (from RealVNC) is the best when you use your phone. Unfortunately, it does not does not support Samsung DEX.

[AVNC](https://f-droid.org/en/packages/com.gaurav.avnc/index.html) is another good VNC client. In my opinion it is the best when you use your tablet or Samsung Dex.

## Issues

### Group Issue

If you get an issue message like this:

```
groups: cannot find name for group ID 20305
groups: cannot find name for group ID 50305
```

You can simply add group with this command:

```
sudo groupadd --gid 20305 permagrp5
sudo groupadd --gid 50305 permagrp6
```

## Other

### Install VS Code

- Execute with code --no-sandbox
- VSCode ARM is now officially supported by Microsoft. You can download it here: https://code.visualstudio.com/download
- If VSCode does not run, try install older version. E.g. https://update.code.visualstudio.com/1.50.1/linux-deb-arm64/stable

### OR

```
curl -s https://raw.githubusercontent.com/michaaels/termux-ubuntu-17-04-22/master/vscode.sh | bash
```

### Install LibreOffice

On Ubuntu, run this command to install LibreOffice with patch

```
curl -s  https://raw.githubusercontent.com/michaaels/termux-ubuntu-17-04-22/master/librepatch.sh | bash
```

### Install FireFox

On Ubuntu, run this command to install FireFox

```
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt install -t 'o=LP-PPA-mozillateam' firefox #sudo apt install firefox-esr
#Open firefox error -> Fix https://github.com/termux/proot/issues/139#issuecomment-751988264
```

Follow this url to fix firefox crash https://github.com/termux/proot/issues/139#issuecomment-751988264

### Install Theme & Icons

- Prof-XFCE-theme is the best for me. You can download it here: https://www.gnome-look.org/p/1334420/

- Vimix icon is nice. You can download it here: https://www.gnome-look.org/p/1273372/

- After download \*.tar.xz files you can extract them and copy to themes/icons folders:

```

mkdir -p ~/.local/share/icons ~/.local/share/themes
cd ~/Downloads
tar -xf "Prof--XFCE- 2.1.tar.gz"
mv "Prof--XFCE- 2.1" ~/.local/share/themes/
tar -xf Vimix.tar.xz
mv Vimix ~/.local/share/icons/

```

### Intall Oh My Zsh

```
cp ~/.profile ~/.zprofile
sudo apt install git curl zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
