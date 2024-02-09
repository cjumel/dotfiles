-- In addition to the keymaps setup here, I introduced in MacOS system settings custom application
-- keyboard mappings, cmd-ctrl-f for "Enter Full Screen" and "Exit Full Screen", in order
-- to use MacOS native full screen mode, in addtion to WezTerm full screen mode (with opt+enter).

local wezterm = require("wezterm")

return {
  {
    -- Move-to-screen keymap causes WezTerm's window to change size, this keymap is convenient to
    -- reset it to the default size
    key = "r",
    mods = "CMD|CTRL",
    action = wezterm.action.ResetFontAndWindowSize,
  },
  {
    key = "t",
    mods = "LEADER",
    action = wezterm.action.EmitEvent("toggle-transparency"),
  },
}
