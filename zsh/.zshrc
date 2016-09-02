typeset -U path
typeset -U fpath

path=($HOME/.local/bin $path)

# Homebrew
if [[ $OSTYPE == darwin* && -d $HOME/homebrew/bin ]]; then
    path=($HOME/homebrew/bin $path)
fi

export EDITOR="vim"
export HIST_STAMPS="yyyy-mm-dd"

# Source antigen
if [[ ! -d $HOME/.antigen/repos/antigen ]]; then
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen/repos/antigen
fi
source $HOME/.antigen/repos/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    chriskempson/base16-shell --loc=scripts/base16-default-dark.sh
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme ys

antigen apply

# cd to directory by just typing name
setopt AUTO_CD

# Aliases
alias dl="cd $HOME/Downloads/"
alias dot="cd $HOME/.dotfiles/"
alias g=git
alias ws=$HOME/workspace

if [[ -f $HOME/.zshrc.local ]]; then
    source $HOME/.zshrc.local
fi
