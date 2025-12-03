# Alias related to builtin Python features

# [[ Deactivate ]]

alias da='deactivate' # [D]e[A]ctivate: deactivate the currently activated virtual environment

# [[ Pip ]]

function pip-freeze-requirements() {
    local output_file=${1:-requirements.txt}
    if [[ -f "$output_file" ]]; then
        echo "Output file '$output_file' already exists"
        return 1
    fi
    pip freeze >"$output_file"
}

alias pif='pip freeze'               # [PI]p [F]reeze: output installed packages in requirements format
alias pifr='pip-freeze-requirements' # [PI]p [F]reeze [R]equirements: output installed packages in a requirements file (requirements.txt by default)

function pip-install-requirements() {
    local requirements_file=${1:-requirements.txt}
    if [[ ! -f "$requirements_file" ]]; then
        echo "Requirements file '$requirements_file' does not exist."
        return 1
    fi
    pip install -r "$requirements_file"
}

alias pii='pip install'               # [PI]p [I]nstall: install a package
alias piie='pip install -e'           # [PI]p [I]nstall [E]ditable: install a local package in editable mode
alias piir='pip-install-requirements' # [PI]p [I]nstall [R]equirements: install packages from a requirements file (requirements.txt by default)
alias piiu='pip install --upgrade'    # [PI]p [I]nstall [U]pgrade: upgrade a package

alias pil='pip list' # [PI]p [L]ist: list installed packages

alias pis='pip show' # [PI]p [S]how: show installed package information

alias piu='pip uninstall' # [PI]p [U]ninstall: uninstall a package

# [[ Python ]]

alias py='python'     # [PY]thon: open a Python REPL or run a Python script
alias pym='python -m' # [PY]thon [M]odule: run a Python module

function python-venv() {
    local python_version=${1:-3}
    local venv_name=${2:-.venv}
    local python_cmd="python${python_version}"
    if [[ -d "$venv_name" ]]; then
        echo "Directory '$venv_name' already exists."
        return 1
    fi
    if ! command -v "$python_cmd" &>/dev/null; then
        echo "Python command '$python_cmd' not found."
        return 1
    fi
    "$python_cmd" -m venv "$venv_name"
}
function python-venv-activate() {
    python-venv "$1" "$2" || return 1
    source "${2:-.venv}/bin/activate"
}

alias pyv='python-venv'           # [PY]thon [V]env: create a new virtual environment with the specified Python version (3 by default) and name (".venv" by default)
alias pyva='python-venv-activate' # [PY]thon [V]env [A]ctivate: create & activate a new virtual environment with the specified Python version (3 by default) and name (".venv" by default)
