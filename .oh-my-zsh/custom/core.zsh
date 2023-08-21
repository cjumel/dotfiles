function al(){ alias | grep "^$1" }  # List aliases starting with the input string
function alf(){ functions | grep "^$1" }  # List functions starting with the input string

alias clr='clear'

alias duh='du -d 1 -h 2>/dev/null'
alias duhbig='du -d 1 -h -t1G 2>/dev/null'

alias fz='cd $(fd . --type d | fzf)'

alias no='nvim ./notes.txt'

alias pch='open -na PyCharm --args .'

alias so='source'
alias soz='source ~/.zshrc'

alias to='touch'

alias vi='nvim'
