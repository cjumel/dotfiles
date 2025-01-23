symlinks:
	@echo "Creating general symlinks with Stow"
	@stow --no-folding --adopt .
	@echo "Creating theme-related symlinks manually"
	@ln -sf ~/.config/tmux/theme/tmux-default.conf ~/.config/tmux/theme/tmux-current.conf
