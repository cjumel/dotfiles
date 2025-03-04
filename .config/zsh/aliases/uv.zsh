# [U][V]: a fast Python package & project manager

alias uva='uv add'        # [A]dd: add new project dependencies
alias uvad='uv add --dev' # [A]dd [D]ev: add new project development dependencies

alias uvi='uv init'        # [I]nit: initialize a new uv project
alias uvil='uv init --lib' # [I]nit [L]ib: initialize a new uv lib project

alias uvl='uv lock' # [L]ock: lock the current project dependencies

alias uvrm='uv remove'        # [R]e[M]ove: remove project dependencies
alias uvrmd='uv remove --dev' # [R]e[M]ove [D]ev: remove project developement dependencies

alias uvru='uv run'                    # [R][U]n: run a Python command using the current project uv environment
alias uvrujl='uv run jupyter lab'      # [R][U]n [J]upyter [L]ab: start a Jupyter lab server using the current project uv environment
alias uvrujn='uv run jupyter notebook' # [R][U]n [J]upyter [N]otebook: start a Jupyter notebook server using the current project uv environment
alias uvrup='uv run python'            # [R][U]n [P]ython: start a Python shell or run a Python script using the current project uv environment

alias uvs='uv sync' # [S]ync: synchronize the current project uv environement dependencies

alias uvt='uv tree' # [T]ree: view the current project dependency tree

alias uvv='uv venv' # [V]env: create a new uv virtual environment for the current project
