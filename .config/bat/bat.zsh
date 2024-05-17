# Colorize the man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias cat='bat' # Override the builtin `cat`
