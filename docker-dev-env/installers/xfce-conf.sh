#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "------------------Configure xfce4-----------------"
apt-get install -y locales
mkdir /var/run/dbus
cp /etc/X11/xrdp/xorg.conf /etc/X11
sed -i "s/console/anybody/g" /etc/X11/Xwrapper.config 
sed -i "s/xrdp\/xorg/xorg/g" /etc/xrdp/sesman.ini 
locale-gen en_US.UTF-8
echo "xfce4-session" > /etc/skel/.Xclients
cp -r /etc/ssh /ssh_orig
rm -rf /etc/ssh/*
rm -rf /etc/xrdp/rsakeys.ini /etc/xrdp/*.pem