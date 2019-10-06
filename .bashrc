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
alias t="task"
alias g=git
alias ga="git add"
alias gs="git status"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gp="git push"

 
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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mar/google-cloud-sdk/path.bash.inc' ]; then . '/home/mar/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mar/google-cloud-sdk/completion.bash.inc' ]; then . '/home/mar/google-cloud-sdk/completion.bash.inc'; fi
