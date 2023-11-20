alias tm='tmux'

alias tma='tmux attach'  # Attach to last session
alias tmat='tmux attach -t'  # Attach to session with target name

alias tmd='tmux detach'

alias tml='tmux ls'

alias tmn='tmux new'  # New unnamed session
alias tmnl='tmux -f ~/dotfiles/.config/tmux/tmux_light.conf new'  # New unnamed session with light theme
alias tmns='tmux new -s'  # New named sessions
alias tmnsl='tmux -f ~/dotfiles/.config/tmux/tmux_light.conf new -s'  # New named session with light theme

alias tmk='tmux kill-session'
alias tmkt='tmux kill-session -t'  # Kill session with target name

alias tmK='tmux kill-server'

alias tmr='tmux rename'

alias tms='tmux source'
alias tmsc='tmux source ~/.config/tmux/tmux.conf'  # Source default configuration
alias tmsl='tmux source ~/dotfiles/.config/tmux/tmux_light.conf'  # Source light configuration
