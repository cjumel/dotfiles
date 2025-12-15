# shellcheck disable=SC2016

zinit light Aloxaf/fzf-tab     # Should be loaded before plugins like `zsh-autosuggestions`
zstyle ':completion:*' menu no # Disable builtin tab completion menu
zstyle ':fzf-tab:*' fzf-flags \
    --height=40% \
    --bind 'ctrl-s:toggle+down' \
    --bind 'ctrl-g:top' \
    --bind 'alt-p:toggle-preview'
zstyle ':fzf-tab:complete:*' fzf-preview '
if [[ -d $realpath ]]; then
    eza -a1 --color=always --icons=always --group-directories-first $realpath
elif [[ -f $realpath ]]; then
    bat --color=always --line-range=:500 $realpath
else
    echo "$realpath"
fi
'

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
