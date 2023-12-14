# Dotfiles

This repository contains my configuration files for vim, i3, termite, zsh etc.

# Dependencies

- pikaur

# Installation

You first need to install `pikaur`:

```
cd /tmp
wget https://aur.archlinux.org/cgit/aur.git/snapshot/pikaur.tar.gz
tar -xvf pikaur.tar.gz
cd pikaur
makepkg
sudo pacman -U $(ls pikaur*.tar.zst)
cd ..
rm -rf pikaur*
```

Now run `./install.sh` from the `dotfiles` directory. Enjoy!

