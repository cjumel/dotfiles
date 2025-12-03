# Aliases for standard Unix commands or derived from them with light dependencies

# '--' means any following '-' is not to be interpreted as an option
alias -- -='cd -'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

function alias-list() {
    alias | grep "^$1"
}

alias al='alias'       # [AL]ias: list all aliases, or show an alias definition, or define a new alias
alias all='alias-list' # [AL]ias [L]ist: list all aliases starting with the argument

function alias-definition() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1=" ~/.config/zsh/aliases/
}
function alias-definition-fuzzy() {
    local selected_alias=$(rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/ | fzf --prompt="Alias > ")
    # shellcheck disable=SC2001
    selected_alias=$(echo "$selected_alias" | sed 's/^alias \([^=]*\)=.*/\1/')
    print -z "$selected_alias"
}
function alias-definition-list() {
    rg --no-filename --no-line-number --type zsh --max-depth 1 "^alias $1" ~/.config/zsh/aliases/
}

alias ald='alias-definition'        # [AL]ias [D]efinition: display the definition of an alias
alias aldf='alias-definition-fuzzy' # [AL]ias [D]efinition [F]uzzy: fuzzy search the definitions of aliases sharing a prefix
alias aldl='alias-definition-list'  # [AL]ias [D]efinition [L]ist: list the definitions of aliases sharing a prefix

alias cl='clear' # [CL]ear: clear the terminal screen

alias cpr='cp -r' # [C]o[P]y [R]ecursive: copy files and directories recursively

alias he='head' # [HE]ad: display the beginning of a file

alias la='ls -a'     # [L]ist [A]ll: list all files and directories (including hidden)
alias ll='ls -l'     # [L]ist [L]ong: list files and directories in long format
alias lla='ls -la'   # [L]ist [L]ong [A]ll: list all files and directories (including hidden) in long format
alias lr='ls -R'     # [L]ist [R]ecursive: list files and directories recursively
alias lra='ls -Ra'   # [L]ist [R]ecursive [A]ll: list all files and directories (including hidden) recursively
alias llr='ls -lR'   # [L]ist [L]ong [R]ecursive: list files and directories in long format recursively
alias llra='ls -lRa' # [L]ist [L]ong [R]ecursive [A]ll: list all files and directories (including hidden) in long format recursively

alias lns='ln -s'   # [L]i[N]k [S]ymbolic: create a symbolic link
alias lnsf='ln -sf' # [L]i[N]k [S]ymbolic [F]orce: create a symbolic link, overwriting the target if it exists

function lns-clean() {
    local dir=${1:-.}
    local broken_symlinks=$(find -L "$dir" -maxdepth 1 -type l)
    if [[ -z "$broken_symlinks" ]]; then
        echo "No broken symlinks found."
        return 0
    fi
    echo "Removing broken symlinks:"
    echo "$broken_symlinks"
    # Following line is taken from the `man find` page
    find -L "$dir" -maxdepth 1 -type l -exec rm -- {} +
}
function lns-clean-recursive() {
    local dir=${1:-.}
    local broken_symlinks=$(find -L "$dir" -type l)
    if [[ -z "$broken_symlinks" ]]; then
        echo "No broken symlinks found."
        return 0
    fi
    echo "Removing broken symlinks:"
    echo "$broken_symlinks"
    # Following line is taken from the `man find` page
    find -L "$dir" -type l -exec rm -- {} +
}

alias lnsc="lns-clean"            # [L]i[N]k [S]ymbolic [C]lean: clean broken symlinks in the target directory (default to current directory)
alias lnscr="lns-clean-recursive" # [L]i[N]k [S]ymbolic [C]lean [R]ecursive: clean broken symlinks recursively in the target directory and its subdirectories (default to current directory)

alias md='mkdir'     # [M]ake [D]irectory: create a directory
alias mdp='mkdir -p' # [M]ake [D]irectory [P]arent: create a directory along with all its parents directories

function mkdir-cd() {
    mkdir "$1"
    cd "$1" || exit
}
function mkdir-cd-parent() {
    mkdir -p "$1"
    cd "$1" || exit
}

alias mdc='mkdir-cd'         # [M]ake [D]irectory [C]d: create a directory & `cd` into it
alias mdcp='mkdir-cd-parent' # [M]ake [D]irectory [C]d [P]arent: create a nested directory along with all its parents & `cd` into it

alias mk='make'                  # [M]a[K]e: run a Make command
alias mki='make --ignore-errors' # [M]a[K]e [I]gnore errors: run a Make command, ignoring any error

alias op='open' # [OP]en: open a file or directory with the system default application

alias rmd='rm -d'   # [R]e[M]ove [D]irectory: remove an empty directory
alias rmf='rm -f'   # [R]e[M]ove [F]orce: remove a file, ignoring nonexistent files and never prompt
alias rmr='rm -r'   # [R]e[M]ove [R]ecursive: remove directories and their contents recursively
alias rmrf='rm -rf' # [R]e[M]ove [R]ecursive [F]orce: remove files and directories recursively, ignoring nonexistent files and never prompt

function source-venv() {
    local venv_path=${1:-.venv}
    if [[ -d "$venv_path" ]]; then
        source "$venv_path/bin/activate"
    else
        echo "Virtual environment directory '$venv_path' does not exist."
        return 1
    fi
}

alias so='source'            # [SO]urce: read and execute commands from a file in the current shell environment
alias sob='source ~/.bashrc' # [SO]urce [B]ash config: reload the Bash configuration file
alias sov='source-venv'      # [SO]urce [V]env: source the activate script of the specified virtual environment (".venv" by default)
alias soz='source ~/.zshrc'  # [SO]urce [Z]sh config: reload the Zsh configuration file

function touch-with-directories() {
    for file in "$@"; do
        dir=$(dirname "$file")
        mkdir -p "$dir"
        touch "$file"
    done
}

alias to='touch'                   # [TO]uch: create an empty file (or change a file timestamps if it already exists)
alias tod='touch-with-directories' # [TO]uch with [D]irectories: create an empty file along with its parent directories if they don't exist

alias ul='unlink' # [U]n[L]ink: remove a symbolic link

alias wi='which' # [W]h[I]ch: locate a program in the user's path

alias we='whence'     # [W]h[E]nce: show how a command would be interpreted
alias wef='whence -f' # [W]h[E]nce [F]unction: show the function definition of a command
