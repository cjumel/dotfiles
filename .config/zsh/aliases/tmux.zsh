# [TM]ux: the terminal multiplexer

function tmux_new() {
    session_name=$(basename "$PWD")                          # Name of the current directory
    if tmux has-session -t="$session_name" 2>/dev/null; then # Don't error if the session already exists
        tmux attach-session -t="$session_name"
    else
        tmux new-session -s "$session_name"
    fi
}

alias tm='tmux_new' # [TM]ux: create a new session named using the current directory name (shortcut for `tmux new`)

alias tma='tmux attach'     # [TM]ux [A]ttach: attach to the most recently used session
alias tmat='tmux attach -t' # [TM]ux [A]ttach [T]arget: attach to a target session

alias tmd='tmux detach' # [TM]ux [D]etach: detach from the current session

alias tml='tmux ls 2>/dev/null || echo "No tmux session is running"' # [TM]ux [L]ist: list all running sessions

alias tmn='tmux_new'     # [TM]ux [N]ew: create a new session named using the current directory name
alias tmns='tmux new -s' # [TM]ux [N]ew [S]ession: create a new named session

alias tmk='tmux kill-session'     # [TM]ux [K]ill: kill the most recently used session
alias tmkt='tmux kill-session -t' # [TM]ux [K]ill [T]arget: kill a target session
alias tmks='tmux kill-server'     # [TM]ux [K]ill [S]erver: kill the Tmux server

alias tmr='tmux rename' # [TM]ux [R]ename: rename the current session
