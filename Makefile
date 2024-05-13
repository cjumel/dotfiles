install:
	@echo "Creating general configuration files symbolic links with Stow"
	@stow --no-folding .
	@echo "Creating theme-related configuration files symbolink links"
	@ln -sf ~/.config/wezterm/theme/catppuccin-mocha.lua ~/.config/wezterm/theme/current.lua
	@ln -sf ~/.config/tmux/themes/tmux-catppuccin-mocha.conf ~/.config/tmux/tmux-theme.conf
	@ln -sf ~/.config/tmux/themes/tmux-catppuccin-mocha-post.conf ~/.config/tmux/tmux-theme-post.conf
	@ln -sf ~/.config/nvim/lua/themes/catppuccin-mocha.lua ~/.config/nvim/lua/_theme.lua
