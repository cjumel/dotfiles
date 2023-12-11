function al(){ alias | grep "^$1" }  # List aliases starting with the input string

alias cd='HOME=~/Code/ cd'

# Navigation with cd & fuzzy finding
alias cf='cd $((echo "./"; fddd) | fz)'
alias cfh='cd $((echo "./"; fdddh) | fz)'  # Include hidden files

function fu(){ functions | grep "^$1" }  # List functions starting with the input string

alias lns='ln -s'

alias lsa='ls -a'

alias md='mkdir'
alias mdp='mkdir -p'

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
