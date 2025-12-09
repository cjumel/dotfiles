# Lazy-load uv and uvx completions to avoid slowing down shell startup

function load-uv-completions() {
    [[ -n "$UV_COMPLETIONS_LOADED" ]] && return
    UV_COMPLETIONS_LOADED=1

    unfunction uv uvx 2>/dev/null # Remove the placeholder functions
    eval "$(uv generate-shell-completion zsh)"
    eval "$(uvx --generate-shell-completion zsh)"
}
function load-uv-completions-hook() {
    [[ -e uv.lock ]] && load-uv-completions
}

# Define placeholder functions that load completions on first use (which then removes the placeholders)
uv() {
    load-uv-completions
    uv "$@"
}
uvx() {
    load-uv-completions
    uvx "$@"
}

add-zsh-hook chpwd load-uv-completions-hook # On directory change
load-uv-completions-hook                    # On shell startup
