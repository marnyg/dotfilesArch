#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


export PATH=$PATH:$HOME/bin
export BROWSER=qutebrowser
export EDITOR=nvim
export TERMINAL=st
export PI=192.168.0.106
export _JAVA_AWT_WM_NONREPARENTING=1
export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-west1-b" # budget: "us-west1-b"
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n1-highmem-8"
export PATH="$PATH:/home/mar/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"

[ "$(tty)" = "/dev/tty2" ] && exec startx
#[ "$(tty)" = "/dev/tty2" ] && ! pgrep -x Xorg >/dev/null && exec startx

