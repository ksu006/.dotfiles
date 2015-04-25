eval `/usr/libexec/path_helper -s`
export PATH=/usr/local/Cellar/protobuf241/2.4.1/bin:/opt/hbase/bin:/opt/hadoop/bin:/opt/hadoop/sbin:/usr/local/sbin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

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

# Use vim as default editor
export EDITOR="vim"

# Use 256 colors
export TERM="xterm-256color"

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

# Alias to repo
export GIT="ssh://git@git.btrll.com/home/git/repo"

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ws="cd ~/workspace/"
alias dp="cd ~/workspace/data_platform/"
alias dl="cd ~/Downloads/"
