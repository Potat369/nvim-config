return {
	"rebelot/kanagawa.nvim",
	init = function()
		vim.cmd("colorscheme kanagawa-dragon")
	end,
	opts = {
		overrides = function(colors)
			local theme = colors.theme
			return {
				LineNr = { fg = theme.syn.string },
				LineNrAbove = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
				LineNrBelow = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
			}
		end,
	},
}
