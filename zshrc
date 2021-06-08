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

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Aliases
alias g='git'

# zinit
if type brew &>/dev/null && [ -f $(brew --prefix)/opt/zinit/zinit.zsh ]; then
  source $(brew --prefix)/opt/zinit/zinit.zsh
else
  source ~/.zinit/bin/zinit.zsh
fi

zinit ice lucid pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit wait lucid for \
  OMZP::common-aliases \
  OMZP::fzf \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions \
  zsh-users/zsh-syntax-highlighting \
  pick"z.sh" rupa/z

autoload compinit
compinit

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
