local wezterm = require("wezterm")

local config = {}

-- Window
config.hide_tab_bar_if_only_one_tab = true -- No tab bar if only one tab
config.window_decorations = "RESIZE" -- No title bar but allow resizing nonetheless
config.initial_cols = 156
config.initial_rows = 42

-- Color scheme
config.color_scheme = "catppuccin-mocha"
config.window_background_opacity = 0.8

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 13.0
config.adjust_window_size_when_changing_font_size = false
-- Don't use ligatures (i.e. replace for instance '!=' with an actual not-equal symbol)
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Make possible to type option-key combinations, like "{" and "}"
config.send_composed_key_when_left_alt_is_pressed = true

-- Disable default key bindings as I don't use most of them & some are conflicting with my own
config.disable_default_key_bindings = true

-- Set the leader key
config.leader = {
  key = " ",
  mods = "OPT",
  timeout_milliseconds = 1000,
}

return config
