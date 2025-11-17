return {
	{
		"Hrumble/smart-splitter.nvim",
		config = function()
			require("smartsplit.smart-split").setup({
				priority = "split",
			})
		end,
	},
}
