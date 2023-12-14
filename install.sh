#!/bin/bash -x

dotfiles_dir=$(realpath -s $(dirname $0))

# dotfiles
ln -s $dotfiles_dir ~/.dotfiles

# nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -s $dotfiles_dir/nvim ~/.config/nvim/lua/user

# dwall
pikaur -S dwall-git --noconfirm

# oh-my-zsh
pikaur -S oh-my-zsh-git --noconfirm

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

# alacritty
ln -s $dotfiles_dir/alacritty.ti ~/.alacritty.ti
ln -s $dotfiles_dir/alacritty ~/.config/alacritty

# i3
ln -s $dotfiles_dir/i3 ~/.i3

# zshrc
ln -s $dotfiles_dir/zshrc ~/.zshrc

# bumblebee-status
ln -s $dotfiles_dir/bumblebee-status.conf ~/.config/bumblebee-status.conf

# zathura
ln -s $dotfiles_dir/zathura ~/.config/zathura

# dunst
ln -s $dotfiles_dir/dunst ~/.config/dunst

# tmux
ln -s $dotfiles_dir/tmux.conf ~/.tmux.conf

# rofi
ln -s $dotfiles_dir/rofi ~/.config/rofi
