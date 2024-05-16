-- In addition to the keymaps setup here, I introduced in MacOS system settings custom application
-- keyboard mappings, cmd-ctrl-f for "Enter Full Screen" and "Exit Full Screen", in order
-- to use MacOS native full screen mode, in addtion to WezTerm full screen mode.

local wezterm = require("wezterm")

local act = wezterm.action

return {
  keys = {
    -- [[ Control-command keymaps ]]
    -- Keymaps similar to MacOS builtin (e.g. <C-M-f> to toggle full screen) and which should be
    -- convenient to do with similar key strokes

    {
      key = "e", -- Enter Wezterm's full screen mode
      mods = "CMD|CTRL",
      action = act.ToggleFullScreen,
    },
    {
      key = "r",
      mods = "CMD|CTRL",
      action = act.Multiple({ act.EmitEvent("reset-options"), act.ResetFontAndWindowSize }),
    },
    {
      key = "t", -- More transparency
      mods = "CMD|CTRL",
      action = act.EmitEvent("increase-transparency"),
    },
    {
      key = "o", -- More opacity
      mods = "CMD|CTRL",
      action = act.EmitEvent("decrease-transparency"),
    },
    {
      key = "b", -- Bigger font
      mods = "CMD|CTRL",
      action = act.IncreaseFontSize,
    },
    {
      key = "s", -- Smaller font
      mods = "CMD|CTRL",
      action = act.DecreaseFontSize,
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

    -- Map unused control keymaps to the corresponding (but usable) alt keymaps
    { key = "Return", mods = "CTRL", action = wezterm.action({ SendKey = { key = "Return", mods = "ALT" } }) },
    { key = "Backspace", mods = "CTRL", action = wezterm.action({ SendKey = { key = "Backspace", mods = "ALT" } }) },
  },
  key_tables = {},
}
