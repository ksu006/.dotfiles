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

# Source antigen
if [[ ! -d $HOME/.antigen/repos/antigen ]]; then
    git clone https://github.com/zsh-users/antigen.git $HOME/.antigen/repos/antigen
fi
source $HOME/.antigen/repos/antigen/antigen.zsh

antigen use oh-my-zsh

# Homebrew
if [[ $OSTYPE == darwin* && -d $HOME/homebrew/bin ]]; then
    path=($HOME/homebrew/bin $path)
    antigen bundle brew
fi

antigen bundles <<EOBUNDLES
    chriskempson/base16-shell --loc=scripts/base16-ir-black.sh
    mafredri/zsh-async  # dependency of sindresorhus/pure
    sindresorhus/pure
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

# cd to directory by just typing name
setopt AUTO_CD

# Discard older duplicate entries from history
setopt HIST_IGNORE_ALL_DUPS

# FZF
if [[ ! -d $HOME/.fzf ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias dl="cd $HOME/Downloads/"
alias dot="cd $HOME/.dotfiles/"
alias g=git
alias ws=$HOME/workspace

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
