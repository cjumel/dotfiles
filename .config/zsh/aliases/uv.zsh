# [UV]: a fast Python package & project manager

alias uva='uv add'        # [UV] [A]dd: add new project dependencies
alias uvad='uv add --dev' # [UV] [A]dd [D]ev: add new project development dependencies

alias uvi='uv init'                      # [UV] [I]nit: initialize a new uv project
alias uvil='uv init --lib'               # [UV] [I]nit [L]ib: initialize a new uv lib project
alias uvilp='uv init --lib --python'     # [UV] [I]nit [L]ib [P]ython: initialize a new uv lib project with the specified Python version
alias uvip='uv init --package'           # [UV] [I]nit [P]ackage: initialize a new uv package project
alias uvipp='uv init --package --python' # [UV] [I]nit [P]ackage [P]ython: initialize a new uv package project with the specified Python version

alias uvl='uv lock'            # [UV] [L]ock: lock the current project dependencies
alias uvlu='uv lock --upgrade' # [UV] [L]ock [U]pgrade: upgrade the lock file dependencies (this doesn't affect the current project environment, though)

alias uvrm='uv remove'        # [UV] [R]e[M]ove: remove project dependencies
alias uvrmd='uv remove --dev' # [UV] [R]e[M]ove [D]ev: remove project developement dependencies

alias uvru='uv run'             # [UV] [RU]n: run a Python command using the current project uv environment
alias uvrup='uv run python'     # [UV] [RU]n [P]ython: start a Python shell or run a Python script using the current project uv environment
alias uvrupm='uv run python -m' # [UV] [RU]n [P]ython [M]odule: run a Python module using the current project uv environment

alias uvs='uv sync' # [UV] [S]ync: synchronize the current project uv environement dependencies

alias uvt='uv tool'             # [UV] [T]ool: base command for managing uv tools
alias uvti='uv tool install'    # [UV] [T]ool [I]nstall: install commands provided by a Python package
alias uvtl='uv tool list'       # [UV] [T]ool [L]ist: list installed tools
alias uvtr='uv tool run'        # [UV] [T]ool [R]un: run a command provided by a Python package
alias uvtui='uv tool uninstall' # [UV] [T]ool [U]n[I]nstall: uninstall a tool
alias uvtup='uv tool upgrade'   # [UV] [T]ool [U]pgrade: upgrade installed tools

alias uvv='uv venv' # [UV] [V]env: create a new uv virtual environment for the current project
