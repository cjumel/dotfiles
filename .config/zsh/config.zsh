# Disable unused variables diagnostics (used by zsh)
# shellcheck disable=SC2034

# [[ General configuration ]]

# Make sure everything is in English
export LANG=en_US.UTF-8

# Prepend additional directories to $PATH, so that Zsh can find executables in them
export PATH="$HOME/.docker/bin:$PATH"                 # Docker & related tools
export PATH="$HOME/.local/bin:$PATH"                  # Tools installed by pipx
export PATH="/usr/local/opt/python/libexec/bin:$PATH" # Python managed by Homebrew & related tools

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive completion when using lowercase (like ripgrep smart case)

# Set options for the `less` pager like in `oh-my-zsh` to clear the screen after quitting (e.g. when using `git log`)
export LESS=R

# [[ History configuration ]]
# Documentation: https://zsh.sourceforge.io/Doc/Release/Options.html#History

HISTFILE="$HOME/.zsh_history" # History file location
HISTSIZE=10000                # Limit number of entries in memory
SAVEHIST=10000                # Limit number of entries in history file
HISTDUP=erase                 # Erase duplicates in the history file

setopt APPEND_HISTORY       # Append commands to history file instead of replacing it
setopt HIST_IGNORE_ALL_DUPS # If a new command in history list duplicates an older one, the latter is removed
setopt HIST_IGNORE_DUPS     # if a new command in history list duplicates the previous one, the former is ignored
setopt HIST_IGNORE_SPACE    # Do not record a command starting with a space; convenient for sensible commands
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks & newlines from commands; help prevent duplicates & improve fuzzy search in commands
setopt HIST_SAVE_NO_DUPS    # Do not save any older duplicate command to the history file
setopt SHARE_HISTORY        # Enable sharing history between sessions by adding & importing entries incrementally; replace `INC_APPEND_HISTORY`

# [[ Key bindings ]]

# By default, "^l" is clear-screen, but with Tmux it's remapped to window navigation, so let's remap it to something close & originally not important
bindkey "^o" clear-screen

# Filter search history browsing with the current command
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Move cursor to next/previous word
bindkey "^^" forward-word  # Actually <C-,> on my keyboard
bindkey "^_" backward-word # Actually <C-;> on my keyboard
