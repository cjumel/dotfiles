# Start nvim depending on the directory content
function nvim_contextual() {
    if [ -e poetry.lock ]; then
        poetry run nvim "$@"
    else
        nvim "$@"
    fi
}

alias vi='nvim_contextual'                           # Open Neovim with contextual setup
alias vic='nvim --clean'                             # Open a clean Neovim instance, without any user configuration
alias vil='nvim_contextual -c":e#<1"'                # Open Neovim on the last edited file
alias vin='nvim -c "Neogit"'                         # Open directly Neogit in Neovim
alias vis='nvim'                                     # Open Neovim and skip contextual setup
alias vix='echo "Would remove ~/.local/share/nvim/"' # Dry-run for deleting Neovim local files (not configuration files)
alias vixf='rm -rf ~/.local/share/nvim/'             # Delete Neovim local files (not configuration files); useful to re-install Neovim from scratch
