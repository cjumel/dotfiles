-- In addition to the keymaps setup here, I introduced in MacOS system settings custom application
-- keyboard mappings, cmd-ctrl-f for "Enter Full Screen" and "Exit Full Screen", in order
-- to use MacOS native full screen mode, in addtion to WezTerm full screen mode.

local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("toggle-opacity", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on("toggle-transparency", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

return {
  -- [[ Control-command keymaps ]]
  -- Keymaps similar to MacOS builtin (e.g. <C-M-f> to toggle full screen) and which should be
  -- convenient to do with similar key strokes

  {
    -- Move-to-screen keymap (ctrl-cmd-m) causes WezTerm's window to change size, this keymap is
    -- convenient to reset it to the default size
    key = "r",
    mods = "CMD|CTRL",
    action = act.ResetFontAndWindowSize,
  },

  -- [[ Leader keymaps ]]

  {
    key = "f",
    mods = "LEADER",
    action = act.ToggleFullScreen,
  },
  {
    key = "o",
    mods = "LEADER",
    action = act.EmitEvent("toggle-opacity"),
  },
  {
    key = "t",
    mods = "LEADER",
    action = act.EmitEvent("toggle-transparency"),
  },

  -- [[ Control keymaps ]]
  -- Enable some control keymaps with special characters by sending the right string given an
  -- input sequence
  -- This is inspired from: https://github.com/wez/wezterm/issues/3180
  -- See here for terminal codes supported by Neovim:
  -- https://www.reddit.com/r/neovim/comments/okbag3/how_can_i_remap_ctrl_backspace_to_delete_a_word/

  -- Some control keymaps with special characters are already working:
  -- - <C-^> on my keyboard corresponds to <C-[> (escape)
  -- - <C-$> on my keyboard corresponds to <C-]>
  -- - <C-`> on my keyboard corresponds to <C-\>
  {
    key = "phys:Quote", -- % key on my keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x7f" }), -- <C-?> code (delete)
  },
  {
    key = "phys:M", -- , key on my keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1e" }), -- <C-^> code
  },
  {
    key = "phys:Comma", -- ; key on my keyboard
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1f" }), -- <C-_> code
  },
}
