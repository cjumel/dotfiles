# [[ Aliases ]]

function _tmux-new-or-attach() {
    local dir=$(basename "$PWD")
    if tmux has-session -t="$dir" 2>/dev/null; then # Avoid error if the session already exists
        tmux attach-session -t="$dir"
    else
        tmux new-session -s "$dir"
    fi
}
alias tm='_tmux-new-or-attach'
alias tma='tmux attach'
alias tmd='tmux detach'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session'
alias tmks='tmux kill-server'
alias tmn='tmux new'
alias tmr='tmux rename'
