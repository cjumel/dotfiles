# Poetry: Python packaging and dependency management made easy

alias poa='poetry add'     # [PO]etry [A]dd: add new project dependencies
alias poag='poetry add -G' # [PO]etry [A]dd [G]roup: add new project dependencies in a dependency group passed as 1st argument

alias poc='poetry cache'                  # [PO]etry [C]ache: base cache command
alias pocl='poetry cache list'            # [PO]etry [C]ache [L]ist: list cache entries
alias pocc='poetry cache clear'           # [PO]etry [C]ache [C]lear: clear a cache entry by name
alias pocca='poetry cache clear --all ""' # [PO]etry [C]ache [C]lear [A]ll: clear all cache entries

alias poe='poetry env'                # [PO]etry [E]nv: base env command
alias poel='poetry env list'          # [PO]etry [E]nv [L]ist: list environments associated with the current project
alias poei='poetry env info'          # [PO]etry [E]nv [I]nfo: show information about the current environment & system
alias poeu='poetry env use'           # [PO]etry [E]nv [U]se: activates or creates a virtual environment for the current project
alias poer='poetry env remove'        # [PO]etry [E]nv [R]emove: remove an environment associated with the current project by name
alias poera='poetry env remove --all' # [PO]etry [E]nv [R]emove [A]ll: remove all environments associated with the current project

alias poi='poetry install' # [PO]etry [I]nstall: install the current project dependencies & code

alias poii='poetry init' # [PO]etry [I]n[I]t: initialize a new Poetry project

alias pol='poetry lock'              # [PO]etry [L]ock: update & lock the current project dependencies (but don't install them)
alias poln='poetry lock --no-update' # [PO]etry [L]ock [N]o-update: lock the current project dependencies (but don't update or install them)

alias pop='poetry publish'          # [PO]etry [P]ublish: publish a package to a remote repository without building it
alias popb='poetry publish --build' # [PO]etry [P]ublish [B]uild: build & publish a package to a remote repository

alias por='poetry run'             # [PO]etry [R]un: run a command using the current project Poetry environment
alias porp='poetry run python'     # [PO]etry [R]un [P]ython: start a Python shell or run a Python script using the current project Poetry environment
alias porpm='poetry run python -m' # [PO]etry [R]un [P]ython [M]odule: run a Python module using the current project Poetry environment

alias porm='poetry remove' # [PO]etry [R]e[M]ove: remove project dependencies

alias pos='poetry shell' # [PO]etry [S]hell: spawn a shell with the current project Poetry environment activated

alias pou='poetry update'       # [PO]etry [U]pdate: update the project dependencies
alias pouv='poetry update -vvv' # [PO]etry [U]pdate [V]erbose: update the project dependencies with maximal verbosity
