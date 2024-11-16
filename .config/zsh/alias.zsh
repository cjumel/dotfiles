# [[ Alias ]]

# List all aliases starting with the argument, using grep
function alias_list() {
    alias | grep "^$1"
}

# [[ Alias definition ]]
# Define an alternative to the builtin `alias` command to show the whole alias definition instead of the mere alias content, displaying any
# comment written with the alias. This implementation, however, only show aliases defined in the `~/.config/zsh/aliases/` directory, unlike
# the builtin `alias` comand. It relies on both `ripgrep` and `fzf`.

# Display the definition of the alias corresponding to the argument in the aliases directory
function alias_definition() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1=" ~/.config/zsh/aliases/
}

# Display the definitions of the aliases prefixed by the argument in the aliases directory
function alias_definition_list() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/
}

# Search for the argument in the definitions of the aliases in the aliases directory
function alias_definition_search() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias .*$1" ~/.config/zsh/aliases/
}
