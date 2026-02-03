return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local icons = require("which-key.icons")

		table.insert(icons.rules, { pattern = "git", icon = "󰊢 ", color = "red" })
	end,
}
