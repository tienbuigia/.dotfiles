#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

# blesh starting
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# Source alias
[[ -f ~/.bash_alias ]] && . ~/.bash_alias

# source lfcd
if [ -f "$HOME/.config/lf/lfcd.sh" ]; then
	source "$HOME/.config/lf/lfcd.sh"
fi

# Environment
export PATH=$PATH:$HOME/.local/bin

# Flask env
export FLASK_ENV=development
# IEX api public key for PS9
export API_KEY=pk_c9eab13092f24e1fab08bae97a720974

# color
export COLORTERM=truecolor
export PAGER='less -R --use-color -Dd+r -Du+b'

# config for bash
set -o vi
# . /usr/share/bash-completion/bash_completion
# export HISTCONTROL=ignoredups
source /usr/share/doc/pkgfile/command-not-found.bash

# autorun when open terminal
figlet Hello, world!

# blesh ending
[[ ${BLE_VERSION-} ]] && ble-attach
