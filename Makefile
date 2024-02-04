init-macos:
	@echo "Creating light configuration file for Tmux"
	@cp .config/tmux/tmux.conf .config/tmux/tmux.conf.light
	@gsed -i 's/mocha/latte/' .config/tmux/tmux.conf.light
	@echo "Creating configuration file symlinks with Stow"
	@stow .

init-ubuntu:
	@echo "Creating light configuration file for Tmux"
	@cp .config/tmux/tmux.conf .config/tmux/tmux.conf.light
	@sed -i 's/mocha/latte/' .config/tmux/tmux.conf.light
	@echo "Creating configuration file symlinks with Stow"
	@stow .
