alias pc='pre-commit'

alias pci='pre-commit install' # Install in a repository

# Run pre-commit on the directory passed as argument if one is provided or on the current directory
# Note that the glob pattern doesn't work on some Ubuntu (typically on GH runners with ubuntu-latest)
function pre_commit_run_directory() {
    if [ -z "$1" ]; then # No argument provided
        pre-commit run --files ./**/*
    else
        pre-commit run --files "$1"/**/*
    fi
}

alias pcr='pre-commit run'              # Run a given pre-commit hook
alias pcra='pre-commit run --all-files' # Run pre-commit hooks on all files
alias pcrd='pre_commit_run_directory'   # Run pre-commit hooks on the directory passed as argument or on the current directory; uses `--files` under the hood
alias pcrf='pre-commit run --files'     # Run on files passed as arguments

alias pcui='pre-commit uninstall' # Uninstall from a repository

alias pcup='pre-commit autoupdate' # Update the versions of the hooks
