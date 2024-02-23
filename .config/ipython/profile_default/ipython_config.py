# Configuration file for ipython.
# See https://ipython.readthedocs.io/en/8.22.1/config/options/terminal.html# for the full list of
# options.
# The default configuration comes with many features, like <C-f>/<C-b>/<C-a>/<C-e> to move around,
# <C-n>/<C-p> to navigate history (respecting the current input), or <C-i> to trigger completion
# (and then <C-n>/<C-p> to navigate between the suggestions).

c = get_config()  # noqa # type: ignore

# Disable Copilot-like suggestions
# These suggestions are based on history, they don't provide much benefit and they add clutter to
# the terminal
c.TerminalInteractiveShell.autosuggestions_provider = None
