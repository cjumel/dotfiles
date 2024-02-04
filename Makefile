init-macos:
	@echo "Creating light configuration file for Tmux"
	@cp .config/tmux/tmux.conf .config/tmux/tmux.conf.light
	@gsed -i 's/mocha/latte/' .config/tmux/tmux.conf.light
	@echo "Creating remote Git configuration file"
	@cp .gitconfig .gitconfig.remote
	@gsed -i 's/\[credential\]//' .gitconfig.remote
	@gsed -i 's/helper = osxkeychain//' .gitconfig.remote
	@gsed -i 's/\[user\]//' .gitconfig.remote
	@gsed -i 's/name = clementjumel//' .gitconfig.remote
	@gsed -i 's/email = clement.jumel@gmail.com//' .gitconfig.remote
	@echo "Cloning the Neovim configuration repository"
	@rm -rf .config/nvim
	@git clone https://github.com/clementjumel/kickstart.nvim .config/nvim
	@echo "Creating configuration file symlinks with Stow"
	@stow .

init-ubuntu:
	@echo "Creating light configuration file for Tmux"
	@cp .config/tmux/tmux.conf .config/tmux/tmux.conf.light
	@sed -i 's/mocha/latte/' .config/tmux/tmux.conf.light
	@echo "Creating remote Git configuration file"
	@cp .gitconfig .gitconfig.remote
	@sed -i 's/\[credential\]//' .gitconfig.remote
	@sed -i 's/helper = osxkeychain//' .gitconfig.remote
	@sed -i 's/\[user\]//' .gitconfig.remote
	@sed -i 's/name = clementjumel//' .gitconfig.remote
	@sed -i 's/email = clement.jumel@gmail.com//' .gitconfig.remote
	@echo "Cloning the Neovim configuration repository"
	@rm -rf .config/nvim
	@git clone https://github.com/clementjumel/kickstart.nvim .config/nvim
	@echo "Creating configuration file symlinks with Stow"
	@stow .
