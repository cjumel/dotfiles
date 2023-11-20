alias tm='tmux'
alias tml='tmux -f ~/dotfiles/.config/tmux/tmux_light.conf'  # Use light configuration

alias tma='tmux attach'  # Attach to last session
alias tmat='tmux attach -t'  # Attach to session with target name

alias tmd='tmux detach'

alias tml='tmux ls'

alias tmn='tmux new'
alias tmns='tmux new -s'  # New session with name
alias tmln='tmux -f ~/dotfiles/.config/tmux/tmux_light.conf new'
alias tmlns='tmux -f ~/dotfiles/.config/tmux/tmux_light.conf new -s'

alias tmk='tmux kill-session'
alias tmkt='tmux kill-session -t'  # Kill session with target name

alias tmK='tmux kill-server'

alias tmr='tmux rename'

alias tms='tmux source'
alias tmsc='tmux source ~/.config/tmux/tmux.conf'  # Source default configuration
alias tmsl='tmux source ~/.config/tmux/tmux_light.conf'  # Source light configuration
