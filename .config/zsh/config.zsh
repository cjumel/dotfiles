# Disable unused variables diagnostics (used by zsh)
# shellcheck disable=SC2034

# [[ General configuration ]]

# Make sure everything is in English
export LANG=en_US.UTF-8

# Prepend additional directories to $PATH, so that zsh can find executables in them
export PATH="/usr/local/opt/python/libexec/bin:$PATH" # Symlink of Homebrew's latest Python & related tools
export PATH="$HOME/.local/bin:$PATH"                  # Tools installed by `pipx`, among others

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive completion when using lowercase (like ripgrep smart case)

# [[ History configuration ]]
# Many settings are taken from https://martinheinz.dev/blog/110

# Set the history file location
HISTFILE="$HOME/.zsh_history" # (default in oh-my-zsh)

# Set the limit number of entries in memory & in the history file
HISTSIZE=10000000 # Virtually unlimited
SAVEHIST=10000000 # Virtually unlimited

HISTORY_IGNORE="(history|hi)*"

HIST_STAMPS="yyyy-mm-dd" # Only relevant with `history` command, not <C-r> with `fzf`

setopt EXTENDED_HISTORY     # Write the history file in the ':start:elapsed;command' format. (default in oh-my-zsh)
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY        # Share history between all sessions. (default in oh-my-zsh)
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded again. (default in oh-my-zsh)
setopt HIST_IGNORE_ALL_DUPS # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE    # Do not record an event starting with a space. Convenient to avoid storing a command in history. (default in oh-my-zsh)
setopt HIST_SAVE_NO_DUPS    # Do not write a duplicate event to the history file.
setopt HIST_VERIFY          # Do not execute immediately upon history expansion. (default in oh-my-zsh)
setopt APPEND_HISTORY       # Append to history file (Default)
setopt HIST_NO_STORE        # Don't store history commands (like with `r`)
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from each command line being added to the history.

# [[ Key bindings ]]

# By default, "^l" is clear-screen, but with Tmux it's remapped to window navigation, so let's remap it to something close & originally not important
bindkey "^o" clear-screen

# Filter search history browsing with the current command
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Move cursor to next/previous word
bindkey "^^" forward-word  # Actually <C-,> on my keyboard
bindkey "^_" backward-word # Actually <C-;> on my keyboard
