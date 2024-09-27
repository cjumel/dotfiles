# Start nvim depending on the directory content
function nvim_contextual() {
    if [ -e poetry.lock ]; then
        poetry run nvim "$@"
    else
        nvim "$@"
    fi
}

alias vi='nvim_contextual'              # Open Neovim with contextual setup
alias vic='nvim --clean'                # [C]lean: open Neovim without any custom configuration
alias vil='NVIM_LIGHT_MODE=true nvim'   # [L]ight: open Neovim in light mode
alias vis='nvim'                        # [S]kip: open Neovim but skip contextual setup
alias vix='rm -rf ~/.local/share/nvim/' # Discard: delete Neovim local files (not configuration files); useful to re-install Neovim from scratch
