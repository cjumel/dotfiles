# Start nvim depending on the directory content
function nvim_contextual() {
    if [ -e poetry.lock ]; then
        poetry run nvim "$@"
    else
        nvim "$@"
    fi
}

alias vi='nvim_contextual' # Open Neovim with contextual setup
alias vis='nvim'           # Open Neovim and skip contextual setup
