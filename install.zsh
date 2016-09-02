#!/usr/bin/env zsh
command -v stow >/dev/null 2>&1 || { echo "Please install GNU stow." >&2; exit 1;  }
stow --dir=${${(%):-%N}:A:h} --target=$HOME --restow git idea tmux vim zsh