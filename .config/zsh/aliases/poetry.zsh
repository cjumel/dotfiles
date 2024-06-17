alias poa='poetry add'     # Add: add new dependencies
alias poag='poetry add -G' # Add group: specify a dependency group (1st argument) & add new dependencies to it

alias poc='poetry cache'                  # Cache: base cache command, does nothing by itself
alias pocl='poetry cache list'            # Cache list: list cache entries
alias pocc='poetry cache clear'           # Cache clear: clear a cache entry by name
alias pocca='poetry cache clear --all ""' # Cache clear all: clear all cache entries

alias poe='poetry env'                # Env: base env command, does nothing by itself
alias poel='poetry env list'          # Env list: list environments associated with the current project
alias poei='poetry env info'          # Env info: show information about the current environment & system
alias poeu='poetry env use'           # Env use: activates or creates a virtual environment for the current project
alias poer='poetry env remove'        # Env remove: remove an environment associated with the current project by name
alias poera='poetry env remove --all' # Env remove all: remove all environments associated with the current project

alias poi='poetry install' # Install: install the environment's dependencies & root code

alias pol='poetry lock'              # Lock: update & lock the project dependencies but don't install them
alias poln='poetry lock --no-update' # Lock no-update: lock the project dependencies but don't update or install them

alias popb='poetry publish'          # Publish: publish a package to a remote repository without building it
alias popbb='poetry publish --build' # Publish build: build & publish a package to a remote repository

alias porm='poetry remove' # Remove: remove dependencies

alias poru='poetry run'          # Run: run a command in the virtual environment
alias porupy='poetry run python' # Run Python: run a Python shell or script in the virtual environment

alias pos='poetry shell' # Shell: spawn a shell with the current environment activated

alias pou='poetry update'       # Update: update the project dependencies
alias pouv='poetry update -vvv' # Update verbose: update the project dependencies with maximal verbosity
