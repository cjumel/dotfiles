# Disable unused variables diagnostics (used by zsh)
# shellcheck disable=SC2034

# [[ General configuration ]]

export LANG=en_US.UTF-8 # Make sure everything is in English
export EDITOR=nvim      # Set the default editor
export LESS=R           # Clear the content after quitting the `less` pager (e.g. when using `git log` with `less`)
bindkey -e              # Force emacs keybindings for zsh (usually the default but setting `EDITOR` to `nvim` alter this setting)

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive completion when using lowercase (like ripgrep smart case)

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

# By default, clear-screen is mapped to "^l", but "^l" is mapped to window navigation in tmux
bindkey "^o" clear-screen

# Filter search history browsing with the current command
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Insert a newline inside a command
insert-newline() {
    LBUFFER="${LBUFFER}
"
}
zle -N insert-newline
bindkey '^[[13;2u' insert-newline # <S-CR>

# Keymap to edit the command line with an editor
autoload edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line # Mnemonic: Vim
