# [P][O]etry: Python dependency management & packaging tool

alias poa='poetry add'     # [A]dd: add new project dependencies
alias poag='poetry add -G' # [A]dd [G]roup: add new project dependencies in a dependency group passed as 1st argument

alias poc='poetry cache'                  # [C]ache: base cache command
alias pocl='poetry cache list'            # [C]ache [L]ist: list cache entries
alias pocc='poetry cache clear'           # [C]ache [C]lear: clear a cache entry by name
alias pocca='poetry cache clear --all ""' # [C]ache [C]lear [A]ll: clear all cache entries

alias poe='poetry env'                # [E]nv: base env command
alias poel='poetry env list'          # [E]nv [L]ist: list environments associated with the current project
alias poei='poetry env info'          # [E]nv [I]nfo: show information about the current environment & system
alias poeu='poetry env use'           # [E]nv [U]se: activates or creates a virtual environment for the current project
alias poer='poetry env remove'        # [E]nv [R]emove: remove an environment associated with the current project by name
alias poera='poetry env remove --all' # [E]nv [R]emove [A]ll: remove all environments associated with the current project

alias poi='poetry install' # [I]nstall: install the current project dependencies & code

alias poii='poetry init' # [I]n[I]t: initialize a new Poetry project

alias pol='poetry lock'              # [L]ock: update & lock the current project dependencies (but don't install them)
alias poln='poetry lock --no-update' # [L]ock [N]o-update: lock the current project dependencies (but don't update or install them)

alias pop='poetry publish'          # [P]ublish: publish a package to a remote repository without building it
alias popb='poetry publish --build' # [P]ublish [B]uild: build & publish a package to a remote repository

alias porm='poetry remove' # [R]e[M]ove: remove project dependencies

alias poru='poetry run'                    # [R][U]n: run a command using the current project Poetry environment
alias porujl='poetry run jupyter lab'      # [R][U]n [J]upyter [L]ab: start a Jupyter lab server using the current project Poetry environment
alias porujn='poetry run jupyter notebook' # [R][U]n [J]upyter [N]otebook: start a Jupyter notebook server using the current project Poetry environment
alias porup='poetry run python'            # [R][U]n [P]ython: start a Python shell or run a Python script using the current project Poetry environment
alias porupm='poetry run python -m'        # [R][U]n [P]ython [M]odule: run a Python module using the current project Poetry environment

alias pos='poetry shell' # [S]hell: spawn a shell with the current project Poetry environment activated

alias pou='poetry update'       # [U]pdate: update the project dependencies
alias pouv='poetry update -vvv' # [U]pdate [V]erbose: update the project dependencies with maximal verbosity
