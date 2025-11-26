local wezterm = require("wezterm")

local config = {}

-- [[ Window ]]
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE" -- Hide title bar
config.initial_cols = 156
config.initial_rows = 42
config.window_background_opacity = 1.0
config.macos_window_background_blur = 10
config.window_close_confirmation = "NeverPrompt"
config.colors = {} -- Reset colors in favor of the theme's one

-- [[ Font ]]
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 12.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Remove ligatures
config.adjust_window_size_when_changing_font_size = false

-- [[ Keys ]]
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

return config
