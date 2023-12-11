alias vi='nvim'

# Open a directory in nvim with fuzzy finding
alias vid='nvim $((echo "./"; fddd) | fz)'
alias vidh='nvim $((echo "./"; fdddh) | fz)'

# Open a file in nvim with fuzzy finding
alias vif='nvim $(fddf| fz)'
alias vifh='nvim $(fddfh| fz)'

alias vip='poetry run nvim'

alias qn='nvim ./notes.md'
