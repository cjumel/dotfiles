# Zoxide defines `z` & `zi` commands
alias cd='z'   # Change directory: change directory with zoxide
alias cdi='zi' # Change directory interactively: change directory with zoxide; if several matches are available, suggest them with `fzf`

# `c` is globally aliases to `cd`, let's do the same with `ci` to `cdi`
alias ci='cdi' # Change directory interactively: change directory with zoxide; if several matches are available, suggest them with `fzf`
