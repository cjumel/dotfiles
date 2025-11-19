# [VE]nv: Python builtin virtual environment management

export PYTHON_VENV='python' # Python used to create a virtual environment

function venv_create() {
    if [ -z "$1" ]; then # No argument provided
        $PYTHON_VENV -m venv .venv
    else
        $PYTHON_VENV -m venv "$1"
    fi
}
function venv_activate() {
    if [ -z "$1" ]; then # No argument provided
        source .venv/bin/activate
    else
        source "$1"/bin/activate
    fi
}
function venv_create_and_activate() {
    if [ -z "$1" ]; then # No argument provided
        $PYTHON_VENV -m venv .venv
        source .venv/bin/activate
    else
        $PYTHON_VENV -m venv "$1"
        source "$1"/bin/activate
    fi
}
function venv_use() {
    if [ -z "$1" ]; then # No argument provided
        export PYTHON_VENV='python'
    else
        export PYTHON_VENV=$1
    fi
}

alias vea='venv_activate'             # [VE]nv [A]ctivate: activate the environment with the provided name (".venv" by default)
alias vec='venv_create'               # [VE]nv [C]reate: create a new environment with the provided name (".venv" by default)
alias veca='venv_create_and_activate' # [VE]nv [C]reate & [A]ctivate: create & activate a new environment with the provided name (".venv" by default)
alias ved='deactivate'                # [VE]nv [D]eactivate: deactivate the currently activated environment
alias veu='venv_use'                  # [VE]nv [U]se: use the provided Python command to create environment ("python" by default), similarly to `poetry env use`
