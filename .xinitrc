#! /bin/bash

#xrandr --output DVI-I-1 --rotate left
#xrandr --output HDMI-0 --rotate left
xrandr --output DVI-I-0 --off --output DVI-I-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 5760x0 --rotate left --output DP-0 --off --output DVI-D-0 --mode 1920x1080 --pos 3840x264 --rotate normal --output DP-1 --off


feh --bg-scale ~/.local/share/.wall3.jpeg

setxkbmap -layout us,no -variant altgr-intl -option "lv3:ralt_alt,grp:alt_shift_toggle" -option caps:escape 
xset r rate 300 100&
xmodmap -e 'keycode 135 = Super_R'

status.sh &
sxhkd &
redshift &
compton &
clipmenud &
unclutter &
dunst &
nextcloud --background &
emacs --daemon &

while :; do
	ssh-agent dwm || break
done
