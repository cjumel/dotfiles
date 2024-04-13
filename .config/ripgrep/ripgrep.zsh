# [[ General options ]]

# Define the path of the configuration file
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

# [[ Alias features ]]

# Display the definition of the alias corresponding to the provided string
function rg_alias() {
    rg --no-filename --no-line-number --type zsh "^alias $1=" ~/.config/
}
# List the definitions of all the aliases starting with the provided string
function rg_alias_list() {
    rg --no-filename --no-line-number --type zsh "^alias $1" ~/.config/
}
# Search in the definitions of all the aliases with to the provided string
function rg_alias_search() {
    rg --no-filename --no-line-number --type zsh "^alias .*$1" ~/.config/
}

alias al='rg_alias'         # (ripgrep) Display the definition of the alias corresponding to the provided string
alias all='rg_alias_list'   # (ripgrep) List the definitions of all the aliases starting with the provided string
alias alg='rg_alias_search' # (ripgrep) Search the provided string in the definitions of all the aliases
