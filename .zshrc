# Disable unused variables diagnostics (used by zsh)
# shellcheck disable=SC2034

# [[ General configuration ]]

# Manually set language environment
export LANG=en_US.UTF-8

# Prepend to $PATH
# - the `$HOME/.local` part comes from fd's installation guide
# - the `/usr/local/opt/python` part comes from brew when installing Python
export PATH="$HOME/.local/bin:/usr/local/opt/python/libexec/bin:$PATH"

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

# Setup oh-my-zsh
[ -f ~/.config/oh-my-zsh/oh-my-zsh.zsh ] && source ~/.config/oh-my-zsh/oh-my-zsh.zsh

# [[ Key bindings ]]

# Descrease the time out after pressing a key to remove the delay after pressing escape
KEYTIMEOUT=1

# Make <C-p>/<C-n> filter with the terminal entry when browsing the history
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Use escape to clear the screen
bindkey "\e" clear-screen

# "^^" & "^_" are actually <C-,> & <C-;> respectively on my keyboard
bindkey "^^" forward-word
bindkey "^_" backward-word

# [[ Additional configuration scripts ]]
# The following will run configuration scripts for additional tools, but only if the files exist

[ -f ~/.config/bat/bat.zsh ] && source ~/.config/bat/bat.zsh
[ -f ~/.config/dust/dust.zsh ] && source ~/.config/dust/dust.zsh
[ -f ~/.config/eza/eza.zsh ] && source ~/.config/eza/eza.zsh
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/.config/ipython/ipython.zsh ] && source ~/.config/ipython/ipython.zsh
[ -f ~/.config/pypoetry/pypoetry.zsh ] && source ~/.config/pypoetry/pypoetry.zsh
[ -f ~/.config/ripgrep/ripgrep.zsh ] && source ~/.config/ripgrep/ripgrep.zsh
[ -f ~/.config/starship/starship.zsh ] && source ~/.config/starship/starship.zsh
[ -f ~/.config/tldr/tldr.zsh ] && source ~/.config/tldr/tldr.zsh
[ -f ~/.config/tmux/tmux.zsh ] && source ~/.config/tmux/tmux.zsh
[ -f ~/.config/zoxide/zoxide.zsh ] && source ~/.config/zoxide/zoxide.zsh
