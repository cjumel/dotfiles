# Homebrew post-installation: set HOMEBREW_PREFIX, update PATH, MANPATH, fpath (for shell completions), etc.
eval "$(brew shellenv)"

# Append to PATH a directory where some tools (e.g. uv) install binaries and where I manually put some (e.g. neovim)
# This must not be prepended to PATH, as uv's Python versions are not suitable to be used without uv (e.g. `python -m venv .venv` and `pip install ...` will throw an error with uv's Python versions)
export PATH="$PATH:$HOME/.local/bin"
