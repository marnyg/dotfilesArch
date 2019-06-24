#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --group-directories-first --color=auto'
alias sdn="shutdown now"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alais xi='xinput --map-to-output 23 HDMI-0'
xrandr --output DVI-I-1 --rotate right
 
 
PS1='[\u@\h \W]\$ '

force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt


export PATH=$PATH:~/bin
export PATH=$PATH:~/bin/jetbrains-toolbox
export EDITOR="emacsclient -nw"

