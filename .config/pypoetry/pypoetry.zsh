# [[ Global configuration ]]

# Change the Poetry configuration directory
export POETRY_CONFIG_DIR="$HOME/.config/pypoetry"

# [[ Aliases ]]

alias poa='poetry add'     # Add: add new dependencies
alias poag='poetry add -G' # Add group: specify a dependency group (1st argument) & add new dependencies to it

alias poc='poetry cache'
alias pocc='poetry cache clear --all .'

alias poe='poetry env'
alias poei='poetry env info'
alias poel='poetry env list'
alias poer='poetry env remove'
alias poeu='poetry env use'

alias poi='poetry install'

alias poii='poetry init'

alias pol='poetry lock'              # Lock the dependencies of the pyproject.toml with latest versions but don't install them
alias poln='poetry lock --no-update' # Lock without updating the dependencies to latest versions

alias popb='poetry publish'
alias popbb='poetry publish --build'

alias popi='poetry pin'

alias porm='poetry remove' # Remove: remove dependencies

alias poru='poetry run'          # Run: run a command in the virtual environment
alias porupy='poetry run python' # Run Python: run a Python shell or script in the virtual environment

alias pos='poetry shell'

alias pou='poetry update'
alias pouv='poetry update -vvv'
