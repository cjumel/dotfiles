# [[ General options ]]

# Define the path of the configuration file
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

# [[ Alias features ]]

# Find the first line of the alias definition for the single alias corresponding to the provided string
function rg_alias() {
    rg --no-filename --no-line-number --type zsh "^alias $1=" ~/.config/
}
# Find the first line of the alias definitions for all aliases starting with the provided string
rg_alias_list() {
    rg --no-filename --no-line-number --type zsh "^alias $1" ~/.config/
}

alias al='rg_alias'       # (ripgrep) Show the alias definition for the single alias corresponding to the provided string
alias all='rg_alias_list' # (ripgrep) Show the alias definitions for all aliases starting with the provided string
