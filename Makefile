install:
	@echo "Creating file .gitconfig.remote"
	@bash ./scripts/create_gitconfig_remote.sh
	@echo "Creating symbolic links"
	@stow .
