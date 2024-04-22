local wezterm = require("wezterm")

wezterm.on("increase-transparency", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  end
  local new_opacity = overrides.window_background_opacity - 0.05
  if new_opacity < 0.0 then
    new_opacity = 0.0
  end
  overrides.window_background_opacity = new_opacity
  window:set_config_overrides(overrides)
end)

wezterm.on("decrease-transparency", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.8
  end
  local new_opacity = overrides.window_background_opacity + 0.05
  if new_opacity > 1.0 then
    new_opacity = 1.0
  end
  overrides.window_background_opacity = new_opacity
  window:set_config_overrides(overrides)
end)

wezterm.on("reset-theme", function(window, _)
  local overrides = window:get_config_overrides() or {}

  local utils = require("utils")
  local ok, theme = pcall(require, "theme") -- Handle the case the theme file is missing
  if not ok then
    theme = {}
  end
  overrides = utils.concat_dicts({ overrides, theme })

  window:set_config_overrides(overrides)
end)
