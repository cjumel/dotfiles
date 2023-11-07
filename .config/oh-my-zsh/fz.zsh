# Find files and directories fuzzyily with fd and fzf
# These aliases don't do anything on their own but can be passed as variable in a command or in
# other aliases, for instance with 'cd $(fdzd)'
alias fdz='fd . | fzf --layout reverse'
alias fdzh='fd . --hidden | fzf --layout reverse'
alias fdzd='(echo "."; fd . --type d) | fzf --layout reverse' # Extended with the current directory
alias fdzdh='(echo "."; fd . --type d --hidden) | fzf --layout reverse' # Extended with the current directory
alias fdzf='fd . --type f | fzf --layout reverse'
alias fdzfh='fd . --type f --hidden | fzf --layout reverse'

# Navigation but fuzzily
alias fz='cd $(fdzd)'
alias fzh='cd $(fdzdh)'

# Copy but fuzzily
alias cpf='cp $(fdz) $(fdzd)'
alias cpfh='cp $(fdzh) $(fdzdh)'

# Move but fuzzily
alias mvf='mv $(fdz) $(fdzd)'
alias mvfh='mv $(fdzh) $(fdzdh)'
