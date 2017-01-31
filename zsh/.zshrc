path=(~/.local/bin $path)

export EDITOR=vim

# zplug
export ZPLUG_HOME=~/.zplug
export ZPLUG_LOADFILE=~/.zplug.packages.zsh
[ -d $ZPLUG_HOME ] || curl -sL zplug.sh/installer | zsh
source $ZPLUG_HOME/init.zsh

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias dl='cd ~/Downloads/'
alias dot='cd ~/.dotfiles/'
alias g='git'
alias ws='cd ~/workspace'

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
