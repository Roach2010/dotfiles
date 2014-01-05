#
# ~/.bash_profile
#

TERMINAL=xfce4-terminal
export TERMINAL

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
 exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

ulimit -c unlimited >/dev/null 2>&1
