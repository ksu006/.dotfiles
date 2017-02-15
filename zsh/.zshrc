export EDITOR=vim

export GOPATH=~/code/go
path=(~/.local/bin $GOPATH $GOPATH/bin $path)

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias code='cd ~/code'
alias dl='cd ~/Downloads'
alias dot='cd ~/.dotfiles'
alias g='git'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# zplug
export ZPLUG_HOME=~/.zplug
export ZPLUG_BIN=$ZPLUG_HOME/bin
export ZPLUG_LOADFILE=~/.zplug.packages.zsh
[ -d $ZPLUG_HOME ] || curl -sL zplug.sh/installer | zsh
source $ZPLUG_HOME/init.zsh
