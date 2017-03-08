# zplug packages
# See https://github.com/zplug/zplug

# zplug - Zsh plugin manager
# Manage zplug itself like other packages.
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh

# base16-shell - Syntax highlighting for hackers
zplug "chriskempson/base16-shell", hook-load:"base16_default-dark"

# pure - Pretty, minimal and fast zsh prompt
zplug "sindresorhus/pure"
zplug "mafredri/zsh-async", on:"sindresorhus/pure"

# zsh-completions - Additional completion definitions for zsh
zplug "zsh-users/zsh-completions"

# zsh-syntax-highlighting - Fish shell like syntax highlighting for zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# fzf - Command-line fuzzy finder
# Command-line binary.
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
# Completion and key-bindings for zsh.
zplug "junegunn/fzf", use:"shell/*.zsh", on:"junegunn/fzf-bin", \
    hook-load:"export FZF_DEFAULT_OPTS='--exact'", defer:1  # Source plugin after 'lib/key-bindings'
                                                            # as they both rebind ctrl+r.
# Open fzf in tmux pane if running in tmux.
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux", on:"junegunn/fzf-bin", \
    hook-load:"export FZF_TMUX=1"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
