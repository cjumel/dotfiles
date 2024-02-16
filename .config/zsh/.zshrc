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

alias al='alias'
alias all='alias_grep' # Alias list

# [[ Terminal utilities ]]
# NOTE: remove lines of this section if the relevant tool is not installed or to disable it

alias cat='bat'
alias du='dust'
alias ls='eza'
alias tl='tldr'

# [[ fzf ]]

# If fzf setup file exists, setup fzf additional features like key bindings or auto-completion
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh

# [[ zoxide ]]
# NOTE: remove this section if zoxide is not installed or to disable it

eval "$(zoxide init --cmd cd zsh)"

# [[ Starship ]]
# NOTE: remove this section if Starship is not installed or to disable it

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

eval "$(starship init zsh)"
