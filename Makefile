install:
	@echo "Creating file .gitconfig.remote"
	@bash ./scripts/create_gitconfig_remote.sh
	@echo "Creating file tmux.conf.light"
	@bash ./scripts/create_tmux_conf_light.sh
	@echo "Creating symbolic links"
	@stow .
