alias jnb='jupyter notebook'

alias pte='pytest'
alias ptefast='pytest -m "not slow"'
alias pteslow='pytest -m "slow"'

alias py='python'

function vea(){ source "$1/bin/activate" }  # Activate an environemnt
alias veav='source .venv/bin/activate'
alias vec='python3 -m venv'  # Create a venv environment
alias vecv='python3 -m venv .venv'
alias ved='deactivate'  # Deactivate an environment
