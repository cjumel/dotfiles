# [[ General ]]

# Manually set language environment
export LANG=en_US.UTF-8

# Prepend to $PATH
# - the `$HOME/.local` part comes from fd's installation guide
# - the `/usr/local/opt/python` part comes from brew when installing Python
export PATH="$HOME/.local/bin:/usr/local/opt/python/libexec/bin:$PATH"

# [[ Oh My Zsh ]]
# See full configuration template at:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path where zsh dumps files to speed up completion
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Set name of the theme to load. See: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# The oh-my-zsh theme will be used only if the Starship prompt is not
ZSH_THEME="robbyrussell" # Default theme

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/oh-my-zsh/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# [[ Key bindings ]]

# Descrease the time out after pressing a key to remove the delay after pressing escape
KEYTIMEOUT=1

# Make <C-p>/<C-n> filter with the terminal entry when browsing the history
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Use escape to clear the screen
bindkey "\e" clear-screen

# Add <C-m> & <C-%> (with Karabiner remaps) to move forward & backward word by word
bindkey "^_" forward-word
bindkey "^^" backward-word

# [[ Aliases ]]
# Meta aliases. For other aliases, see `./config/oh-my-zsh`

# List all aliases starting with a given prefix
function alias_grep(){
  alias | grep "^$1"
}
alias al='alias_grep'

# [[ Terminal themes ]]
# Manage themes for WezTerm, Tmux, and Neovim at the same time

TERMINAL_THEMES='catppuccin-frappe
catppuccin-macchiato
catppuccin-mocha
catppuccin-latte
gruvbox-dark
gruvbox-light
kanagawa
nord
rose-pine
rose-pine-dawn
rose-pine-moon
tokyonight'

function fzf_themes(){
  # Make the user select a theme using fzf among the available ones
  selected_theme=$(echo $TERMINAL_THEMES| fzf)

  # Exit if no theme is selected, to avoid creating broken symlinks
  if [[ -z $selected_theme ]]; then
    return
  fi

  # Create symlinks to the selected theme (overwrite existing ones)
  ln -sf ~/.config/wezterm/themes/$selected_theme.lua ~/.config/wezterm/theme.lua
  ln -sf ~/.config/tmux/themes/$selected_theme.conf ~/.config/tmux/theme.conf
  ln -sf ~/.config/tmux/themes/$selected_theme-post.conf ~/.config/tmux/theme-post.conf
  ln -sf ~/.config/nvim/lua/themes/$selected_theme.lua ~/.config/nvim/lua/theme.lua

  # WezTerm will detect the change and reload automatically; otherwise, it can be reloaded manually
  # with Cmd+R
  # Neovim will be updated automatically when restarting it
  # Source tmux configuration to apply the new theme
  tmux source ~/.config/tmux/tmux.conf
}

# [[ Terminal utilities ]]
# NOTE: remove lines of this section if the relevant tool is not installed or to disable it

alias cat='bat'
alias du='dust'
alias ls='eza'
alias tl='tldr'

# [[ fzf ]]
# NOTE: remove this section if fzf is not installed or to disable it

# Change layout of fzf
export FZF_DEFAULT_OPTS='--layout=reverse --border'

# Use fd for the default fzf command
export FZF_DEFAULT_COMMAND='fd . --hidden --exclude .git'

# Use fd for fzf key bindings
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

# Change the trigger for fzf auto-completion
export FZF_COMPLETION_TRIGGER='^'

# Use fd for fzf auto-completion
_fzf_compgen_path() {
  fd --hidden --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --exclude ".git" . "$1"
}

# Setup fzf additional features like key bindings or auto-completion
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
# Enable the use of <Alt-c> as fzf key binding
bindkey "©" fzf-cd-widget

# Alias to fuzzy find and select a terminal theme
alias th='fzf_themes'

# [[ zoxide ]]
# NOTE: remove this section if zoxide is not installed or to disable it

eval "$(zoxide init --cmd cd zsh)"

# [[ Starship ]]
# NOTE: remove this section if Starship is not installed or to disable it

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

eval "$(starship init zsh)"
