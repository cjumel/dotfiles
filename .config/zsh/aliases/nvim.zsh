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

alias vi='nvim_contextual' # Open Neovim with contextual setup
alias vic='nvim --clean'   # [C]lean: open Neovim without any custom configuration
alias vis='nvim'           # [S]kip: open Neovim without contextual setup
