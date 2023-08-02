alias dkapp='open -a "Docker"'
alias dkclean='
  echo "docker stop $(docker ps -a -q)..."; docker stop $(docker ps -a -q)
  echo "docker container prune --force..."; docker container prune --force
  echo "docker volume prune --force..."; docker volume prune --force
  echo "docker image prune --all --force..."; docker image prune --all --force
  echo "docker system prune --all --force..."; docker system prune --all --force
'

alias dkc='docker-compose'
alias dkcup='docker-compose up'
