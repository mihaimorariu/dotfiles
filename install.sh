#!/bin/bash -x

dotfiles_dir=$(realpath -s $(dirname $0))

# dotfiles
ln -s $dotfiles_dir ~/.dotfiles

# ranger
ln -s $dotfiles_dir/ranger ~/.config/ranger

# nvim
ln -s $dotfiles_dir/nvim ~/.config/nvim

# dwall
#pikaur -S dwall-git --noconfirm

# oh-my-zsh
pikaur -S oh-my-zsh-git --noconfirm

# rofi-themes-collection
pikaur -S rofi-themes-collection-git --noconfirm

# i3-volume
pikaur -S i3-volume --noconfirm

# rmpc
ln -s $dotfiles_dir/rmpc ~/.config/rmpc

# polybar
git clone git@github.com:mihaimorariu/polybar-themes.git /tmp/polybar-themes
echo 1 | bash /tmp/polybar-themes/setup.sh

# xprofile
ln -s $dotfiles_dir/xprofile ~/.xprofile

# xterm.ti
ln -s $dotfiles_dir/xterm.ti ~/.xterm.ti

# aliases
ln -s $dotfiles_dir/aliases ~/.aliases

# Xresources
ln -s $dotfiles_dir/Xresources ~/.Xresources

# xinitrc
ln -s $dotfiles_dir/xinitrc ~/.xinitrc

# gitconfig
ln -s $dotfiles_dir/gitconfig ~/.gitconfig

# picom
ln -s $dotfiles_dir/picom ~/.config/picom

# alacritty
ln -s $dotfiles_dir/alacritty.ti ~/.alacritty.ti
ln -s $dotfiles_dir/alacritty ~/.config/alacritty

# i3
ln -s $dotfiles_dir/i3 ~/.i3

# zshrc
ln -s $dotfiles_dir/zshrc ~/.zshrc

# bumblebee-status
#ln -s $dotfiles_dir/bumblebee-status.conf ~/.config/bumblebee-status.conf

# dunst
ln -s $dotfiles_dir/dunst ~/.config/dunst

# zathura
ln -s $dotfiles_dir/zathura ~/.config/zathura

# tmux
ln -s $dotfiles_dir/tmux.conf ~/.tmux.conf

# rofi-themes-collection
#ln -s /usr/share/rofi ~/.local/share/rofi

# rofi
#ln -s $dotfiles_dir/rofi ~/.config/rofi
