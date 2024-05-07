# Start nvim depending on the directory content
function nvim_contextual() {
    if [ -e poetry.lock ]; then
        poetry run nvim "$@"
    else
        nvim "$@"
    fi
}

alias vi='nvim_contextual'              # Open Neovim with contextual setup
alias vic='rm -rf ~/.local/share/nvim/' # Clear Neovim files
alias vil='nvim_contextual -c":e#<1"'   # Open Neovim on the last edited file
alias vis='nvim'                        # Open Neovim and skip contextual setup
