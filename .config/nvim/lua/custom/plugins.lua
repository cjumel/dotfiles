local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git" },
	},
	{
		"phaazon/hop.nvim",
		opts = overrides.hop,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = {
			"json",
			"lua",
			"markdown",
			"python",
			"yaml",
		},
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
}

return plugins
