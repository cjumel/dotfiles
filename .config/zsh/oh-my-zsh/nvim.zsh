# Start nvim depending on the directory content
function nvim_contextual(){
  if [ -e poetry.lock ]
  then
    poetry run nvim $@
  else
    nvim $@
  fi
}

alias vi='nvim_contextual'
alias vid='nvim_contextual .' # open current directory

alias vis='nvim' # skip contextual setup
alias visd='nvim .' # open current directory
