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
function venv_use() {
    if [ -z "$1" ]; then # No argument provided
        export PYTHON_VENV='python'
    else
        export PYTHON_VENV=$1
    fi
}

alias vec='venv_create'   # [C]reate: create a new environment with the provided name (".venv" by default)
alias vea='venv_activate' # [A]ctivate: activate the environment with the provided name (".venv" by default)
alias ved='deactivate'    # [D]eactivate: deactivate the currently activated environment
alias veu='venv_use'      # [U]se: use the provided Python command to create environment ("python" by default), similarly to `poetry env use`
