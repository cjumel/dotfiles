local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
  },
}

return plugins
