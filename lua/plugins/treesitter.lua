return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			parser_install_info = {
				ensure_installed = { "c3" },
				c3 = {
					install_info = {
						url = "https://github.com/c3lang/tree-sitter-c3",
						files = { "src/parser.c", "src/scanner.c" },
						branch = "main",
					},
					sync_install = false, -- Set to true if you want to install synchronously
					auto_install = true, -- Automatically install when opening a file
					filetype = "c3", -- if filetype does not match the parser name
				},
			},
		})
	end,
}
