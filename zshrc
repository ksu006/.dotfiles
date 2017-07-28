# Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export EDITOR=vim

export GOPATH=~/code/go
path=(~/.local/bin $GOPATH $GOPATH/bin $path)

# Discard older duplicate entries from history.
setopt HIST_IGNORE_ALL_DUPS

# Aliases
alias code='cd ~/code'
alias dl='cd ~/Downloads'
alias dot='cd ~/dotfiles'
alias g='git'

# zplug
export ZPLUG_HOME=~/.zplug
[ -d $ZPLUG_HOME ] || git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# zplug
# Manage zplug itself like other packages.
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh

# base16-shell
zplug "chriskempson/base16-shell", hook-load:"base16_default-dark"

# pure
zplug "sindresorhus/pure", use:"pure.zsh", as:theme
zplug "mafredri/zsh-async", on:"sindresorhus/pure"

# zsh-completions
zplug "zsh-users/zsh-completions"

# zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# fzf
# Command-line binary.
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
# Completion and key-bindings for zsh.
zplug "junegunn/fzf", use:"shell/*.zsh", on:"junegunn/fzf-bin", \
    hook-load:"export FZF_DEFAULT_OPTS='--exact'", defer:1  # Source plugin after 'lib/key-bindings'
                                                            # as they both rebind ctrl+r.
# Open fzf in tmux pane if running in tmux.
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux", on:"junegunn/fzf-bin", \
    hook-load:"export FZF_TMUX=1"

zplug load

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
