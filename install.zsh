#!/usr/bin/env zsh
set -e

cd ${0:a:h}
DIR=$(pwd)
for rc in *rc gitconfig tmux.conf; do
  mkdir -pv bak
  [ -e ~/.$rc ] && mv -v ~/.$rc bak/.$rc
  ln -sfv $DIR/$rc ~/.$rc
done
