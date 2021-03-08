#! /bin/bash

#~/.screenlayout/this.sh

#feh --bg-scale ~/.local/share/.wall3.jpeg
nvidia-settings --load-config-only
xwallpaper --zoom ~/.local/share/.wall3.jpeg


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
