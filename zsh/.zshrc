source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
    brew
    brew-cask
    git
    rbenv
    sbt
EOBUNDLES

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# History substring search
antigen bundle zsh-users/zsh-history-substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up # Bind UP arrow key
bindkey "$terminfo[kcud1]" history-substring-search-down # Bind DOWN arrow key

antigen theme ys

antigen apply

typeset -U path
path=(/usr/local/Cellar/protobuf241/2.4.1/bin /usr/local/sbin "$path[@]")

# Use vim as default editor
export EDITOR="vim"

# Use 256 colors
export TERM="xterm-256color"

# Base16 Shell
BASE16_SHELL="$HOME/dotfiles/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Set java classpath
if [[ $OSTYPE == darwin* ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
elif [[ $OSTYPE == linux* ]]; then
    export JAVA_HOME=$(readlink -f $(which java) | sed "s:jre/bin/java::")
fi

# Call 'ls -a' immediately after any 'cd'
function chpwd() {
    emulate -L zsh
    ls -a
}

# cd to directory by just typing name
setopt AUTO_CD

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# Aliases
alias ws="cd ~/workspace/"
alias dp="cd ~/workspace/data_platform/"
alias dl="cd ~/Downloads/"
