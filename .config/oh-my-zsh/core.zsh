function al(){ alias | grep "^$1" }  # List aliases starting with the input string

alias cd='HOME=~/Code/ cd'

alias duh='du -d 1 -h 2>/dev/null'
alias duhbig='du -d 1 -h -t1G 2>/dev/null'

function fu(){ functions | grep "^$1" }  # List functions starting with the input string

alias lns='ln -s'

alias lsa='ls -a'

alias md='mkdir'
alias mdp='mkdir -p'

alias pch='open -na PyCharm --args .'

alias rmd='rm -d'
alias rmf='rm -f'
alias rmr='rm -r'
alias rmrf='rm -rf'

alias so='source'
alias soz='source ~/.zshrc'

alias to='touch'

alias wi='which'
alias we='whence'
