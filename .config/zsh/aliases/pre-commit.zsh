alias pc='pre-commit'

alias pci='pre-commit install' # [I]nstall: install pre-commit hooks in the current Git repository

alias pcr='pre-commit run'              # [R]un: run the targeted pre-commit hook (default to all)
alias pcra='pre-commit run --all-files' # [R]un [A]ll-files: run the targeted pre-commit hook (default to all) on all files
alias pcrf='pre-commit run --files'     # [R]un [F]iles: run the targeted pre-commit hook (default to all) on the targeted files

alias pcs='pre-commit sample-config'                            # [P]re-commit [S]ample-config: display a sample configuration file
alias pcsw='pre-commit sample-config > .pre-commit-config.yaml' # [P]re-commit [S]ample-config [W]rite: write a sample configuration to a file

alias pcui='pre-commit uninstall' # [U]ninstall: uninstall pre-commit hooks from the current Git repository

alias pcup='pre-commit autoupdate' # [U]pdate: update the pre-commit hooks in the current Git repository
