# Aliases for core commands

alias -- -='cd -' # '--' means any following '-' is not to be interpreted as an option
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

function aliaslist() {
    alias | grep "^$1"
}
alias al='alias'
alias all='aliaslist'

alias bra='brew autoremove'
alias brc='brew cleanup'
alias bri='brew install'
alias brif='brew info'
alias brl='brew list'
alias brlv='brew leaves'
alias bro='brew outdated'
alias brp='brew pin'
alias brr='brew reinstall'
alias brs='brew search'
alias brsl='brew services list'
alias brss='brew services start'
alias brsst='brew services stop'
alias brud='brew update'
alias brug='brew upgrade'
alias brui='brew uninstall'
alias brup='brew unpin'

alias cl='clear'

function changetheme() {
    local themes="default
catppuccin-macchiato
catppuccin-mocha
catppuccin-frappe
catppuccin-latte
everforest-dark
everforest-light
gruvbox-dark
gruvbox-material
gruvbox-light
kanagawa-wave
kanagawa-dragon
kanagawa-lotus
onedark
onelight
rose-pine-moon
rose-pine-main
rose-pine-dawn
tokyonight-moon
tokyonight-night
tokyonight-storm
tokyonight-day"
    local selected_theme=$(echo "$themes" | fzf --prompt="Themes > " --no-sort)
    if [[ -z $selected_theme ]]; then
        return
    fi
    ln -sf "$HOME/.config/wezterm/theme/$selected_theme.lua" "$HOME/.config/wezterm/theme/current.lua"
    ln -sf "$HOME/.config/tmux/theme/tmux-$selected_theme.conf" "$HOME/.config/tmux/theme/tmux-current.conf"
    ln -sf "$HOME/.config/nvim/lua/config/theme/$selected_theme.lua" "$HOME/.config/nvim/lua/config/theme/current.lua"
}
alias ct='changetheme'

alias da='deactivate'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gci='git check-ignore'
alias gcle='git clean'
alias gclo='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gi='git init'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'
alias grb='git rebase'
alias grm='git rm'
alias grs='git reset'
alias grt='git restore'
alias grv='git revert'
alias gs='git status'
alias gsh='git show'
alias gst='git stash'
alias gsta='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstps='git stash push'
alias gsts='git stash show'
alias gsw='git switch'
alias gt='git tag'
alias gw='git worktree'
alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwr='git worktree remove'

alias he='head'

alias hi='history'

function mkdircd() {
    mkdir "$@"
    local dir
    for arg in "$@"; do
        if [[ "$arg" != -* ]]; then
            dir="$arg"
            break
        fi
    done
    cd "$dir" || exit
}
alias md='mkdir'
alias mdc='mkdircd'

alias mk='make'

alias npa='npm add'
alias npi='npm install'
alias npl='npm list'
alias npr='npm run'
alias nprm='npm remove'

alias op='open'

alias pif='pip freeze'
alias pii='pip install'
alias pil='pip list'
alias pis='pip show'
alias piu='pip uninstall'

function pythonvenv() {
    local python_version=${1:-3}
    local venv_name=${2:-.venv}
    local python_cmd="python${python_version}"
    if [[ -d "$venv_name" ]]; then
        echo "Directory '$venv_name' already exists."
        return 1
    fi
    if ! command -v "$python_cmd" &>/dev/null; then
        echo "Python command '$python_cmd' not found."
        return 1
    fi
    "$python_cmd" -m venv "$venv_name"
}
alias py='python'
alias pyv='pythonvenv'

function rmbrokensymlinks() {
    local recursive=0
    local dir="."
    while [[ $# -gt 0 ]]; do
        case "$1" in
        -r)
            recursive=1
            shift
            ;;
        *)
            dir="$1"
            shift
            ;;
        esac
    done
    local find_opts=(-L "$dir")
    [[ $recursive -eq 0 ]] && find_opts+=(-maxdepth 1)
    find_opts+=(-type l)
    local broken_symlinks=$(find "${find_opts[@]}")
    if [[ -z "$broken_symlinks" ]]; then
        echo "No broken symlinks found."
        return 0
    fi
    echo "Removing broken symlinks:"
    echo "$broken_symlinks"
    find "${find_opts[@]}" -exec rm -- {} + # Line taken from the `man find` page
}
alias rbs="rmbrokensymlinks"

alias rd='rmdir'

function sourcevenv() {
    local venv_path=${1:-.venv}
    if [[ -d "$venv_path" ]]; then
        source "$venv_path/bin/activate"
    else
        echo "Virtual environment directory '$venv_path' does not exist."
        return 1
    fi
}
alias so='source'
alias sob='source ~/.bashrc'
alias sov='sourcevenv'
alias soz='source ~/.zshrc'

function touchdirs() {
    for file in "$@"; do
        dir=$(dirname "$file")
        mkdir -p "$dir"
        touch "$file"
    done
}
alias to='touch'
alias tod='touchdirs'

alias ul='unlink'

alias vi='nvim'
alias vii='NVIM_ENABLE_ALL_PLUGINS=1 nvim +MasonInstallAll' # Install mode

alias wi='which'

alias we='whence'

alias zid='zinit delete'
alias zis='zinit status'
alias zisu='zinit self-update'
alias ziu='zinit update'
