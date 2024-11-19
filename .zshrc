# General configuration
[ -f ~/.config/zsh/config.zsh ] && source ~/.config/zsh/config.zsh

# Additional shell features
[ -f ~/.config/zsh/alias.zsh ] && source ~/.config/zsh/alias.zsh
[ -f ~/.config/zsh/theme.zsh ] && source ~/.config/zsh/theme.zsh

# Aliases (defined ./.config/zsh/aliases/)
for file in ~/.config/zsh/aliases/*.zsh; do
  source "$file"
done

# Zinit setup
# Zinit is a modern plugin manager for zsh, at the same time simple, powerful & very fast
# `ZINIT_HOME` is the directory where zinit & its plugins will be stored; if this directory doesn't exist, this will clone zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins (must be defined before calling `compinit`)
[ -f ~/.config/zsh/plugins.zsh ] && source ~/.config/zsh/plugins.zsh

# Initialize completion system
# Let's only check the compinit cache once a day, to reduce the startup time
# Source: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
autoload -Uz compinit
if [ "$(find ~/.zcompdump -mtime +1)" ]; then
  compinit
fi
compinit -C

# Actually run any compdef saved by zinit before compinit call
zinit cdreplay -q

# Additional tool configuration scripts
[ -f ~/.config/bat/bat.zsh ] && source ~/.config/bat/bat.zsh                     #
[ -f ~/.config/dust/dust.zsh ] && source ~/.config/dust/dust.zsh                 #
[ -f ~/.config/eza/eza.zsh ] && source ~/.config/eza/eza.zsh                     #
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh                     #
[ -f ~/.config/gh/config.zsh ] && source ~/.config/gh/config.zsh                 #
[ -f ~/.config/pypoetry/pypoetry.zsh ] && source ~/.config/pypoetry/pypoetry.zsh #
[ -f ~/.config/ripgrep/ripgrep.zsh ] && source ~/.config/ripgrep/ripgrep.zsh     #
[ -f ~/.config/zoxide/zoxide.zsh ] && source ~/.config/zoxide/zoxide.zsh         # Must be called after `compinit`

# Terminal prompt
[ -f ~/.config/starship/starship.zsh ] && source ~/.config/starship/starship.zsh
