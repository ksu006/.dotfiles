#!/bin/sh
command -v stow >/dev/null 2>&1 || { echo "Please install GNU stow." >&2; exit 1;  }
command -v readlink >/dev/null 2>&1 || { echo "Please install readlink." >&2; exit 1;  }
stow --dir=$(dirname $(readlink -f $0)) --target=$HOME git idea tmux vim zsh
