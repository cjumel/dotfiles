# General configuration
[ -f "$HOME/.config/zsh/config.zsh" ] && source "$HOME/.config/zsh/config.zsh"
[ -f "$HOME/.config/zsh/theme.zsh" ] && source "$HOME/.config/zsh/theme.zsh"

# Zinit and its plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" # Directory where zinit & its plugins will be stored
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
[ -f "$HOME/.config/zsh/plugins.zsh" ] && source "$HOME/.config/zsh/plugins.zsh" # Must be sourced before calling `compinit`

# Completion engine
autoload -Uz compinit
if [ "$(find "$HOME/.zcompdump" -mtime +1)" ]; then # Only check the cache once a day, to reduce startup time
    compinit
else
    compinit -C # Skip completion cache check
fi
zinit cdreplay -q # Actually run any compdef saved by zinit before compinit call

# Additional tool configurations (some of them must be called after `compinit`)
autoload -U add-zsh-hook # Enable hooks definitions for tool lazy-loading
tools=(bat dust eza fzf nvm pypoetry ripgrep tldr uv zoxide)
for tool in "${tools[@]}"; do
    [ -f "$HOME/.config/$tool/$tool.zsh" ] && source "$HOME/.config/$tool/$tool.zsh"
done

# Source alias directory (should be done near the end)
for file in "$HOME/.config/zsh/aliases/"*.zsh; do
    source "$file"
done

# Terminal prompt (should be called last)
[ -f "$HOME/.config/starship/starship.zsh" ] && source "$HOME/.config/starship/starship.zsh"
