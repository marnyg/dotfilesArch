#!/bin/sh

#export PATH=$PATH:~/bin
export EDITOR=nvim
cd ~

#xrandr --output DVI-I-1 --rotate right
#xrandr --output HDMI-0 --pos 1080x155
#bash ~/.config/i3/scripts/remaps
megasync&
redshift&
feh --bg-scale ~/wall3.jpeg
compton -b
unclutter -idle 3 -root&
sxhkd -r ~/.config/sxhkd/sxhkd.log -s ~/.config/sxhkd/sxhkd.log2&

setxkbmap -layout us,no -variant altgr-intl -option "lv3:ralt_alt,grp:alt_shift_toggle" -option caps:escape 
xset r rate 200 50&

xmodmap -e 'keycode 135 = Super_R'

while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done


