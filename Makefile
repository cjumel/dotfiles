stow:
	@echo "Creating general symlinks with Stow"
	@stow --no-folding --adopt .
theme:
	@echo "Creating theme-related symlinks"
	@ln -sf ~/.config/wezterm/theme/catppuccin-mocha.lua ~/.config/wezterm/theme/current.lua
	@ln -sf ~/.config/tmux/theme/catppuccin-mocha/tmux-pre-tpm.conf ~/.config/tmux/theme/tmux-pre-tpm.conf
	@ln -sf ~/.config/tmux/theme/catppuccin-mocha/tmux-post-tpm.conf ~/.config/tmux/theme/tmux-post-tpm.conf
	@ln -sf ~/.config/nvim/lua/theme/catppuccin-mocha.lua ~/.config/nvim/lua/theme/current.lua
