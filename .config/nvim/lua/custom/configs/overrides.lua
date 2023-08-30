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
		},
		file_ignore_patterns = {
			".git/",
		},
	},
}

M.hop = {
	keys = "hgjfkdlsmqyturieozpabvn",
	uppercase_labels = true,
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
