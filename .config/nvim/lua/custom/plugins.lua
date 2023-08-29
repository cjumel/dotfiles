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
		config = function()
			require("hop").setup({})
		end,
		opts = overrides.hop,
		cmd = {
			"HopChar2",
			"HopChar1CurrentLine",
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
				"prettier",
				"pyright",
				"ruff",
				"stylua",
			},
		},
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
