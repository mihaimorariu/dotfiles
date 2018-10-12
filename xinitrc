#!/bin/sh

# Load Xresources, if it exists
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start the window manager
exec i3
