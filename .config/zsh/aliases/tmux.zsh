alias tm='tmux' # Base Tmux command, create a new unnamed session when used alone

alias tma='tmux attach'     # Attach: attach to a target session or the last one when used alone
alias tmat='tmux attach -t' # Attach target: attach to a session by name

alias tmd='tmux detach' # Detach: detach from the current session but don't kill it

alias tml='tmux ls' # List: list all existing sessions

alias tmn='tmux new'     # Nex: create a new session, unnamed when used alone
alias tmns='tmux new -s' # New session: create a new named sessions

alias tmk='tmux kill-session'     # Kill: kill an existing session
alias tmkt='tmux kill-session -t' # Kill target: kill an existing session by name

alias tmK='tmux kill-server' # Kill server: kill the Tmux server

alias tmr='tmux rename' # Rename: rename the current session
