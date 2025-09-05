alias cat='bat'
alias head='bat --line-range :10'

# Use `bat` to colorize the `man` pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
