# '--' means any following '-' is not to be interpreted as an option
alias -- -='cd -'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

function alias-ls() {
    alias | grep "^$1"
}
alias al='alias'     # [A][L]ias: list all aliases, or show an alias definition, or define a new alias
alias all='alias-ls' # [A][L]ias [L]ist: list all aliases starting with the argument

alias cl='clear' # [C][L]ear: clear the terminal screen

alias cpr='cp -r' # [C]o[P]y [R]ecursive: copy files and directories recursively

alias l='ls'       # [L]ist: list files in directory
alias la='ls -a'   # [L]ist [A]ll: list all files in directory, including hidden files
alias ll='ls -l'   # [L]ist [L]ong: list files in directory in long format
alias lla='ls -la' # [L]ist [L]ong [A]ll: list all files in directory in long format, including hidden files
alias lr='ls -R'   # [L]ist [R]ecursive: list files recursively in directory & sub-directories
alias lra='ls -Ra' # [L]ist [R]ecursive [A]ll: list all files recursively in directory & sub-directories, including hidden files

alias lj='luajit'

function lns-clean() {
    ARG1=${1:-.} # Default to current directory
    BROKEN_SYMLINKS=$(find -L "$ARG1" -maxdepth 1 -type l)
    if [ -z "$BROKEN_SYMLINKS" ]; then
        echo "No broken symlink found."
        return 0
    fi
    echo "Removing broken symlinks:"
    echo "$BROKEN_SYMLINKS"
    # Following line is taken from the `man find` page
    find -L "$ARG1" -maxdepth 1 -type l -exec rm -- {} +
}
function lns-clean-recursive() {
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
alias lns='ln -s'                 # [L]i[N]k [S]ymbolic: create a symbolic link
alias lnsf='ln -sf'               # [L]i[N]k [S]ymbolic [F]orce: create a symbolic link, overwriting the target if it exists
alias lnsc="lns-clean"            # [L]i[N]k [S]ymbolic [C]lean: clean broken symlinks in the target directory (default to current directory)
alias lnscr="lns-clean-recursive" # [L]i[N]k [S]ymbolic [C]lean [R]ecursive: clean broken symlinks recursively in the target directory and its subdirectories (default to current directory)

function mkdir-cd() {
    mkdir "$1"
    cd "$1" || exit
}
function mkdir-parent-cd() {
    mkdir -p "$1"
    cd "$1" || exit
}
alias md='mkdir'             # [M]ake [D]irectory: create a directory
alias mdc='mkdir-cd'         # [M]ake [D]irectory [C]d: create a directory & `cd` into it
alias mdp='mkdir -p'         # [M]ake [D]irectory [P]arent: create a directory along with all its parents directories
alias mdpc='mkdir-parent-cd' # [M]ake [D]irectory [P]arent [C]d: create a nested directory along with all its parents & `cd` into it

alias mk='make'                  # [M]a[K]e: run a Make command
alias mki='make --ignore-errors' # [M]a[K]e [I]gnore errors: run a Make command, ignoring any error

alias py='python'                      # [P][Y]thon: open a Python REPL or run a Python script
alias pyb='PYTHON_BASIC_REPL=1 python' # [P][Y]thon [B]asic-REPL: open a Python REPL with basic features (e.g. no auto-ident)
alias pym='python -m'                  # [P][Y]thon [M]odule: run a Python module

function rm-dir-all() {
    ARG1=${1:-.} # Default to current directory
    EMPTY_DIRECTORIES=$(find "$ARG1" -type d -empty)
    if [ -z "$EMPTY_DIRECTORIES" ]; then
        echo "No empty directory found."
        return 0
    fi
    echo "Removing empty directories (and any empty parent):"
    echo "$EMPTY_DIRECTORIES"
    find "$ARG1" -type d -empty -delete
}
alias rmd='rm -d'       # [R]e[M]ove [D]irectory: remove an empty directory
alias rmda='rm-dir-all' # [R]e[M]ove [D]irectory [A]ll: remove all empty directories in the target directory and its subdirectories (default to current directory)
alias rmf='rm -f'       # [R]e[M]ove [F]orce: remove a file, ignoring nonexistent files and never prompt
alias rmr='rm -r'       # [R]e[M]ove [R]ecursive: remove directories and their contents recursively
alias rmrf='rm -rf'     # [R]e[M]ove [R]ecursive [F]orce: remove files and directories recursively, ignoring nonexistent files and never prompt

alias so='source'            # [S][O]urce: read and execute commands from a file in the current shell environment
alias sob='source ~/.bashrc' # [S][O]urce [B]ash config: reload the Bash configuration file
alias soz='source ~/.zshrc'  # [S][O]urce [Z]sh config: reload the Zsh configuration file

alias to='touch' # [T]ouch: change file timestamps or create an empty file if it doesn't exist

alias uln='unlink' # [U]n[L]i[N]k: remove a symbolic link

alias wi='which' # [W]h[I]ch: locate a program in the user's path

alias we='whence'     # [W]h[E]nce: show how a command would be interpreted
alias wef='whence -f' # [W]h[E]nce [F]unction: show the function definition of a command
