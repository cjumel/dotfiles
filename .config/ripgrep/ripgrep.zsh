# [[ General options ]]

# Define the path of the configuration file
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

# [[ Alias features ]]

# Show the alias definition line for the single alias corresponding to the provided string
function rg_alias() {
    rg --no-filename --no-line-number "^alias $1=" ~/.config/oh-my-zsh/custom/
}
# Show the alias definition lines for aliases starting with the provided string
rg_alias_list() {
    rg --no-filename --no-line-number "^alias $1" ~/.config/oh-my-zsh/custom/
}

alias al='rg_alias'       # Show the alias definition line for the single alias corresponding to the provided string
alias all='rg_alias_list' # Show the alias definition lines for aliases starting with the provided string
