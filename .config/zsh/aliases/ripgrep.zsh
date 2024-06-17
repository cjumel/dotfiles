# Display the definition of the alias corresponding to the provided string in the custom alias directory
function rg_alias_definition() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1=" ~/.config/oh-my-zsh/custom/
}
# Display the definitions of all the aliases corresponding to the provided string in the custom alias directory
function rg_alias_definition_list() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/oh-my-zsh/custom/
}
# Search in the definitions of all the aliases corresponding to the provided string in the custom alias directory
function rg_alias_definition_search() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias .*$1" ~/.config/oh-my-zsh/custom/
}

alias ad='rg_alias_definition'         # Alias definition: display the definition of the alias corresponding to the provided string in the custom alias directory
alias adl='rg_alias_definition_list'   # Alias definition list: display the definitions of all the aliases corresponding to the provided string in the custom alias directory
alias ads='rg_alias_definition_search' # Alias definition search: search in the definitions of all the aliases corresponding to the provided string in the custom alias directory
