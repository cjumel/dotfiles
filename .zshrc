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

# Setup oh-my-zsh
[ -f ~/.config/oh-my-zsh/oh-my-zsh.zsh ] && source ~/.config/oh-my-zsh/oh-my-zsh.zsh

# [[ Key bindings ]]

# Descrease the time out after pressing a key to remove the delay after pressing escape
KEYTIMEOUT=1

# Make <C-p>/<C-n> filter with the terminal entry when browsing the history
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Use escape to clear the screen
bindkey "\e" clear-screen

# Add <C-%> & <C-`> (on my keyboard) to move backward & forward word by word respectively
bindkey "^^" backward-word
bindkey "^_" forward-word

# [[ Aliases ]]
# Meta aliases. For other aliases, see in `./config/zsh/oh-my-zsh`

# List all aliases starting with the prefix passed as argument using grep
function alias_grep_list() {
    alias | grep "^$1"
}

alias al='alias' # Without argument, list all aliases, otherwise define a new alias
alias all='alias_grep_list'

# [[ Additional configuration scripts ]]
# The following will run configuration scripts for additional tools, but only if the files exist

[ -f ~/.config/bat/bat.zsh ] && source ~/.config/bat/bat.zsh
[ -f ~/.config/dust/dust.zsh ] && source ~/.config/dust/dust.zsh
[ -f ~/.config/eza/eza.zsh ] && source ~/.config/eza/eza.zsh
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/.config/ipython/ipython.zsh ] && source ~/.config/ipython/ipython.zsh
[ -f ~/.config/starship/starship.zsh ] && source ~/.config/starship/starship.zsh
[ -f ~/.config/tldr/tldr.zsh ] && source ~/.config/tldr/tldr.zsh
[ -f ~/.config/zoxide/zoxide.zsh ] && source ~/.config/zoxide/zoxide.zsh
