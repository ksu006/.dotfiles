# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew encode64 git osx python rbenv ruby sbt scala ssh-agent tmux)

export PATH=/usr/local/texlive/2013/bin/x86_64-darwin:~/.local/bin:/usr/local/share/python:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Use vim as default editor
export EDITOR="vim"

# Use 256 colors
export TERM="xterm-256color"

# Set java classpath
if [[ $OSTYPE == darwin* ]]; then
    export JAVA_HOME=`/usr/libexec/java_home`
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

source $ZSH/oh-my-zsh.sh
