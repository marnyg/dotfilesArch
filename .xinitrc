#! /bin/bash

xrandr --output DVI-I-1 --rotate right
feh --bg-scale ~/.wall3.jpeg

setxkbmap -layout us,no -variant altgr-intl -option "lv3:ralt_alt,grp:alt_shift_toggle" -option caps:escape 
xset r rate 300 100&
xmodmap -e 'keycode 135 = Super_R'

status.sh&
sxhkd>~/.sxhkd.log &
redshift &
compton &
clipmenud &

#systemctl --user import-environment DISPLAY XAUTHORITY
#dbus-update-activation-environment --systemd DISPLAY XAUTHORITY 
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socke)
nextcloud&

while :; do
	ssh-agent dwm || break
done
