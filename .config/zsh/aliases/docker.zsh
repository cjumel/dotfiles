# [D]oc[K]er: containerization platform for building, shipping, and running applications

function docker_clean() {
    echo "docker stop $(docker ps -a -q)..."
    docker stop "$(docker ps -a -q)"
    echo "docker container prune --force..."
    docker container prune --force
    echo "docker volume prune --force..."
    docker volume prune --force
    echo "docker image prune --all --force..."
    docker image prune --all --force
    echo "docker system prune --all --force..."
    docker system prune --all --force
}

alias dkb='docker build'     # [B]uild: build an image from a Dockerfile
alias dkc='docker_clean'     # [C]lean: stop all containers, remove all containers, volumes, images, etc.
alias dkd='open -a "Docker"' # [D]esktop: open the Docker Desktop application
alias dkp='docker pull'      # [P]ull: pull an image or a repository from a registry
alias dkr='docker run'       # [R]un: run a command in a new container
alias dks='docker scout'     # [S]cout: scout for Docker images on DockerHub

# [D]ocker-[C]ompose: articulate multi-container Docker applications

alias dcb='docker-compose build'             # [B]uild: build or rebuild services
alias dcbn='docker-compose build --no-cache' # [B]uild [N]o-cache: build or rebuild services without using cache
alias dcr='docker-compose run'               # [R]un: run a one-off command in a service
alias dcu='docker-compose up'                # [U]p: create & start containers
alias dcud='docker-compose up --detach'      # [U]p [D]etach: create & start containers in the background
