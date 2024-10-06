# Change the behavior of the default `tmux new` command, which name sessions with "0", "1", "2", etc. by default, to use the current
# directory name instead
function tmux_new() {
    session_name=$(basename "$PWD") # Name of the current directory
    tmux new-session -s "$session_name"
}

alias tm='tmux_new' # Create a new session named using the current directory name (shortcut for `tmux new`)

alias tma='tmux attach'     # [A]ttach: attach to the most recently used session
alias tmat='tmux attach -t' # [A]ttach [T]arget: attach to a target session

alias tmd='tmux detach' # [D]etach: detach from the current session

alias tml='tmux ls' # [L]ist: list all running sessions

alias tmn='tmux_new'     # [N]ew: create a new session named using the current directory name
alias tmns='tmux new -s' # [N]ew [S]ession: create a new named session

alias tmk='tmux kill-session'     # [K]ill: kill the most recently used session
alias tmkt='tmux kill-session -t' # [K]ill [T]arget: kill a target session
alias tmks='tmux kill-server'     # [K]ill [S]erver: kill the Tmux server

alias tmr='tmux rename' # [R]ename: rename the current session
