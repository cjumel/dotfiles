# Override the builtin `cat` with `bat`
alias cat='bat'

# Use `bat` to colorize the `man` pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
