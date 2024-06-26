# Disable warning on expression not expanding in single quotes (not relevant with zstyle calls for fzf-tab)
# shellcheck disable=SC2016

# [[ fzf-tab ]]
# `fzf-tab` provides a tab-completion implementation with `fzf`, enabling fuzzy finding & previewing candidates
# `fzf-tab` should be loaded before plugins like `zsh-autosuggestions`

zinit light Aloxaf/fzf-tab

zstyle ':completion:*' menu no                                                         # Disable builtin tab completion menu
zstyle ':fzf-tab:*' fzf-flags '--height=40%'                                           # Specify height to fzf window (prevent from being too small)
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a1 --color=always $realpath'         # Enable preview for cd command
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a1 --color=always $realpath' # Enable preview for zoxide command

# [[ Zsh standard plugins ]]
# A few standard plugins for zsh, enabling syntax highlighting (show valid/invalid commands, paths, etc.), autosuggestions (suggest
#   commands in ghost text based on command history) & additional tool completions (e.g. for `pre-commit`)

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Define keymaps for zsh-autosuggestions
# The keymaps are chosen to be similar to what I use with Copilot in Neovim, except for the use of <Tab> which is reserved for shell
#   completion
# "forward-word" or "forward-char" can be used when a suggestion is available to accept a word or character respectively
bindkey "^]" autosuggest-accept # Like "accept line" in Copilot
bindkey "^[^M" forward-word     # Actually <C-CR> on my keyboard; like "accept word" in Copilot
