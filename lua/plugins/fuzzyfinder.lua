return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "aznhe21/actions-preview.nvim" },
	init = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find files in neovim config" })
		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = "~/nixos-config/" })
		end, { desc = "Find files in nixos config" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in current directory " })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text in current directory" })
		vim.keymap.set({ "v", "n" }, "gra", require("actions-preview").code_actions, { desc = "LSP Code Actions" })
	end,
	opts = {
		defaults = {
			file_ignore_patterns = {
				"**.git/*",
				"**.gradle/*",
				"**target/*",
			},
		},
	},
}
