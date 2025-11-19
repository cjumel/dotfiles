# [AL]ias [D]efinition: an alternative way to check aliases including their description comment, using ripgrep and fzf

function alias-def() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1=" ~/.config/zsh/aliases/
}
function alias-def-ls() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/
}
function alias-def-search() {
    selected_alias=$(rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/ | fzf --prompt="Alias > ")
    # shellcheck disable=SC2001
    selected_alias=$(echo "$selected_alias" | sed 's/^alias \([^=]*\)=.*/\1/')
    print -z "$selected_alias"
}

alias ald='alias-def'         # [AL]ias [D]efinition: display the definition of an alias
alias aldl='alias-def-ls'     # [AL]ias [D]efinition [L]ist: list the definitions of aliases sharing a prefix
alias alds='alias-def-search' # [AL]ias [D]efinition [S]earch: fuzzy search the definitions of aliases sharing a prefix
