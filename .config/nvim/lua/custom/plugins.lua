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
  {
    "phaazon/hop.nvim",
    config = function()
      require'hop'.setup {}
    end,
    opts = overrides.hop,
    cmd = {
      "HopChar2",
      "HopWordCurrentLineAC",
      "HopWordCurrentLineBC",
      "HopLineAC",
      "HopLineBC",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
        "mypy",
        "pyright",
        "ruff",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
}

return plugins
