# [[ Setup ]]
# Lazy-setup to avoid slowing down shell startup

export NVM_DIR="$HOME/.nvm"

function load-nvm() {
    [[ -n "$NVM_LOADED" ]] && return
    NVM_LOADED=1

    unfunction nvm node npm npx 2>/dev/null # Remove the placeholder functions
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
function load-nvm-hook() {
    [[ -e .nvmrc ]] && load-nvm
}

# Placeholder functions that load nvm on first use and then remove themselves
function nvm() {
    load-nvm
    nvm "$@"
}
function node() {
    load-nvm
    node "$@"
}
function npm() {
    load-nvm
    npm "$@"
}
function npx() {
    load-nvm
    npx "$@"
}

add-zsh-hook chpwd load-nvm-hook # On directory change
load-nvm-hook                    # On shell startup

# [[ Auto-use ]]

load-nvmrc-hook() {
    [[ -e .nvmrc ]] || return
    load-nvm
    current_node_version=$(nvm version)
    required_node_version=$(nvm version "$(\cat .nvmrc)")
    if [ "$required_node_version" = "N/A" ]; then
        nvm install
    elif [ "$required_node_version" != "$current_node_version" ]; then
        nvm use --silent
    fi
}

add-zsh-hook chpwd load-nvmrc-hook # On directory change
load-nvmrc-hook                    # On shell startup

# [[ Aliases ]]

alias nvd='nvm deactivate'
alias nvi='nvm install'
alias nvu='nvm use'
alias nvui='nvm uninstall'
