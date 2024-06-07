local wezterm = require("wezterm")

local act = wezterm.action

return {
  keys = {
    -- [[ Control-command keymaps ]]
    -- Keymaps to manipulate the terminal application

    {
      key = "x", -- Discard changes & reset terminal to default
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
    -- Enable some control keymaps with special characters by sending the right string given an input sequence
    -- This is inspired by https://github.com/wez/wezterm/issues/3180, & for terminal codes supported by Neovim see
    -- https://www.reddit.com/r/neovim/comments/okbag3/how_can_i_remap_ctrl_backspace_to_delete_a_word/
    --
    -- Some control keymaps with special characters are already working:
    --  - <C-^> on my keyboard corresponds to <C-[> (escape)
    --  - <C-$> on my keyboard corresponds to <C-]>
    --  - <C-`> on my keyboard corresponds to <C-\>

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
