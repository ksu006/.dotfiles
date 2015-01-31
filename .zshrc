# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws brew bundler encode64 git jsontools osx pip python rbenv ruby sbt scala ssh-agent tmux urltools vagrant)

eval `/usr/libexec/path_helper -s`
export PATH=/usr/local/Cellar/protobuf241/2.4.1/bin:/opt/hbase/bin:/opt/hadoop/bin:/opt/hadoop/sbin:/usr/local/sbin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

source $ZSH/oh-my-zsh.sh

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

alias ws="cd ~/workspace/"
alias dp="cd ~/workspace/data_platform/"
alias dl="cd ~/Downloads/"
