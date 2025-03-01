return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)
		vim.keymap.set("n", "<leader>ff", builtin.find_files)
	end,
	opts = {
		defaults = {
			file_ignore_patterns = {
				"**.git/*",
				"**.gradle/*",
			},
		},
	},
}
