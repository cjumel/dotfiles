# General zsh configuration
[ -f ~/.config/zsh/config.zsh ] && source ~/.config/zsh/config.zsh

# Setup oh-my-zsh
[ -f ~/.config/oh-my-zsh/oh-my-zsh.zsh ] && source ~/.config/oh-my-zsh/oh-my-zsh.zsh

# Custom aliases
# Aliases are defined in `.zsh` files within `./.config/zsh/aliases/`
for file in ~/.config/zsh/aliases/*.zsh; do
    source "$file"
done

# Additional tool configuration scripts
[ -f ~/.config/bat/bat.zsh ] && source ~/.config/bat/bat.zsh
[ -f ~/.config/dust/dust.zsh ] && source ~/.config/dust/dust.zsh
[ -f ~/.config/eza/eza.zsh ] && source ~/.config/eza/eza.zsh
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/.config/ipython/ipython.zsh ] && source ~/.config/ipython/ipython.zsh
[ -f ~/.config/pypoetry/pypoetry.zsh ] && source ~/.config/pypoetry/pypoetry.zsh
[ -f ~/.config/ripgrep/ripgrep.zsh ] && source ~/.config/ripgrep/ripgrep.zsh
[ -f ~/.config/zoxide/zoxide.zsh ] && source ~/.config/zoxide/zoxide.zsh

# Terminal prompt
[ -f ~/.config/starship/starship.zsh ] && source ~/.config/starship/starship.zsh
