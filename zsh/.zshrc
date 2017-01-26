typeset -U path
typeset -U fpath

path=($HOME/.local/bin $path)

if type "mvim" > /dev/null; then
    export EDITOR="mvim -v"
    alias vim="mvim -v"
else
    export EDITOR="vim"
fi
export HIST_STAMPS="yyyy-mm-dd"

# zplug
export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_LOADFILE=$HOME/.zplug.packages.zsh
if [[ ! -d $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh

# Homebrew
# TODO: install homebrew from GitHub if not installed
if [[ $OSTYPE == darwin* && -d $HOME/homebrew/bin ]]; then
    path=($HOME/homebrew/bin $path)
fi

# cd to directory by just typing name
setopt AUTO_CD

# Discard older duplicate entries from history
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias dl="cd $HOME/Downloads/"
alias dot="cd $HOME/.dotfiles/"
alias g=git
alias ws=$HOME/workspace

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
