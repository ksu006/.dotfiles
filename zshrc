# Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export EDITOR=vim

path=(~/.local/bin $path)

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias code='cd ~/code'
alias dl='cd ~/Downloads'
alias dot='cd ~/dotfiles'
alias g='git'

# zgen
ZGEN_HOME=~/.zgen
[ -d $ZGEN_HOME ] || git clone https://github.com/tarjoilija/zgen.git $ZGEN_HOME
source $ZGEN_HOME/zgen.zsh

if ! zgen saved; then
  # oh-my-zsh
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/zsh_reload

  # base16-shell
  zgen load chriskempson/base16-shell

  # pure
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # zsh-completions
  zgen load zsh-users/zsh-completions

  # zsh-syntax-highlighting
  zgen load zsh-users/zsh-syntax-highlighting

  # fzf
  FZF_GITHUB_REPO=junegunn/fzf
  FZF_GITHUB_BRANCH=master
  zgen load $FZF_GITHUB_REPO shell/completion.zsh $FZF_GITHUB_BRANCH && \
  zgen load $FZF_GITHUB_REPO shell/key-bindings.zsh $FZF_GITHUB_BRANCH && \
  $ZGEN_HOME/$FZF_GITHUB_REPO-$FZF_GITHUB_BRANCH/install --bin && \
  path=($ZGEN_HOME/$FZF_GITHUB_REPO-$FZF_GITHUB_BRANCH/bin $path)
  unset FZF_GITHUB_BRANCH
  unset FZF_GITHUB_REPO

  zgen save
  unset ZGEN_HOME
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
