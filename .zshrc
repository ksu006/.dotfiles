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
plugins=(brew bundler encode64 gem git osx pip)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/texbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Initialize rbenv
eval "$(rbenv init -)"

# Use vim as default editor
export EDITOR="vim"

# Set java classpath
export JAVA_HOME=`/usr/libexec/java_home`

# Alias to repo
export GIT="ssh://git@git.btrll.com/home/git/repo"

# Load virtualenvwrapper
if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
    source /usr/local/share/python/virtualenvwrapper.sh
fi

# Call 'ls -a' immediately after any 'cd'
function chpwd() {
    emulate -L zsh
    ls -a
}

# cd to directory by just typing name
setopt AUTO_CD
