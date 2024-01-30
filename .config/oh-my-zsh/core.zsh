# List aliases starting with the input string
function alias_by_start(){ alias | grep "^$1" }
alias al='alias_by_start'

alias cdp='cd -' # Go to previous directory

alias cl='clear'

alias lns='ln -s'

alias lsa='ls -a'

alias md='mkdir'
alias mdp='mkdir -p'

alias py='python'

alias rmd='rm -d'
alias rmf='rm -f'
alias rmr='rm -r'
alias rmrf='rm -rf'

alias so='source'
alias soz='source ~/.zshrc'

alias to='touch'

alias uln='unlink'

alias wi='which'
alias we='whence'
