# `-T` is not an option of the builtin `ls` command, hence these aliases are only valid when `ls` is aliased to `eza`. The `eza` options
#   defined in the `ls` alias will be propagated to the aliases below.
alias lt='ls -T'   # [L]ist [T]ree: list files in directory & its sub-directories in a tree-like format
alias lta='ls -Ta' # [L]ist [T]ree [A]ll: list files in directory & its sub-directories in a tree-like format, including hidden files
