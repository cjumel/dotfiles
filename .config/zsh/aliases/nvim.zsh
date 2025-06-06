# N[V][I]m: a modern Vim-based text editor

# Start Neovim with additionnal setup, depending on the current directory context
function nvim_contextual() {
    # Python project with a standard virtual environment named `.venv`
    if [ -d .venv ]; then
        (source .venv/bin/activate && nvim "$@") # Run in a subshell, to disable the environment afterwards

    # Python project managed with Poetry
    # This command is quite slow so let's favor the standard virtual environment, even if it might not be as accurate to
    # detect the right environment for the Poetry project
    elif [ -e poetry.lock ]; then
        poetry run nvim "$@"

    # Python project managed with uv
    elif [ -e uv.lock ]; then
        uv run nvim "$@"

    else
        nvim "$@"
    fi
}

function nvim_cleanup() {
    rm -rf ~/.local/share/nvim/
    rm -rf ~/.local/state/nvim/
}

alias vi='nvim_contextual'                            # Open Neovim with contextual setup
alias via='NVIM_ENABLE_ALL_PLUGINS=1 nvim_contextual' # [A]ll-plugins: open Neovim with all plugins enabled, for updating purposes
alias vic='nvim --clean'                              # [C]lean: open Neovim without any custom configuration
alias vicu='nvim_cleanup'                             # [C]lean [U]p: clean up all Neovim user data
alias vid='nvim -d'                                   # [D]iff: open Neovim in diff mode, to compare several files
alias vis='nvim'                                      # [S]kip: open Neovim without contextual setup
