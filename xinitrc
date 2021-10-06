#!/bin/sh

# Load Xresources, if it exists.
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Load xprofile, if it exists.
[ -f ~/.xprofile ] && source ~/.xprofile

# Disable the screensaver.
xset s off

# Turn off the screen after 10 minutes.
xset dpms 600 600 600

# Disable annoying beeps.
xset b off

# Start the window manager.
exec i3
