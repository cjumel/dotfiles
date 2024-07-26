# List all aliases starting with the prefix passed as argument using grep
function alias_grep_list() {
    alias | grep "^$1"
}

alias al='alias'            # Alias: list all aliases if no argument, or show an alias definition, or define a new alias
alias all='alias_grep_list' # Alias list: list all aliases starting with the prefix passed as argument using grep

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

alias md='mkdir'
alias mdp='mkdir -p'

alias mk='make'                  # Make: base command
alias mki='make --ignore-errors' # Make ignore: don't stop on errors (exit code won't report failure either)

alias p='pwd'

alias py='python'

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

alias v='vi'  # Open Vi editor (or any editor aliased to "vi")
alias vv='v'  # Alias to `v`, for when the key is sticky
alias vvv='v' # Alias to `v`, for when the key is sticky

alias wi='which' # [W]h[I]ch: locate a program in the user's path

alias we='whence'     # [W]h[E]nce: show how a command would be interpreted
alias wef='whence -f' # [W]h[E]nce [F]unction: show the function definition of a command

# List all custom terminal-level hidden mappings (meaning they cannot be seen otherwise simply by typing them)
function which_key_custom() {
    echo "<C-[> corresponds to <C-^> on my keyboard (equivalent to escape)"
    echo "<C-]> corresponds to <C-$> on my keyboard"
    echo "<C-?> corresponds to <C-ù> on my keyboard (equivalent to delete)"
    echo "<C-\\> corresponds to <C-\`> on my keyboard"
    echo "<C-^> corresponds to <C-,> on my keyboard"
    echo "<C-_> corresponds to <C-;> on my keyboard (same as <C-/>)"
}

alias wk='/bin/cat -v'       # [W]hich [K]ey: show interactively which key code is received by the terminal when typing keys
alias wkc='which_key_custom' # [W]hich [K]ey [C]ustom: show the custom terminal-level mappings
