#!/bin/bash -x

dotfiles_dir=$(realpath -s $(dirname $0))

# dotfiles
ln -sf $dotfiles_dir ~/.dotfiles

## nvim
#git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim +NvChadUpdate .
#ln -sf $dotfiles_dir/nvim/lua/core/default_config.lua ~/.config/nvim/lua/core/default_config.lua

# oh-my-zsh
pikaur -S oh-my-zsh-git --noconfirm

# xprofile
ln -sf $dotfiles_dir/xprofile ~/.xprofile

# xterm.ti
ln -sf $dotfiles_dir/xterm.ti ~/.xterm.ti

# aliases
ln -sf $dotfiles_dir/aliases ~/.aliases

# Xresources
ln -sf $dotfiles_dir/Xresources ~/.Xresources

# xinitrc
ln -sf $dotfiles_dir/xinitrc ~/.xinitrc

# gitconfig
ln -sf $dotfiles_dir/gitconfig ~/.gitconfig

# alacritty
ln -sf $dotfiles_dir/alacritty.ti ~/.alacritty.ti

# i3
ln -sf $dotfiles_dir/i3 ~/.i3

# zshrc
ln -sf $dotfiles_dir/zshrc ~/.zshrc
