install:
	@echo "Creating general configuration files symbolic links with Stow"
	@stow --no-folding .
	@echo "Creating symlinks from ~/.config to ~/ when necessary"
	@ln -sf ~/.config/git/.gitconfig ~/.gitconfig
	@ln -sf ~/.config/ideavim/.ideavimrc ~/.ideavimrc
	@ln -sf ~/.config/zsh/.zshrc ~/.zshrc
	@echo "Creating theme-related configuration files symbolink links"
	@ln -sf ~/.config/wezterm/themes/catppuccin-mocha.lua ~/.config/wezterm/theme.lua
	@ln -sf ~/.config/tmux/themes/catppuccin-mocha.conf ~/.config/tmux/theme.conf
	@ln -sf ~/.config/tmux/themes/catppuccin-mocha-post.conf ~/.config/tmux/theme-post.conf
	@ln -sf ~/.config/nvim/lua/themes/catppuccin-mocha.lua ~/.config/nvim/lua/theme.lua
