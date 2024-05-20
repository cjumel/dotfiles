# Disable unused variables diagnostics (used by oh-my-zsh)
# shellcheck disable=SC2034

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
ZSH_CUSTOM=$HOME/.config/oh-my-zsh/custom/

# Specify plugins to load
# Standard plugins can be found in $ZSH/plugins/, while custom ones may be added to $ZSH_CUSTOM/plugins/
# zsh-syntax-highlighting provides highlighting of commands while typing, indicating for instance valid and invalid ones
# zsh-autosuggestions provides virtual text suggestions based on the history of commands
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# zsh-completions provides additional completion for a variety of CLI tools; it can't be installed properly using oh-my-zsh regular plugin
# system, instead the following line must be added before `source "$ZSH"/oh-my-zsh.sh`
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

bindkey '^y' autosuggest-accept # Keymap for zsh-autosuggestions

source "$ZSH"/oh-my-zsh.sh
