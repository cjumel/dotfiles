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

function bind(){ ssh -N -f -L localhost:$2:localhost:$3 $1 }

alias clr='clear'

function copy-to(){ rsync -r $2 $1:$3 }  # $1: user@host; $2: local path; $3: remote path
function copy-from(){ rsync -r $1:$2 $3 }  # $1: user@host; $2: remote path; $3: local path

alias duh='du -d 1 -h 2>/dev/null'
alias duhbig='du -d 1 -h -t1G 2>/dev/null'

alias xt='exit'

function pc(){ open -na "PyCharm.app" --args "$1" }
alias pcdot='open -na "PyCharm.app" --args ~/dotfiles/'

alias sc='screen'
alias scls='screen -ls'  # List current sessions

alias src='source'

alias tch='touch'

alias tm='tmux'
alias tma='tmux attach'
alias tmls='tmux ls'

alias vi='nvim'
alias vidot='nvim ~/dotfiles'
