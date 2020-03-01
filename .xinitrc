#! /bin/bash

xrandr --output DVI-I-1 --rotate right
feh --bg-scale ~/.wall3.jpeg

setxkbmap -layout us,no -variant altgr-intl -option "lv3:ralt_alt,grp:alt_shift_toggle" -option caps:escape 
xset r rate 300 100&
xmodmap -e 'keycode 135 = Super_R'

status.sh &
sxhkd>~/.sxhkd.log &
redshift &
compton &
clipmenud &
unclutter &
nextcloud --background &
emacs --daemon &

while :; do
	ssh-agent dwm || break
done
