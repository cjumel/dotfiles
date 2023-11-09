alias vi='nvim'
alias vif='nvim $(fdzf)'
alias vifh='nvim $(fdzfh)'
alias vip='poetry run nvim'

alias qn='nvim ./notes.md'
alias qp='nvim ./temp.py'

alias vic='rm -rf ~/.local/share/nvim/' # Clear nvim cache
function vil(){  # Link nvim config to the input **absolute** path
  rm -f ~/.config/nvim
  ln -s $1 ~/.config/nvim
}
