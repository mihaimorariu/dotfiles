#!/bin/sh

# Load Xresources, if it exists.
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Disable the screensaver.
xset s off

# Turn off the screen after 10 minutes.
xset dpms 600 600 600

# Disable annoying beeps.
xset b off

# Configure fcitx.
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Start the window manager.
exec i3
