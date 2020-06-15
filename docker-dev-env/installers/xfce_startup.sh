#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo -e "\n------------------ startup of Xfce4 window manager ------------------"


#/usr/bin/startxfce4 --replace > $HOME/wm.log
#/usr/bin/startxfce4 &
#sleep 1
#cat $HOME/wm.log

### disable screensaver and power management
xset -dpms &
xset s noblank &
xset s off &

## copy xrdp.ini to the correct location
#cat /scripts/installers/xrdp.ini /etc/xrdp/xrdp.ini > /etc/xrdp/xrdp_new.ini
#rm -rf /etc/xrdp/xrdp.ini
#mv /etc/xrdp/xrdp_new.ini /etc/xrdp/xrdp.ini 

#xrdp-keygen xrdp auto

#systemctl restart xrdp
#systemctl status xrdp


