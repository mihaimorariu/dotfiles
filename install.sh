#!/usr/bin/sh

CWD=$(pwd)

# Create symlinks.
[ -d $HOME/.config/termite ] || mkdir -p $HOME/.config/termite

ln -s $CWD/aliases    $HOME/.aliases -f
ln -s $CWD/gitconfig  $HOME/.gitconfig -f
ln -s $CWD/i3         $HOME/.i3 -f
ln -s $CWD/termite    $HOME/.config/termite -f
ln -s $CWD/tmux.conf  $HOME/.tmux.conf -f
ln -s $CWD/vimrc      $HOME/.vimrc -f
ln -s $CWD/xinitrc    $HOME/.xinitrc -f
ln -s $CWD/Xresources $HOME/.Xresources -f
ln -s $CWD/zshrc      $HOME/.zshrc -f

ln -s $CWD/i3/bumblebee_status/bumblebee-status.conf $HOME/.i3 -f
