# [NV]im: a modern Vim-based text editor

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

alias nv='nvim_contextual'                                  # [NV]im: open Neovim with contextual setup
alias nva='NVIM_ENABLE_ALL_PLUGINS=1 nvim_contextual'       # [NV]im [A]ll-plugins: open Neovim with all plugins enabled, for updating purposes
alias nvb='nvim'                                            # [NV]im [B]are: open Neovim without contextual setup
alias nvc='nvim --clean'                                    # [NV]im [C]lean: open Neovim without any custom configuration
alias nvcu='nvim_cleanup'                                   # [NV]im [C]lean[U]p: clean up all Neovim user data
alias nvd='nvim -d'                                         # [NV]im [D]iff: open Neovim in diff mode, to compare several files
alias nvi='NVIM_ENABLE_ALL_PLUGINS=1 nvim +MasonInstallAll' # [NV]im [I]nstall: open Neovim and install everything that needs to be installed

# [L]ua[J]it: a Just-In-Time Compiler for Lua programming language

alias lj='luajit' # [L]ua[J]it: run a the Lua Just-In-Time Compiler
