# Zinit plugins

zinit light Aloxaf/fzf-tab # Should be loaded before `zsh-autosuggestions`
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-flags \
    --height=40% \
    --bind 'ctrl-s:toggle+down' \
    --bind 'ctrl-g:top'

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
