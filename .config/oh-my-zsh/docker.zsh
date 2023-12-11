alias dk='docker'

alias dka='open -a "Docker"' # start application

alias dkb='docker build'

# clean docker containers, images, volumes, etc.
alias dkc='
  echo "docker stop $(docker ps -a -q)..."; docker stop $(docker ps -a -q)
  echo "docker container prune --force..."; docker container prune --force
  echo "docker volume prune --force..."; docker volume prune --force
  echo "docker image prune --all --force..."; docker image prune --all --force
  echo "docker system prune --all --force..."; docker system prune --all --force
'

alias dkp='docker pull'

alias dkr='docker run'

alias dks='docker scout'
