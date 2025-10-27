BREW_PREFIX="$(brew --prefix)"

export PATH="$BREW_PREFIX/bin:$PATH"                      # Make Homebrew binaries take precedence over default system ones
export PATH="$BREW_PREFIX/opt/python@3/libexec/bin:$PATH" # Define unvesioned `python` symlinks
export PATH="$HOME/.local/bin:$PATH"                      # Manually installed binaries
export PATH="$HOME/.docker/bin:$PATH"                     # Docker binaries
