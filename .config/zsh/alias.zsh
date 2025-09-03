# [[ Alias ]]

# List all aliases starting with the argument, using grep
function alias-ls() {
    alias | grep "^$1"
}

# Display the definition of the alias corresponding to the argument in the aliases directory
function alias-def() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1=" ~/.config/zsh/aliases/
}

# Display the definitions of the aliases prefixed by the argument in the aliases directory
function alias-def-ls() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/
}

# Fuzzy-find in the definitions of the aliases prefixed by the argument in the aliases directory
function alias-def-search() {
    selected_alias=$(rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/ | fzf --prompt="Alias > ")
    # shellcheck disable=SC2001
    selected_alias=$(echo "$selected_alias" | sed 's/^alias \([^=]*\)=.*/\1/')
    print -z "$selected_alias"
}
