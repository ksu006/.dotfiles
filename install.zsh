#!/usr/bin/env zsh
set -e

cd ${0:a:h}
DIR=$(pwd)
mkdir -pv bak
for rc in *rc gitconfig tmux.conf; do
  [ -e ~/.$rc ] && mv -v ~/.$rc bak/.$rc
  ln -sfv $DIR/$rc ~/.$rc
done
[ -e ~/.config/kitty/kitty.conf ] && mv -v ~/.config/kitty/kitty.conf bak/kitty.conf
ln -sfv $DIR/kitty.conf ~/.config/kitty/kitty.conf
[ ! -d ~/.config/base16-kitty ] && git clone https://github.com/kdrag0n/base16-kitty.git ~/.config/base16-kitty
