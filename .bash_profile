#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# autustart X at login
if [ -z "${DISPLAY}" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
