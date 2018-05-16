#!/bin/sh

# Load Xresources, if it exists
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Disable screensaver and turn off screen after 10 minutes
xset s off
xset dpms 600 600 600

# Disable annoying beeps
xset b off

# Load fonts
xset fp+ ~/.dotfiles/.fonts/misc
xset fp rehash

# Start the GPG agent.
gpg-connect-agent updatestartuptty /bye

# Start the window manager
exec i3
