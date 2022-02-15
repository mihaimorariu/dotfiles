#!/usr/bin/env python
import os
import shutil
from datetime import datetime

SRC_DIR = os.getcwd()
DST_DIR = os.getenv('HOME')
BAK_DIR = '/tmp/dotfiles.bak'


def ln(src, dst, backup_dir):
    src_full_path = os.path.join(SRC_DIR, src)
    dst_full_path = os.path.join(DST_DIR, dst)

    if os.path.lexists(dst_full_path):
        new_path = os.path.join(backup_dir, dst)
        os.makedirs(os.path.dirname(new_path), exist_ok=True)
        shutil.move(dst_full_path, new_path)
        print('{} exists (moved to {}).'.format(dst_full_path, new_path))

    os.makedirs(os.path.dirname(dst_full_path), exist_ok=True)
    os.system('ln -s {} {}'.format(src_full_path, dst_full_path))


def main():
    timestamp = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
    backup_dir = os.path.join(BAK_DIR, timestamp)
    os.makedirs(backup_dir)

    mappings = [
        ('gitconfig', '.gitconfig'),
        ('i3', '.i3'),
        ('alacritty', '.config/alacritty'),
        ('tmux.conf', '.tmux.conf'),
        ('nvim/init.vim', '.config/nvim/init.vim'),
        ('nvim/autoload', '.config/nvim/autoload'),
        ('xinitrc', '.xinitrc'), ('Xresources', '.Xresources'),
        ('i3/bumblebee_status/bumblebee-status.conf', '.config/bumblebee-status.conf'),
        ('zshrc', '.zshrc'),
        ('alacritty.ti', '.alacritty.ti'),
        ('xterm.ti', '.xterm.ti')
    ]

    for src, dst in mappings:
        ln(src, dst, backup_dir)

    print('Installation is now complete.')


if __name__ == '__main__':
    main()
