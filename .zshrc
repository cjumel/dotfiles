# General configuration
autoload -U add-zsh-hook # Enable hooks definitions
[ -f "$HOME/.config/zsh/config.zsh" ] && source "$HOME/.config/zsh/config.zsh"

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
# Only check the cache once a day, to reduce startup time; to manually refresh cache, run `rm -f ~/.zcompdump; compinit`
if [ "$(find "$HOME/.zcompdump" -mtime +1)" ]; then
    compinit
else
    compinit -C # Skip cache check
fi
zinit cdreplay -q # Actually run any compdef saved by zinit before compinit call

# Additional tool configurations (some of them must be called after `compinit`)
tools=(bat dust eza fzf gh nvm opencode pypoetry ripgrep tldr tmux uv zoxide)
for tool in "${tools[@]}"; do
    [ -f "$HOME/.config/$tool/$tool.zsh" ] && source "$HOME/.config/$tool/$tool.zsh"
done

# Source alias file (should be done near the end)
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# Terminal prompt (should be called last)
# shellcheck disable=SC1094
[ -f "$HOME/.config/starship/starship.zsh" ] && source "$HOME/.config/starship/starship.zsh"
