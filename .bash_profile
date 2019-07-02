#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


export PATH=$PATH:$HOME/bin
export BROWSER=surf
export EDITOR=nvim
export TERMINAL=st
export PI=192.168.0.106
export _JAVA_AWT_WM_NONREPARENTING=1

exec startx
