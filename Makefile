symlinks:
	@echo "Creating general symlinks with Stow"
	@stow --no-folding --adopt .
	@echo "Creating theme-related symlinks manually"
	@ln -sf ~/.config/tmux/theme/catppuccin-mocha/tmux-pre-tpm.conf ~/.config/tmux/theme/tmux-pre-tpm.conf
	@ln -sf ~/.config/tmux/theme/catppuccin-mocha/tmux-post-tpm.conf ~/.config/tmux/theme/tmux-post-tpm.conf
