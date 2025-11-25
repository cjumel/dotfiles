eval "$(brew shellenv)" # Homebrew post-installation: set `HOMEBREW_PREFIX`, update `PATH`, `MANPATH`, `fpath` (for shell completions), etc.

export PATH="$HOMEBREW_PREFIX/opt/python@3/libexec/bin:$PATH" # Link `python3` to Homebrew's version of `python3`
export PATH="$HOME/.local/bin:$PATH"                          # Path for manually installed binaries
