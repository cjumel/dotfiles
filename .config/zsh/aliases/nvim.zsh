# N[V][I]m: a modern Vim-based text editor

# Start Neovim with additionnal setup, depending on the current directory context
function nvim_contextual() {
    if [ -e poetry.lock ]; then                  # Python project managed with Poetry
        poetry run nvim "$@"                     #
    elif [ -e uv.lock ]; then                    # Python project managed with uv
        uv run nvim "$@"                         #
    elif [ -d .venv ]; then                      # Python project with a standard virtual environment
        (source .venv/bin/activate && nvim "$@") # Run in a subshell, to disable the environment afterwards
    else
        nvim "$@"
    fi
}

# Override the default `vi` command
alias vi='nvim_contextual'              # Open Neovim with contextual setup
alias vic='nvim --clean'                # [C]lean: open Neovim without any custom configuration
alias vil='NVIM_LIGHT_MODE=true nvim'   # [L]ight: open Neovim in light mode
alias vis='nvim'                        # [S]kip: open Neovim without contextual setup
alias vix='rm -rf ~/.local/share/nvim/' # Discard: delete Neovim local files (not configuration files); useful to re-install Neovim from scratch
