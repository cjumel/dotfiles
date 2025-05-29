# Core aliases, for builtin commands

alias ad='alias_definition'       # [A]lias [D]efinition: display the definition of the alias corresponding to the argument
alias adf='alias_definition_fzf'  # [A]lias [D]efinition [F]uzzy-find: fuzzy-find in the definitions of the aliases starting by the argument
alias adl='alias_definition_list' # [A]lias [D]efinition [L]ist: list the definitions of the aliases starting by the argument

alias al='alias'       # [A]lias: list all aliases, or show an alias definition, or define a new alias
alias all='alias_list' # [A]lias [L]ist: list all aliases starting with the argument

alias ca='cat'

alias c='cd'

# Shortcuts for changing directories taken from oh-my-zsh
# '--' means any following '-' is not to be interpreted as an option
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

alias cl='clear'

alias cpr='cp -r'

alias ct='change_theme' # [C]hange [T]heme: prompt the user to select a new terminal theme & set it up

alias lj='luajit'

alias l='ls'     # List: list files in directory
alias la='ls -a' # List all: list files in directory, including hidden files

alias lr='ls -R'   # List recursive: list files recursively in directory & sub-directories
alias lra='ls -Ra' # List recursive all: list files recursively in directory & sub-directories, including hidden files

alias ll='ls -l'   # List long: list files in long format
alias lla='ls -la' # List long all: list files in long format, including hidden files

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

# Call the man page on the content of an alias
# This function will replace white spaces in the alias content (e.g. "git status") by hyphens (e.g. making the previous example
# "git-status"), as this is how `man` deals with sub-commands
function man_alias() {
    alias_definition=$(alias "$1") # Of the form "l=ls" or "l='ls'" (without the surrounding double quotes)
    alias_length=${#1}             # Length of the alias itself (e.g. 1 for "l=ls")

    alias_content="${alias_definition:$alias_length+1}" # Remove the alias definition prefix (e.g. "l=")
    alias_content="${alias_content%\'}"                 # Remove the trailing single quote if any
    alias_content="${alias_content#\'}"                 # Remove the leading single quote if any
    alias_content=$(echo "$alias_content" | tr " " "-") # Replace white spaces by hyphens

    man "$alias_content"
}

alias ma='man'        # [MA]n: show the manual page of a command
alias maa='man_alias' # [MA]n [A]lias: show the manual page of the content of an alias

function mdc() {
    mkdir "$1"
    cd "$1" || exit
}
function mdpc() {
    mkdir -p "$1"
    cd "$1" || exit
}
alias md='mkdir'     # Create a single directory
alias mdc='mdc'      # [C]d: create a directory & `cd` into it
alias mdp='mkdir -p' # [P]arent: create a nested directory along with all its parents
alias mdpc='mdpc'    # [P]arent [C]d: create a nested directory along with all its parents & `cd` into it

alias mk='make'                           # [M][K]e: run a Make command
alias mki='make install'                  # [M][K]e [I]nstall: run the Make `install` command
alias mkt='make test'                     # [M][K]e [T]est: run the Make `test` command
alias mkti='make install --ignore-errors' # [M][K]e [I]nstall: run the Make `install` command, without stopping on errors

alias p='pwd'

alias py='python'                      # [P][Y]thon: open a Python REPL or run a Python script
alias pyb='PYTHON_BASIC_REPL=1 python' # [P][Y]thon [B]asic-REPL: open a Python REPL with basic features (e.g. no auto-ident)
alias pym='python -m'                  # [P][Y]thon [M]odule: run a Python module
alias pyv='python --version'           # [P][Y]thon [V]ersion: show the Python version

function clean_empty_directories() {
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

alias rmd='rm -d'
alias rmda='clean_empty_directories'
alias rmf='rm -f'
alias rmr='rm -r'
alias rmrf='rm -rf'

alias so='source'
alias soz='source ~/.zshrc'

alias to='touch'

alias uln='unlink'

alias v='vi'  # Open Vim
alias vv='v'  # Same as `v`, in case the key is sticky
alias vvv='v' # Same as `v`, in case the key is sticky

alias wi='which'       # [W]h[I]ch: locate a program in the user's path
alias we='whence'      # [W]h[E]nce: show how a command would be interpreted
alias wef='whence -f'  # [W]h[E]nce [F]unction: show the function definition of a command
alias wk='/bin/cat -v' # [W]hich [K]ey: show interactively which key code is received by the terminal when typing keys
