# Navigation but fuzzily
alias fz='cd $((echo "./"; fd . --type d) | fzf --layout reverse)'
alias fzh='cd $((echo "./"; fd . --type d --hidden) | fzf --layout reverse)'
