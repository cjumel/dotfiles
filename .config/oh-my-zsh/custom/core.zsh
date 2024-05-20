alias ca='cat'

alias c='cd'

alias cl='clear'

alias lj='luajit'

function clean_broken_symlinks() {
    ARG1=${1:-.} # Default to current directory
    BROKEN_SYMLINKS=$(find -L "$ARG1" -type l)
    if [ -z "$BROKEN_SYMLINKS" ]; then
        echo "No broken symlink found."
        return 0
    fi
    echo "Removing broken symlinks:"
    echo "$BROKEN_SYMLINKS"
    # Following line is taken from the `man find` page
    find -L "$ARG1" -type l -exec rm -- {} +
}
alias lns='ln -s'                  # Create a symbolic link
alias lnsf='ln -sf'                # Create a symbolic link, overwriting the target if it exists
alias lnsc="clean_broken_symlinks" # Clean broken symlinks in the target directory (default to current directory)

alias ma='man'

alias md='mkdir'
alias mdp='mkdir -p'

alias p='pwd'

alias py='python'

alias rmd='rm -d'
alias rmf='rm -f'
alias rmr='rm -r'
alias rmrf='rm -rf'

alias so='source'
alias soz='source ~/.zshrc'

alias to='touch'

alias uln='unlink'

alias v='vi'  # Open Vi editor (or any editor aliased to "vi")
alias vv='v'  # Alias to `v`, for when the key is sticky
alias vvv='v' # Alias to `v`, for when the key is sticky

alias wi='which'
alias we='whence'
alias wk='/bin/cat -v' # Which key: show which key code is received when pressing keys
