# [[ Alias definition ]]
# Provide an alternative to the builtin `alias` command & its derivatives, to show the whole alias definition instead of the mere alias content
# This has the benefit of also displaying any documentation written with the alias
# This implementation only show aliases defined in the `~/.config/zsh/aliases/` directory, not all of them (unlike the builtin `alias` comand)

# Display the definition of the alias corresponding to the provided string in the alias directory
function rg_alias_definition() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1=" ~/.config/zsh/aliases/
}
# Display the definitions of all the aliases corresponding to the provided string in the alias directory
function rg_alias_definition_list() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/
}
# Search in the definitions of all the aliases corresponding to the provided string in the alias directory
function rg_alias_definition_search() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias .*$1" ~/.config/zsh/aliases/
}

alias ad='rg_alias_definition'         # Alias definition: display the definition of the alias corresponding to the provided string in the custom alias directory
alias adl='rg_alias_definition_list'   # Alias definition list: display the definitions of all the aliases corresponding to the provided string in the custom alias directory
alias ads='rg_alias_definition_search' # Alias definition search: search in the definitions of all the aliases corresponding to the provided string in the custom alias directory
