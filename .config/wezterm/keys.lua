-- In addition to the keymaps setup here, I introduced in MacOS system settings custom application
-- keyboard mappings, cmd-ctrl-f for "Enter Full Screen" and "Exit Full Screen", in order
-- to use MacOS native full screen mode, in addtion to WezTerm full screen mode (with opt+enter).

local wezterm = require("wezterm")

return {
  -- [[ Fixes ]]

  -- Fix control-key combinations with special characters
  -- To be able to type them, these have been remapped with Karabiner, here we make the bridge
  -- between the codes sent by Karabiner and the wanted terminal codes
  -- Solution is inspired from here: https://github.com/wez/wezterm/issues/3180
  -- See here for the supported terminal codes:
  -- https://www.reddit.com/r/neovim/comments/okbag3/how_can_i_remap_ctrl_backspace_to_delete_a_word/
  { -- From <C-%> on my keyboard to <C-_>
    key = "_",
    mods = "CTRL|SHIFT",
    action = wezterm.action({ SendString = "\x1f" }),
  },
  { -- From <C-`> on my keyboard to <C-^>
    key = "6",
    mods = "CTRL|SHIFT",
    action = wezterm.action({ SendString = "\x1e" }),
  },
  { -- From <C-[> on my keyboard to <C-]>
    key = "$",
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x1d" }),
  },

  -- [[ Control-command keymaps ]]

  {
    -- Move-to-screen keymap (control-command m) causes WezTerm's window to change size, this
    -- keymap is convenient to reset it to the default size
    key = "r",
    mods = "CMD|CTRL",
    action = wezterm.action.ResetFontAndWindowSize,
  },

  -- [[ Leader keymaps ]]

  {
    key = "o",
    mods = "LEADER",
    action = wezterm.action.EmitEvent("toggle-opacity"),
  },
  {
    key = "t",
    mods = "LEADER",
    action = wezterm.action.EmitEvent("toggle-transparency"),
  },
}
