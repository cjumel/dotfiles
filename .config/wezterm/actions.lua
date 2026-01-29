local options = require("options")
local theme = require("theme")
local utils = require("utils")
local wezterm = require("wezterm")

local M = {}

--- Setup the custom Wezterm actions.
---@return nil
function M.set_actions()
  wezterm.on("reset-options", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local options_ = theme.make_config(options, { force_reload = true })
    overrides = utils.concat_dicts({ overrides, options_ })
    window:set_config_overrides(overrides)
  end)

  wezterm.on("increase-opacity", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local options_ = theme.make_config(options)
    if not overrides.window_background_opacity then
      overrides.window_background_opacity = options_.window_background_opacity
    end
    local new_opacity = overrides.window_background_opacity + 0.05
    if new_opacity > 1.0 then
      new_opacity = 1.0
    end
    overrides.window_background_opacity = new_opacity
    window:set_config_overrides(overrides)
  end)
  wezterm.on("decrease-opacity", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local options_ = theme.make_config(options)
    if not overrides.window_background_opacity then
      overrides.window_background_opacity = options_.window_background_opacity
    end
    local new_opacity = overrides.window_background_opacity - 0.05
    if new_opacity < 0.0 then
      new_opacity = 0.0
    end
    overrides.window_background_opacity = new_opacity
    window:set_config_overrides(overrides)
  end)

  wezterm.on("increase-blur", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local options_ = theme.make_config(options)
    if not overrides.macos_window_background_blur then
      overrides.macos_window_background_blur = options_.macos_window_background_blur
    end
    local new_blur = overrides.macos_window_background_blur + 5
    overrides.macos_window_background_blur = new_blur
    window:set_config_overrides(overrides)
  end)
  wezterm.on("decrease-blur", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local options_ = theme.make_config(options)
    if not overrides.macos_window_background_blur then
      overrides.macos_window_background_blur = options_.macos_window_background_blur
    end
    local new_blur = overrides.macos_window_background_blur - 5
    if new_blur < 0 then
      new_blur = 0
    end
    overrides.macos_window_background_blur = new_blur
    window:set_config_overrides(overrides)
  end)
end

return M
