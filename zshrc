# Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export EDITOR=vim
export LESS=-FRX

typeset -U path
path=(~/bin ~/.local/bin /opt/homebrew/bin $path)

# brew completion
if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias g='git'

# Disable oh-my-zsh auto update prompt.
DISABLE_AUTO_UPDATE=true
ZSH_DISABLE_COMPFIX=true

# zgen
ZGEN_DIR=~/.zgen
[ -d $ZGEN_DIR ] || git clone https://github.com/tarjoilija/zgen $ZGEN_DIR
source $ZGEN_DIR/zgen.zsh

if ! zgen saved; then
  # oh-my-zsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/fzf
  zgen oh-my-zsh plugins/z
  zgen oh-my-zsh plugins/zsh_reload

  # pure
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # zsh-completions
  zgen load zsh-users/zsh-completions

  # zsh-syntax-highlighting
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
