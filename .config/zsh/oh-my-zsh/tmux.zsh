alias t='tmux new'

alias tm='tmux'

alias tma='tmux attach'  # Attach to last session
alias tmat='tmux attach -t'  # Attach to session with target name

alias tmd='tmux detach'

alias tml='tmux ls'

alias tmn='tmux new'  # New unnamed session
alias tmns='tmux new -s'  # New named sessions

alias tmk='tmux kill-session'
alias tmkt='tmux kill-session -t'  # Kill session with target name

alias tmK='tmux kill-server'

alias tmr='tmux rename'

alias tms='tmux source'
alias tmsd='tmux source ~/.config/tmux/tmux.conf'  # Source default configuration
