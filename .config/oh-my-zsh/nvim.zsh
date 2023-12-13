alias vi='nvim'

alias vid='nvim .'

# Neovim with fuzzy finding
alias vif='nvim $((echo "./"; fdd) | fz)'
alias vifh='nvim $((echo "./"; fddh) | fz)'

alias vip='poetry run nvim'

alias qn='nvim ./notes.md'
