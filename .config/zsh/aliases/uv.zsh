# [U][V]: a fast Python package & project manager

alias uva='uv add'        # [A]dd: add new project dependencies
alias uvad='uv add --dev' # [A]dd [D]ev: add new project development dependencies

alias uvi='uv init'        # [I]nit: initialize a new uv project
alias uvil='uv init --lib' # [I]nit [L]ib: initialize a new uv lib project

alias uvl='uv lock'            # [L]ock: lock the current project dependencies
alias uvlu='uv lock --upgrade' # [L]ock [U]pgrade: upgrade & lock the current project dependencies

alias uvrm='uv remove'        # [R]e[M]ove: remove project dependencies
alias uvrmd='uv remove --dev' # [R]e[M]ove [D]ev: remove project developement dependencies

alias uvru='uv run'             # [R][U]n: run a Python command using the current project uv environment
alias uvrup='uv run python'     # [R][U]n [P]ython: start a Python shell or run a Python script using the current project uv environment
alias uvrupm='uv run python -m' # [R][U]n [P]ython [M]odule: run a Python module using the current project uv environment

alias uvs='uv sync' # [S]ync: synchronize the current project uv environement dependencies

alias uvt='uv tool'             # [T]ool: base command for managing uv tools
alias uvti='uv tool install'    # [T]ool [I]nstall: install commands provided by a Python package
alias uvtl='uv tool list'       # [T]ool [L]ist: list installed tools
alias uvtr='uv tool run'        # [T]ool [R]un: run a command provided by a Python package
alias uvtui='uv tool uninstall' # [T]ool [U]n[I]nstall: uninstall a tool
alias uvtup='uv tool upgrade'   # [T]ool [U]pgrade: upgrade installed tools

alias uvv='uv venv' # [V]env: create a new uv virtual environment for the current project
