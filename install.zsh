#!/usr/bin/env zsh
set -e

command -v stow > /dev/null 2>&1 || { echo "Please install GNU stow." >&2; exit 1;  }
stow --dir=${${(%):-%N}:A:h} --target=$HOME --restow git idea tmux vim zsh

# Install spf13-vim
# Note: do this after stow command so that we only install the vim plugins we want.
[ -d $HOME/.spf13-vim-3 ] || curl \
    https://raw.githubusercontent.com/ksu006/spf13-vim/3.0/bootstrap.sh -L -o - | sh
