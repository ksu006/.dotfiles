typeset -U path

path=($HOME/.local/bin $path)

# zplug
export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_LOADFILE=$HOME/.zplug.packages.zsh
[ -d $ZPLUG_HOME ] || git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# Homebrew
# TODO: install homebrew from GitHub if not installed.
if [[ $OSTYPE == darwin* && -d $HOME/homebrew/bin ]]; then
    path=($HOME/homebrew/bin $path)
fi

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias dl="cd $HOME/Downloads/"
alias dot="cd $HOME/.dotfiles/"
alias g=git
alias ws=$HOME/workspace

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
