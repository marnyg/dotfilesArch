#export EDITOR=/usr/bin/nano
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"


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
source /home/mar/.icons
source /home/mar/.fzfcommands


[ "$(tty)" = "/dev/pts/1" ] && ! pgrep -x Xorg >/dev/null && exec startx

