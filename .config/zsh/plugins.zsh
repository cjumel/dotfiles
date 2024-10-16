# Disable warning on expression not expanding in single quotes (not relevant with zstyle calls for fzf-tab)
# shellcheck disable=SC2016

# [[ fzf-tab ]]
# `fzf-tab` provides a tab-completion implementation with `fzf`, enabling fuzzy finding & previewing candidates
# `fzf-tab` should be loaded before plugins like `zsh-autosuggestions`

zinit light Aloxaf/fzf-tab

zstyle ':completion:*' menu no # Disable builtin tab completion menu

# Specify the `fzf` options to use (note that the ones specify in `FZF_DEFAULT_OPTS` will not be taken into account):
#   - add a specified height, to prevent the `fzf` window from being too small when a few items are suggested
#   - add some keybindings also defined in `fzf`
zstyle ':fzf-tab:*' fzf-flags \
    --height=40% \
    --bind 'ctrl-]:toggle-preview' \
    --bind 'ctrl-g:top' \
    --bind 'ctrl-^:forward-word' \
    --bind 'ctrl-_:backward-word'

# Enable directory preview (with `eza`) for the main builtin commands to manipulate files and directories and their third-party
#   alternatives. This cannot be enabled for all commannds, as it would be annoying for commands which don't accept files or directories
#   (like `git`, which only accepts sub-commands, like `status`).
export FZF_TAB_DIR_PREVIEW='eza -a1 --color=always --icons=always --group-directories-first $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:bat:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:cd:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:cp:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:du:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:dust:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:ls:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:eza:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:mv:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"
zstyle ':fzf-tab:complete:rm:*' fzf-preview "$FZF_TAB_DIR_PREVIEW"

# [[ Zsh standard plugins ]]
# A few standard plugins for zsh, enabling syntax highlighting (show valid/invalid commands, paths, etc.), autosuggestions (suggest
#   commands in ghost text based on command history) & additional tool completions (e.g. for `pre-commit`)
# Keymaps for zsh-autosuggestions are:
#   - <C-e>, or "end-of-line" widget, with the cursor at the end of the line will accept the whole suggestion
#   - <C-f>, or "forward-char" widget, with the cursor at the end of the line will also accept the whole suggestion
#   - <C-^> (actually <C-,> o my keyboard), or "forward-word" widget, with the cursor at the end of the line will accept the suggestion
#       word by word

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
