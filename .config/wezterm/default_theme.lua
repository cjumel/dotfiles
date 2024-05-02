local config = {}

config.color_scheme = "catppuccin-mocha"
config.window_background_opacity = 0.9
-- Ligatures are the feature which replace for instance successive "!" & "=" with an actual not-equal symbol
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Don't use ligatures

return config
