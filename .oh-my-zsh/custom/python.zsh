alias jnb='jupyter notebook'

alias mkd='mkdocs serve'

alias pte='pytest'
alias ptex='pytest --exitfirst'
alias ptef='pytest -m "not slow"'
alias ptefx='pytest -m "not slow" --exitfirst'
alias ptes='pytest -m "slow"'
alias ptesx='pytest -m "slow" --exitfirst'

alias py='python'

function vea(){ source "$1/bin/activate" }  # Activate an environemnt
alias veav='source .venv/bin/activate'
alias vec='python3 -m venv'  # Create a venv environment
alias vecv='python3 -m venv .venv'
alias ved='deactivate'  # Deactivate an environment
