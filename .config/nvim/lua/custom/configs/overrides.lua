local M = {}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},
	renderer = {
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!**/.git/*",
		},
	},
}

M.hop = {
	keys = "etovxqpdygfblzhckisuran",
}

M.mason = {
	ensure_installed = {
		"black",
		"isort",
		"mypy",
		"prettier",
		"pyright",
		"ruff",
		"stylua",
	},
}

return M
