# [[ Setup ]]
# Lazy-setup to avoid slowing down shell startup

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

# Placeholder functions that load completions on first use and then remove themselves
function uv() {
    load-uv-completions
    uv "$@"
}
function uvx() {
    load-uv-completions
    uvx "$@"
}

add-zsh-hook chpwd load-uv-completions-hook # On directory change
load-uv-completions-hook                    # On shell startup

# [[ Aliases ]]

alias uva='uv add'
alias uvi='uv init'
alias uvl='uv lock'
alias uvp='uv pip'
alias uvpf='uv pip freeze'
alias uvpi='uv pip install'
alias uvpl='uv pip list'
alias uvps='uv pip show'
alias uvpu='uv pip uninstall'
alias uvpy='uv python'
alias uvpyi='uv python install'
alias uvpyl='uv python list'
alias uvr='uv run'
alias uvrp='uv run python'
alias uvrm='uv remove'
alias uvs='uv sync'
alias uvt='uv tool'
alias uvti='uv tool install'
alias uvtl='uv tool list'
alias uvtr='uv tool run'
alias uvtui='uv tool uninstall'
alias uvtup='uv tool upgrade'
alias uvv='uv venv'
