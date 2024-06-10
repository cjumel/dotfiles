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

alias ad='rg_alias'         # Alias definition: display the definition of the alias corresponding to the provided string
alias adl='rg_alias_list'   # Alias definition list: list the definitions of all the aliases starting with the provided string
alias ads='rg_alias_search' # Alias definition search: search the provided string in the definitions of all the aliases
