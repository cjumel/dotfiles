alias st='stow --no-folding' # I only use stow with --no-folding, so let's make it the default
alias std='stow --no-folding .' # Create symlinks for all files in the current directory

alias sta='stow --no-folding --adopt' # If a file already exists at the symlink target, adopt it with its changes
alias stad='stow --no-folding --adopt .'
