local wezterm = require("wezterm")

local M = {}

-- Window
M.hide_tab_bar_if_only_one_tab = true -- No tab bar if only one tab
M.window_decorations = "RESIZE" -- No title bar but allow resizing nonetheless
M.initial_cols = 156
M.initial_rows = 42

-- Color scheme
M.color_scheme = "catppuccin-mocha"
M.window_background_opacity = 0.8

-- Font
M.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
M.font_size = 13.0
-- Don't use ligatures (i.e. replace for instance '!=' with an actual not-equal symbol)
M.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Make possible to type option-key combinations, like "{" and "}"
M.send_composed_key_when_left_alt_is_pressed = true

-- Set the leader key
M.leader = {
  key = " ",
  mods = "OPT",
  timeout_milliseconds = 1000,
}

return M
