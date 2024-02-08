# Aliases to manage terminal-wide themes for WezTerm, Tmux and Neovim.

available_themes='catppuccin-frappe
catppuccin-frappe-vintage
catppuccin-macchiato
catppuccin-macchiato-vintage
catppuccin-mocha
catppuccin-mocha-vintage
catppuccin-latte
catppuccin-latte-vintage'

function change_theme(){
  # Make the user select a theme using fzf among the available ones
  selected_theme=$(echo $available_themes| fzf)

  # Exit if no theme is selected, to avoid creating broken symlinks
  if [[ -z $selected_theme ]]; then
    return
  fi

  # Create symlinks to the selected theme (overwrite existing ones)
  ln -sf ~/.config/wezterm/themes/$selected_theme.lua ~/.config/wezterm/theme.lua
  ln -sf ~/.config/tmux/themes/$selected_theme.conf ~/.config/tmux/theme.conf
  ln -sf ~/.config/nvim/lua/themes/$selected_theme.lua ~/.config/nvim/lua/theme.lua

  # WezTerm will detect the change and reload automatically; otherwise, it can be reloaded manually
  # with Cmd+R
  # Neovim will be updated automatically when restarting it
  # Source tmux configuration to apply the new theme
  tmux source ~/.config/tmux/tmux.conf
}

alias th='change_theme'
