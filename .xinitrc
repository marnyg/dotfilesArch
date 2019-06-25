#! /bin/bash

redshift&
feh --bg-scale ~/.wall3.jpeg
compton -b

setxkbmap -layout us,no -variant altgr-intl -option "lv3:ralt_alt,grp:alt_shift_toggle" -option caps:escape 
xset r rate 200 50&
xmodmap -e 'keycode 135 = Super_R'

sxhkd &

while true; do
	exec dwm 2> ~/.dwm.log
done
