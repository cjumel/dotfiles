# Start nvim depending on the directory content
function nvim_contextual() {
    if [ -e poetry.lock ]; then
        poetry run nvim "$@"
    else
        nvim "$@"
    fi
}

alias vi='nvim_contextual'
alias vis='nvim' # Skip contextual setup
