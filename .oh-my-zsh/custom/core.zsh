function al(){ alias | grep "^$1" }  # List aliases starting with the input string
function alf(){ functions | grep "^$1" }  # List functions starting with the input string
alias alup='
    cd ~/dotfiles
    git add .oh-my-zsh/custom
    git commit -m ":wrench: Update aliases"
    git push
    1
    source ~/.zshrc
'

alias clr='clear'

alias duh='du -d 1 -h 2>/dev/null'
alias duhbig='du -d 1 -h -t1G 2>/dev/null'

alias sc='screen'

alias so='source'

alias to='touch'

alias vi='nvim'
alias vinote='nvim ~/Desktop/notes.txt'

alias xt='exit'
