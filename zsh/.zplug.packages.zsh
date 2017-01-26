zplug "chriskempson/base16-shell", use:"scripts/base16-ir-black.sh", defer:1
zplug "junegunn/fzf", use:"shell/*.zsh", on:"junegunn/fzf-bin", defer:1
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, defer:1
zplug "lib/*", from:oh-my-zsh
zplug "mafredri/zsh-async", on:"sindresorhus/pure", defer:1
zplug "sindresorhus/pure", defer:1
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "zsh-users/zsh-completions", defer:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
