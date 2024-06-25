stow:
	@echo "Creating general symlinks with Stow"
	@stow --no-folding --adopt .
theme:
	@echo "Creating mandatory theme-related symlinks"
	@ln -s ~/.config/tmux/theme/catppuccin-mocha/tmux-pre-tpm.conf ~/.config/tmux/theme/tmux-pre-tpm.conf
	@ln -s ~/.config/tmux/theme/catppuccin-mocha/tmux-post-tpm.conf ~/.config/tmux/theme/tmux-post-tpm.conf
