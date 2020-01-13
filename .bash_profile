# ~/.bash_profile

export PATH=$PATH:$HOME/bin
export BROWSER=qutebrowser
export EDITOR=nvim
export TERMINAL=st
export _JAVA_AWT_WM_NONREPARENTING=1
export IMAGE_FAMILY="pytorch-latest-gpu" # or "pytorch-latest-cpu" for non-GPU instances
export ZONE="us-west1-b" # budget: "us-west1-b"
export INSTANCE_NAME="my-fastai-instance"
export INSTANCE_TYPE="n1-highmem-8"
export PATH="$PATH:/home/mar/.local/bin"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -le 3 ]]; then
  exec startx
fi

