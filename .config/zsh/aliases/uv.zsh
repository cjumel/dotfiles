# uv: an extremely fast Python package and project manager, written in Rust.

alias uva='uv add'        # [UV] [A]dd: add dependencies to the project
alias uvad='uv add --dev' # [UV] [A]dd [D]ev: add development dependencies to the project

alias uvi='uv init'            # [UV] [I]nit: create a new project
alias uvil='uv init --lib'     # [UV] [I]nit [L]ib: create a new library project
alias uvip='uv init --package' # [UV] [I]nit [P]ackage: create a new package project

alias uvl='uv lock'            # [UV] [L]ock: update the project lock file
alias uvlu='uv lock --upgrade' # [UV] [L]ock [U]pgrade: upgrade packages and update the project lock file

function uv-pip-install-requirements() {
    local requirements_file=${1:-requirements.txt}
    if [[ ! -f "$requirements_file" ]]; then
        echo "Requirements file '$requirements_file' does not exist."
        return 1
    fi
    uv pip install -r "$requirements_file"
}

alias uvp='uv pip'                        # [UV] [P]ip: base command for managing project packages with the Pip interface
alias uvpi='uv pip install'               # [UV] [P]ip [I]nstall: install a package
alias uvpie='uv pip install -e'           # [UV] [P]ip [I]nstall [E]ditable: install a local package in editable mode
alias uvpir='uv-pip-install-requirements' # [UV] [P]ip [I]nstall [R]equirements: install packages from a requirements file (requirements.txt by default)
alias uvpiu='uv pip install --upgrade'    # [UV] [P]ip [I]nstall [U]pgrade: upgrade a package
alias uvpl='uv pip list'                  # [UV] [P]ip [L]ist: list installed packages
alias uvps='uv pip show'                  # [UV] [P]ip [S]how: show installed package information
alias uvpu='uv pip uninstall'             # [UV] [P]ip [U]ninstall: uninstall a package

alias uvpy='uv python'          # [UV] [PY]thon: manage Python versions and installations
alias uvpyi='uv python install' # [UV] [PY]thon [I]nstall: install a specific Python version
alias uvpyl='uv python list'    # [UV] [PY]thon [L]ist: list Python versions

alias uvr='uv run'             # [UV] [R]un: run a Python command using the current project uv environment
alias uvrp='uv run python'     # [UV] [R]un [P]ython: start a Python shell or run a Python script using the current project uv environment
alias uvrpm='uv run python -m' # [UV] [R]un [P]ython [M]odule: run a Python module using the current project uv environment

alias uvrm='uv remove'        # [UV] [R]e[M]ove: remove project dependencies
alias uvrmd='uv remove --dev' # [UV] [R]e[M]ove [D]ev: remove project developement dependencies

alias uvs='uv sync' # [UV] [S]ync: synchronize the current project uv environement dependencies

alias uvt='uv tool'             # [UV] [T]ool: base command for managing uv tools
alias uvti='uv tool install'    # [UV] [T]ool [I]nstall: install commands provided by a Python package
alias uvtl='uv tool list'       # [UV] [T]ool [L]ist: list installed tools
alias uvtr='uv tool run'        # [UV] [T]ool [R]un: run a command provided by a Python package
alias uvtui='uv tool uninstall' # [UV] [T]ool [U]n[I]nstall: uninstall a tool
alias uvtup='uv tool upgrade'   # [UV] [T]ool [U]pgrade: upgrade installed tools

alias uvv='uv venv'           # [UV] [V]env: create a new uv virtual environment for the current project
alias uvvp='uv venv --python' # [UV] [V]env [P]ython: create a new uv virtual environment for the current project with the specified Python version
