#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

### personal ###
# audio
pipewire &
pipewire-pulse &
wireplumber &
# display
redshift &
picom &
nitrogen --restore &
# keybinds
sxhkd &
# status bar
slstatus &
# ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -drx
# auto lock screen
xautolock -time 10 -locker slock &
caffeine & # drink coffee
# dwm
xset r rate 300 50; exec dwm

# # hyprland & wayland
# export SDL_VIDEODRIVER=wayland
# export MOZ_ENABLE_WAYLAND=1
# xset r rate 300 50; exec Hyprland
