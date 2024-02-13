# [[ General ]]

# Manually set language environment
export LANG=en_US.UTF-8

# Prepend to $PATH
# - the `$HOME/.local` part comes from fd's installation guide
# - the `/usr/local/opt/python` part comes from brew when installing Python
export PATH="$HOME/.local/bin:/usr/local/opt/python/libexec/bin:$PATH"

# Command history settings
# Limit number of entries in memory
HISTSIZE=200000
# Limit number of entries in the history file (should be equal or lower as in memory)
SAVEHIST=100000

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
ZSH_CUSTOM=$HOME/.config/zsh/oh-my-zsh/

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
# Meta aliases. For other aliases, see in `./config/zsh/oh-my-zsh`

# List all aliases starting with the prefix passed as argument if any
function alias_grep(){
  alias | grep "^$1"
}

# Fuzzy find aliases and paste selected alias to command line
function alias_fzf_select(){
  selected_line=$(alias | fzf)

  # Exit if nothing is selected
  if [[ -z $selected_line ]]; then
    return
  fi

  # Extract the alias name from the selected line (selected line has the format "alias=command")
  selected_alias=${selected_line%%=*}

  # Paste the alias to the command line
  print -z $selected_alias
}

# Fuzzy find alias files and open the selected one with vi
function alias_fzf_edit(){
  # Use builtin ls even if eza is aliased to ls
  selected_file=$(command ls $ZSH_CUSTOM | fzf)

  # Exit if nothing is selected
  if [[ -z $selected_file ]]; then
    return
  fi

  vi $ZSH_CUSTOM/$selected_file
}

alias al='alias'
alias all='alias_grep' # Alias list

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

function themes_fzf(){
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
  # Source tmux configuration to apply the new theme (also work outside tmux)
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

# Setup fzf additional features like key bindings or auto-completion
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh

# Custom aliases using fzf
alias th='themes_fzf'
alias alf='alias_fzf_select' # Alias fuzzy-find
alias ale='alias_fzf_edit' # Alias edit

# [[ zoxide ]]
# NOTE: remove this section if zoxide is not installed or to disable it

eval "$(zoxide init --cmd cd zsh)"

# [[ Starship ]]
# NOTE: remove this section if Starship is not installed or to disable it

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

eval "$(starship init zsh)"
