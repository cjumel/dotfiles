# [[ Theme ]]
# Provide features to manage terminal-level themes

TERMINAL_THEMES="default
catppuccin-macchiato
catppuccin-mocha
catppuccin-frappe
catppuccin-latte
everforest-dark
everforest-light
gruvbox-dark
gruvbox-material
gruvbox-light
kanagawa-wave
kanagawa-dragon
kanagawa-lotus
onedark
onelight
rose-pine-moon
rose-pine-main
rose-pine-dawn
tokyonight-moon
tokyonight-night
tokyonight-storm
tokyonight-day"

# Change theme: prompt the user to select a new terminal theme & set it up
function ct() {
    selected_theme=$(echo "$TERMINAL_THEMES" | fzf --prompt="Theme > " --no-sort)
    if [[ -z $selected_theme ]]; then
        return
    fi

    ln -sf ~/.config/wezterm/theme/"$selected_theme".lua ~/.config/wezterm/theme/current.lua
    ln -sf ~/.config/tmux/theme/tmux-"$selected_theme".conf ~/.config/tmux/theme/tmux-current.conf
    ln -sf ~/.config/nvim/lua/config/theme/"$selected_theme".lua ~/.config/nvim/lua/config/theme/current.lua
}
