alias st='stow'
alias std='stow .' # Create symlinks for all files in the current directory

alias sta='stow --adopt' # If a file already exists at the symlink target, adopt it with its changes
alias stad='stow --adopt .'

alias stn='stow --no-folding' # Force stow to create symlinks for all individual files
alias stnd='stow --no-folding .'

alias stan='stop --adopt --no-folding'
alias stand='stop --adopt --no-folding .'
