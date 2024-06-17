# General configuration
[ -f ~/.config/zsh/config.zsh ] && source ~/.config/zsh/config.zsh

# Plugins (must be before calling `compinit`)
[ -f ~/.config/zsh/plugins.zsh ] && source ~/.config/zsh/plugins.zsh

# Aliases (they are defined in `.zsh` files within `./.config/zsh/aliases/`)
for file in ~/.config/zsh/aliases/*.zsh; do
    source "$file"
done

# Initialize `zsh` completion system
# Let's only check the `compinit` cache once a day; this reduces a bit the startup time
# Source: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
autoload -Uz compinit
if [ "$(find ~/.zcompdump -mtime +1)" ] ; then
    compinit
fi
compinit -C

# Additional tool configuration scripts
[ -f ~/.config/bat/bat.zsh ] && source ~/.config/bat/bat.zsh                     #
[ -f ~/.config/dust/dust.zsh ] && source ~/.config/dust/dust.zsh                 #
[ -f ~/.config/eza/eza.zsh ] && source ~/.config/eza/eza.zsh                     #
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh                     #
[ -f ~/.config/ipython/ipython.zsh ] && source ~/.config/ipython/ipython.zsh     #
[ -f ~/.config/pypoetry/pypoetry.zsh ] && source ~/.config/pypoetry/pypoetry.zsh #
[ -f ~/.config/ripgrep/ripgrep.zsh ] && source ~/.config/ripgrep/ripgrep.zsh     #
[ -f ~/.config/zoxide/zoxide.zsh ] && source ~/.config/zoxide/zoxide.zsh         # Must be called after `compinit`

# Terminal prompt
[ -f ~/.config/starship/starship.zsh ] && source ~/.config/starship/starship.zsh
