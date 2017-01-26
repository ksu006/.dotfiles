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
if [[ ! -d $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh

# Homebrew
# TODO: install homebrew from GitHub if not installed
if [[ $OSTYPE == darwin* && -d $HOME/homebrew/bin ]]; then
    path=($HOME/homebrew/bin $path)
fi

zplug "chriskempson/base16-shell", use:"scripts/base16-ir-black.sh"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "mafredri/zsh-async", on:"sindresorhus/pure"
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "sindresorhus/pure"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

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
